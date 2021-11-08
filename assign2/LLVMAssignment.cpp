//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#include <llvm/Support/CommandLine.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/Support/ToolOutputFile.h>

#include <llvm/Transforms/Scalar.h>
#include <llvm/Transforms/Utils.h>

#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Argument.h>
#include <llvm/IR/User.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/Pass.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/Support/raw_ostream.h>

#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/Bitcode/BitcodeWriter.h>

#include <algorithm>

using namespace llvm;
static ManagedStatic<LLVMContext> GlobalContext;
static LLVMContext &getGlobalContext() { return *GlobalContext; }
/* In LLVM 5.0, when  -O0 passed to clang , the functions generated with clang will
 * have optnone attribute which would lead to some transform passes disabled, like mem2reg.
 */
struct EnableFunctionOptPass: public FunctionPass {
    static char ID;
    EnableFunctionOptPass():FunctionPass(ID){}
    bool runOnFunction(Function & F) override{
        if(F.hasFnAttribute(Attribute::OptimizeNone))
        {
            F.removeFnAttr(Attribute::OptimizeNone);
        }
        return true;
    }
};

char EnableFunctionOptPass::ID=0;

	
///!TODO TO BE COMPLETED BY YOU FOR ASSIGNMENT 2
///Updated 11/10/2017 by fargo: make all functions
///processed by mem2reg before this pass.
struct FuncPtrPass : public ModulePass {
  static char ID; // Pass identification, replacement for typeid
  // a line may contains several function name
  std::map<int, std::vector<std::string>> f_n_maps;
  std::vector<std::string> fnames;

  FuncPtrPass() : ModulePass(ID) {}

    void print_maps() {
      for (auto iter1 = f_n_maps.begin(); iter1 != f_n_maps.end(); iter1++) {
        errs() << iter1->first << " : ";
        for (auto iter2 = iter1->second.begin(); iter2 != iter1->second.end() - 1; iter2++)
          errs() << (*iter2) << ", ";
        errs() << *(iter1->second.end() - 1) << "\n";
      }
    }

    void get_callee(CallInst* callinst) {
      Function *func = callinst->getCalledFunction();
      Value *value = callinst->getCalledOperand();

      fnames.clear();
      // errs() << "++++++++++++++++++++\n";
      // errs() << (*callinst) << "\n";
      int line_num = callinst->getDebugLoc().getLine();
      // errs() << line_num << "\n";
      // errs() << "++++++++++++++++++++\n";

      // if there has a direct call
      if (func) {
        std::string func_name = func->getName().str();
        if (func_name != std::string("llvm.dbg.value")) {
          // errs() << "func_name: " << func_name << "\n";
          // if did not find line number in result
          if (f_n_maps.find(line_num) == f_n_maps.end()) {
            fnames.push_back(func_name);
            f_n_maps.insert(std::pair<int, std::vector<std::string>>(line_num, fnames));
          } else {
            auto iterator = f_n_maps.find(line_num);
            iterator->second.push_back(func_name);
          }
        }
      }
      // if there don't have a direct call 
      else {
        // errs() << "[+] get_callee callinst: " << (*callinst) << "\n";
        if (PHINode *phi = dyn_cast<PHINode>(value)) {
          // errs() << "[+] get_callee phiNode_handler: " << (*phi) << "\n";
          phiNode_handler(phi);
        } else if (Argument *arg = dyn_cast<Argument>(value)) {
          //errs() << "[+] get_callee arg_handler: " << (*arg) << "\n";
          //errs() << "[+] called father is: " << callinst->getParent()->getParent()->getName().str() << "\n";
          arg_handler(arg);
        } else if (CallInst *call = dyn_cast<CallInst>(value)) {
          //errs() << "[+] get_callee call_handler: " << (*call) << "\n";
          call_handler(call);
        }

        if (!fnames.empty())
          f_n_maps.insert(std::pair<int, std::vector<std::string>>(line_num, fnames));
      }
    }

