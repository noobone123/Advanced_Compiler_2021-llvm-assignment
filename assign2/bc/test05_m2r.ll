; ModuleID = 'test05.ll'
source_filename = "test05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !9 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %1, metadata !15, metadata !DIExpression()), !dbg !14
  %3 = add nsw i32 %0, %1, !dbg !16
  ret i32 %3, !dbg !17
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !18 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.value(metadata i32 %1, metadata !21, metadata !DIExpression()), !dbg !20
  %3 = sub nsw i32 %0, %1, !dbg !22
  ret i32 %3, !dbg !23
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0) #0 !dbg !24 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !29, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !31, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !32, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !33, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !34, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 1, metadata !35, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 2, metadata !36, metadata !DIExpression()), !dbg !28
  %2 = icmp sge i32 %0, 3, !dbg !37
  br i1 %2, label %3, label %4, !dbg !39

3:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !32, metadata !DIExpression()), !dbg !28
  br label %4, !dbg !40

4:                                                ; preds = %3, %1
  %.02 = phi i32 (i32, i32)* [ @plus, %3 ], [ null, %1 ], !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.02, metadata !32, metadata !DIExpression()), !dbg !28
  %5 = icmp sge i32 %0, 4, !dbg !42
  br i1 %5, label %6, label %7, !dbg !44

6:                                                ; preds = %4
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !32, metadata !DIExpression()), !dbg !28
  br label %7, !dbg !45

7:                                                ; preds = %6, %4
  %.1 = phi i32 (i32, i32)* [ @minus, %6 ], [ %.02, %4 ], !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.1, metadata !32, metadata !DIExpression()), !dbg !28
  %8 = icmp sge i32 %0, 5, !dbg !47
  br i1 %8, label %9, label %10, !dbg !49

9:                                                ; preds = %7
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.1, metadata !33, metadata !DIExpression()), !dbg !28
  br label %10, !dbg !50

10:                                               ; preds = %9, %7
  %.01 = phi i32 (i32, i32)* [ %.1, %9 ], [ null, %7 ], !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.01, metadata !33, metadata !DIExpression()), !dbg !28
  %11 = icmp sge i32 %0, 6, !dbg !52
  br i1 %11, label %12, label %13, !dbg !54

12:                                               ; preds = %10
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.01, metadata !34, metadata !DIExpression()), !dbg !28
  br label %13, !dbg !55

13:                                               ; preds = %12, %10
  %.0 = phi i32 (i32, i32)* [ %.01, %12 ], [ null, %10 ], !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.0, metadata !34, metadata !DIExpression()), !dbg !28
  %14 = icmp ne i32 (i32, i32)* %.1, null, !dbg !56
  br i1 %14, label %15, label %17, !dbg !58

15:                                               ; preds = %13
  %16 = call i32 %.0(i32 1, i32 2), !dbg !59
  call void @llvm.dbg.value(metadata i32 %16, metadata !61, metadata !DIExpression()), !dbg !63
  br label %17, !dbg !64

17:                                               ; preds = %15, %13
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test05.c", directory: "/home/hikonaka/compiler_2021/hw_2/assign2/test")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!9 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !10, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 2, type: !12)
!14 = !DILocation(line: 0, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 2, type: !12)
!16 = !DILocation(line: 3, column: 12, scope: !9)
!17 = !DILocation(line: 3, column: 4, scope: !9)
!18 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !10, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 6, type: !12)
!20 = !DILocation(line: 0, scope: !18)
!21 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 6, type: !12)
!22 = !DILocation(line: 7, column: 12, scope: !18)
!23 = !DILocation(line: 7, column: 4, scope: !18)
!24 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 10, type: !25, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!12, !12}
!27 = !DILocalVariable(name: "x", arg: 1, scope: !24, file: !1, line: 10, type: !12)
!28 = !DILocation(line: 0, scope: !24)
!29 = !DILocalVariable(name: "a_fptr", scope: !24, file: !1, line: 11, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!31 = !DILocalVariable(name: "s_fptr", scope: !24, file: !1, line: 12, type: !30)
!32 = !DILocalVariable(name: "t_fptr", scope: !24, file: !1, line: 13, type: !30)
!33 = !DILocalVariable(name: "q_fptr", scope: !24, file: !1, line: 14, type: !30)
!34 = !DILocalVariable(name: "r_fptr", scope: !24, file: !1, line: 15, type: !30)
!35 = !DILocalVariable(name: "op1", scope: !24, file: !1, line: 17, type: !12)
!36 = !DILocalVariable(name: "op2", scope: !24, file: !1, line: 17, type: !12)
!37 = !DILocation(line: 19, column: 11, scope: !38)
!38 = distinct !DILexicalBlock(scope: !24, file: !1, line: 19, column: 9)
!39 = !DILocation(line: 19, column: 9, scope: !24)
!40 = !DILocation(line: 21, column: 5, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !1, line: 19, column: 17)
!42 = !DILocation(line: 22, column: 11, scope: !43)
!43 = distinct !DILexicalBlock(scope: !24, file: !1, line: 22, column: 9)
!44 = !DILocation(line: 22, column: 9, scope: !24)
!45 = !DILocation(line: 24, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 22, column: 17)
!47 = !DILocation(line: 25, column: 11, scope: !48)
!48 = distinct !DILexicalBlock(scope: !24, file: !1, line: 25, column: 9)
!49 = !DILocation(line: 25, column: 9, scope: !24)
!50 = !DILocation(line: 27, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !1, line: 25, column: 17)
!52 = !DILocation(line: 28, column: 11, scope: !53)
!53 = distinct !DILexicalBlock(scope: !24, file: !1, line: 28, column: 9)
!54 = !DILocation(line: 28, column: 9, scope: !24)
!55 = !DILocation(line: 29, column: 8, scope: !53)
!56 = !DILocation(line: 32, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !24, file: !1, line: 32, column: 9)
!58 = !DILocation(line: 32, column: 9, scope: !24)
!59 = !DILocation(line: 33, column: 26, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !1, line: 32, column: 25)
!61 = !DILocalVariable(name: "result", scope: !60, file: !1, line: 33, type: !62)
!62 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!63 = !DILocation(line: 0, scope: !60)
!64 = !DILocation(line: 34, column: 5, scope: !60)
!65 = !DILocation(line: 35, column: 4, scope: !24)
