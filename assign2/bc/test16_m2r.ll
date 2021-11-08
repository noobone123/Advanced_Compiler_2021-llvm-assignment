; ModuleID = 'test16.ll'
source_filename = "test/test16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever() #0 !dbg !7 {
  call void @llvm.dbg.value(metadata i32 0, metadata !11, metadata !DIExpression()), !dbg !12
  %1 = call i32 @plus(i32 0, i32 10), !dbg !13
  %2 = call i32 @minus(i32 %1, i32 2), !dbg !14
  call void @llvm.dbg.value(metadata i32 %2, metadata !11, metadata !DIExpression()), !dbg !12
  %3 = call i32 @plus(i32 %2, i32 2), !dbg !15
  %4 = icmp ne i32 %3, 0, !dbg !15
  br i1 %4, label %5, label %7, !dbg !15

5:                                                ; preds = %0
  %6 = call i32 @minus(i32 6, i32 %2), !dbg !16
  br label %8, !dbg !15

7:                                                ; preds = %0
  br label %8, !dbg !15

8:                                                ; preds = %7, %5
  %9 = phi i32 [ %6, %5 ], [ 0, %7 ], !dbg !15
  call void @llvm.dbg.value(metadata i32 %9, metadata !11, metadata !DIExpression()), !dbg !12
  ret i32 %9, !dbg !17
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !18 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.value(metadata i32 %1, metadata !23, metadata !DIExpression()), !dbg !22
  %3 = sub nsw i32 %0, %1, !dbg !24
  ret i32 %3, !dbg !25
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !26 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 %1, metadata !29, metadata !DIExpression()), !dbg !28
  %3 = add nsw i32 %0, %1, !dbg !30
  ret i32 %3, !dbg !31
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test/test16.c", directory: "/home/hikonaka/compiler_2021/hw_2/assign2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!7 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 6, type: !8, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 8, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocation(line: 9, column: 13, scope: !7)
!14 = !DILocation(line: 9, column: 7, scope: !7)
!15 = !DILocation(line: 10, column: 7, scope: !7)
!16 = !DILocation(line: 10, column: 17, scope: !7)
!17 = !DILocation(line: 11, column: 5, scope: !7)
!18 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 14, type: !19, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!10, !10, !10}
!21 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 14, type: !10)
!22 = !DILocation(line: 0, scope: !18)
!23 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 14, type: !10)
!24 = !DILocation(line: 16, column: 13, scope: !18)
!25 = !DILocation(line: 16, column: 5, scope: !18)
!26 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 18, type: !19, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocalVariable(name: "a", arg: 1, scope: !26, file: !1, line: 18, type: !10)
!28 = !DILocation(line: 0, scope: !26)
!29 = !DILocalVariable(name: "b", arg: 2, scope: !26, file: !1, line: 18, type: !10)
!30 = !DILocation(line: 20, column: 13, scope: !26)
!31 = !DILocation(line: 20, column: 5, scope: !26)