    void call_handler(CallInst *callinst) {
      //errs() << "[+] call_handler callinst: " << (*callinst) << "\n";
      Function *func = callinst->getCalledFunction();
      if (func) {
        //errs() << "[+] call_handler function: " << (*func) << "\n";
        function_handler(func);
      } else {
        Value *v = callinst->getCalledOperand();
        //errs() << "[+] call_handler callinst->value: " << (*v) << "\n";
        call_handler2(v);
      }
    }

    void call_handler2(Value *v) {
      if (PHINode *phi = dyn_cast<PHINode>(v)) {
        // errs() << "call_handler2: phinode\n";
        for (User *phi_users : phi->users()) {
          // errs() << (*phi_users) << "\n";
          if (CallInst *call_inst = dyn_cast<CallInst>(phi_users)) {
            unsigned int arg_num = call_inst->getNumArgOperands();
            for (unsigned int i = 0; i < arg_num; i++) {
              Value *value = call_inst->getArgOperand(i);
              value_handler(value);
            }
          }
        }
      }
    }

    void arg_handler(Argument *arg) {
      // errs() << (*arg) << "\n";
      // args is the argument of function
      // index is the array_index of argument (begin from 0)
      int index = arg->getArgNo();
      // parent is the function which contain this argument
      Function *parent = arg->getParent();
      //errs() << "[+] Parent is: " << (*parent) << "\n";
      // users is the call instruction's / ... which call the function
      for (User *f_usrs : parent->users())
      {
        //errs() << "[+] arg_handler f_usrs: " << (*f_usrs) << "\n";
        if (CallInst *callinst = dyn_cast<CallInst>(f_usrs)) {
          // like example test17.c
          if (callinst->getCalledFunction() != parent) {
            Function *func = callinst->getCalledFunction();
            for (auto bi = func->begin(); bi != func->end(); bi++)
              for (auto ii = bi->begin(); ii != bi->end(); ii++)
              {
                Instruction *inst = dyn_cast<Instruction>(ii);
                if (ReturnInst *retinst = dyn_cast<ReturnInst>(inst))
                  if (CallInst *callinst = dyn_cast<CallInst>(retinst->getReturnValue()))
                    value_handler(callinst->getArgOperand(index));
              }
          // other examples
          } else {
            Value *v = callinst->getArgOperand(index);
            value_handler(v);
          }
        }
      }
    }

    void value_handler(Value *v) {
      if (PHINode *phi = dyn_cast<PHINode>(v)) 
        phiNode_handler(phi);
      else if (Argument *arg = dyn_cast<Argument>(v))
        arg_handler(arg);
      else if (Function *func = dyn_cast<Function>(v)) {
        auto func_name = func->getName().str();
        if (!funcname_exist(func_name))
          fnames.push_back(func_name);
      }
    }

    void function_handler(Function *func) {
      for (auto bi = func->begin(); bi != func->end(); bi++)
        for (auto ii = bi->begin(); ii != bi->end(); ii++)
        {
          if (ReturnInst *retinst = dyn_cast<ReturnInst>(ii))
          {
            Value *value = retinst->getReturnValue();
            if (Argument *arg = dyn_cast<Argument>(value))
              arg_handler(arg);
          }
        }
    }
    
