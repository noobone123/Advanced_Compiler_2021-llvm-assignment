; ModuleID = 'test00.ll'
source_filename = "test00.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !7 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %1, metadata !13, metadata !DIExpression()), !dbg !12
  %3 = add nsw i32 %0, %1, !dbg !14
  ret i32 %3, !dbg !15
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever() #0 !dbg !16 {
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !19, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 1, metadata !22, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 2, metadata !23, metadata !DIExpression()), !dbg !21
  %1 = call i32 @plus(i32 1, i32 2), !dbg !24
  call void @llvm.dbg.value(metadata i32 %1, metadata !25, metadata !DIExpression()), !dbg !21
  ret i32 0, !dbg !27
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test00.c", directory: "/home/hikonaka/compiler_2021/hw_2/assign2/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!7 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 2, column: 12, scope: !7)
!15 = !DILocation(line: 2, column: 4, scope: !7)
!16 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 5, type: !17, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{!10}
!19 = !DILocalVariable(name: "a_fptr", scope: !16, file: !1, line: 6, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!21 = !DILocation(line: 0, scope: !16)
!22 = !DILocalVariable(name: "op1", scope: !16, file: !1, line: 8, type: !10)
!23 = !DILocalVariable(name: "op2", scope: !16, file: !1, line: 8, type: !10)
!24 = !DILocation(line: 10, column: 23, scope: !16)
!25 = !DILocalVariable(name: "result", scope: !16, file: !1, line: 10, type: !26)
!26 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 11, column: 5, scope: !16)
