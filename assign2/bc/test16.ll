; ModuleID = 'test16.bc'
source_filename = "test/test16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever() #0 !dbg !7 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 0, i32* %1, align 4, !dbg !12
  %2 = load i32, i32* %1, align 4, !dbg !13
  %3 = call i32 @plus(i32 %2, i32 10), !dbg !14
  %4 = call i32 @minus(i32 %3, i32 2), !dbg !15
  store i32 %4, i32* %1, align 4, !dbg !16
  %5 = load i32, i32* %1, align 4, !dbg !17
  %6 = call i32 @plus(i32 %5, i32 2), !dbg !18
  %7 = icmp ne i32 %6, 0, !dbg !18
  br i1 %7, label %8, label %11, !dbg !18

8:                                                ; preds = %0
  %9 = load i32, i32* %1, align 4, !dbg !19
  %10 = call i32 @minus(i32 6, i32 %9), !dbg !20
  br label %12, !dbg !18

11:                                               ; preds = %0
  br label %12, !dbg !18

12:                                               ; preds = %11, %8
  %13 = phi i32 [ %10, %8 ], [ 0, %11 ], !dbg !18
  store i32 %13, i32* %1, align 4, !dbg !21
  %14 = load i32, i32* %1, align 4, !dbg !22
  ret i32 %14, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !24 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !29, metadata !DIExpression()), !dbg !30
  %5 = load i32, i32* %3, align 4, !dbg !31
  %6 = load i32, i32* %4, align 4, !dbg !32
  %7 = sub nsw i32 %5, %6, !dbg !33
  ret i32 %7, !dbg !34
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !35 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !38, metadata !DIExpression()), !dbg !39
  %5 = load i32, i32* %3, align 4, !dbg !40
  %6 = load i32, i32* %4, align 4, !dbg !41
  %7 = add nsw i32 %5, %6, !dbg !42
  ret i32 %7, !dbg !43
}

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
!12 = !DILocation(line: 8, column: 9, scope: !7)
!13 = !DILocation(line: 9, column: 18, scope: !7)
!14 = !DILocation(line: 9, column: 13, scope: !7)
!15 = !DILocation(line: 9, column: 7, scope: !7)
!16 = !DILocation(line: 9, column: 6, scope: !7)
!17 = !DILocation(line: 10, column: 12, scope: !7)
!18 = !DILocation(line: 10, column: 7, scope: !7)
!19 = !DILocation(line: 10, column: 25, scope: !7)
!20 = !DILocation(line: 10, column: 17, scope: !7)
!21 = !DILocation(line: 10, column: 6, scope: !7)
!22 = !DILocation(line: 11, column: 12, scope: !7)
!23 = !DILocation(line: 11, column: 5, scope: !7)
!24 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 14, type: !25, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!10, !10, !10}
!27 = !DILocalVariable(name: "a", arg: 1, scope: !24, file: !1, line: 14, type: !10)
!28 = !DILocation(line: 14, column: 15, scope: !24)
!29 = !DILocalVariable(name: "b", arg: 2, scope: !24, file: !1, line: 14, type: !10)
!30 = !DILocation(line: 14, column: 21, scope: !24)
!31 = !DILocation(line: 16, column: 12, scope: !24)
!32 = !DILocation(line: 16, column: 14, scope: !24)
!33 = !DILocation(line: 16, column: 13, scope: !24)
!34 = !DILocation(line: 16, column: 5, scope: !24)
!35 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 18, type: !25, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocalVariable(name: "a", arg: 1, scope: !35, file: !1, line: 18, type: !10)
!37 = !DILocation(line: 18, column: 14, scope: !35)
!38 = !DILocalVariable(name: "b", arg: 2, scope: !35, file: !1, line: 18, type: !10)
!39 = !DILocation(line: 18, column: 21, scope: !35)
!40 = !DILocation(line: 20, column: 12, scope: !35)
!41 = !DILocation(line: 20, column: 14, scope: !35)
!42 = !DILocation(line: 20, column: 13, scope: !35)
!43 = !DILocation(line: 20, column: 5, scope: !35)