    // check phi node's condition.
    // if there is always a true
    // then delete death block    
    void check_phiNode_condition(PHINode *phi) {
      // remove_block is -1 do not remove any block, or is remove_block's index
      int remove_block = -1;
      for (auto bi = phi->block_begin(); bi != phi->block_end(); bi++) {
        BasicBlock *bb = *bi;
        BasicBlock *pre_bb = bb->getSinglePredecessor();
        if (pre_bb) {
          for (auto ii = pre_bb->begin(); ii != pre_bb->end(); ii++) {
            if (BranchInst *brinst = dyn_cast<BranchInst>(ii)) {
              
              // all of following is calculating the possible value of condition
              Value *cond = brinst->getCondition();

              if (!cond)
                return;

              if (ICmpInst *cmpinst = dyn_cast<ICmpInst>(cond)) {
                // get operands of cmpinst
                Value *firstop = cmpinst->getOperand(0);
                Value *secondop = cmpinst->getOperand(1);

                if (!firstop || !secondop)
                  return;
                
                if (cmpinst->getPredicate() == llvm::CmpInst::Predicate::ICMP_SGT)
                {
                  if (dyn_cast<ConstantInt>(firstop) && dyn_cast<ConstantInt>(secondop))
                  {
                    ConstantInt *CI1 = dyn_cast<ConstantInt>(firstop);
                    ConstantInt *CI2 = dyn_cast<ConstantInt>(secondop);
                    int op1 = CI1->getSExtValue();
                    int op2 = CI2->getSExtValue();
                    if (op1 > op2)
                      remove_block = 1;
                    else
                      remove_block = 0;
                  }
                }
              }
            }
          }
          break;
        }
      }
      
      // errs() << "remove_block index is: " << remove_block << "\n";
      if (remove_block >= 0) {
        // errs() << "need to remove block\n";
        phi->removeIncomingValue(remove_block);
      } else {
        return;
      }
    }

    void phiNode_handler(PHINode *phi) {
      // errs() << "++++++++++++++++++++\n";
      // errs() << (*phi) << "\n";
      check_phiNode_condition(phi);

      for (Value *value : phi->incoming_values()) {
        // value->print(errs());
        // errs() << "\n+++++++++\n";
        // if is also a phi node
        if (auto pphi = dyn_cast<PHINode>(value)) {
          phiNode_handler(pphi);
        }
        // if is a function
        else if (auto func = dyn_cast<Function>(value)) {
          auto func_name = func->getName().str();
          if (!funcname_exist(func_name))
            fnames.push_back(func_name);
        }
        // if incoming value is a argument
        else if (auto arg = dyn_cast<Argument>(value)) {
          arg_handler(arg);
        }
      }
    }
    
    bool funcname_exist(std::string &str) {
      auto res = find(fnames.begin(), fnames.end(), str);
      if (res == fnames.end())
        return false;
      else
        return true;
    }

    bool runOnModule(Module &M) override {
      // M.print(llvm::errs(), nullptr);
      // M.dump();
      // dump have some problems

      // for each functions in module
      for (Module::iterator fi = M.begin(); fi != M.end(); fi++) {
        for (Function::iterator bi = fi->begin(); bi != fi->end(); bi++) {
          for (BasicBlock::iterator ii = bi->begin(); ii != bi->end(); ii++) {
            Instruction *inst = dyn_cast<Instruction>(ii);
            if (CallInst *callinst = dyn_cast<CallInst>(inst))
              get_callee(callinst);
          }
        }
      }
      print_maps();
      return false;
    }
};


// This line defines the name of the pass, in the command line,
// and help string for user to know about the pass
char FuncPtrPass::ID = 0;
static RegisterPass<FuncPtrPass> X("funcptrpass", "Print function call instruction");

static cl::opt<std::string>
InputFilename(cl::Positional,
              cl::desc("<filename>.bc"),
              cl::init(""));


int main(int argc, char **argv) {
   LLVMContext &Context = getGlobalContext();
   SMDiagnostic Err;
   // Parse the command line to read the Inputfilename
   cl::ParseCommandLineOptions(argc, argv,
                              "FuncPtrPass \n My first LLVM too which does not do much.\n");


   // Load the input module
   std::unique_ptr<Module> M = parseIRFile(InputFilename, Err, Context);
   if (!M) {
      Err.print(argv[0], errs());
      return 1;
   }

   llvm::legacy::PassManager Passes;
   	
   ///Remove functions' optnone attribute in LLVM5.0
   /// If optnone attribute is open, then most transform pass can not be adopted
   Passes.add(new EnableFunctionOptPass());
   ///Transform it to SSA
   Passes.add(llvm::createPromoteMemoryToRegisterPass());

   /// Your pass to print Function and Call Instructions
   Passes.add(new FuncPtrPass());
   Passes.run(*M.get());
}

