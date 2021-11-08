; ModuleID = 'test18.bc'
source_filename = "test/test18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @use() #0 !dbg !7 {
  %1 = call i32 (...) @clever(), !dbg !11
  ret i32 %1, !dbg !12
}

declare dso_local i32 @clever(...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !13 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !18, metadata !DIExpression()), !dbg !19
  %5 = load i32, i32* %3, align 4, !dbg !20
  %6 = load i32, i32* %4, align 4, !dbg !21
  %7 = sub nsw i32 %5, %6, !dbg !22
  ret i32 %7, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !24 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !27, metadata !DIExpression()), !dbg !28
  %5 = load i32, i32* %3, align 4, !dbg !29
  %6 = load i32, i32* %4, align 4, !dbg !30
  %7 = add nsw i32 %5, %6, !dbg !31
  ret i32 %7, !dbg !32
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test/test18.c", directory: "/home/hikonaka/compiler_2021/hw_2/assign2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!7 = distinct !DISubprogram(name: "use", scope: !1, file: !1, line: 6, type: !8, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocation(line: 8, column: 12, scope: !7)
!12 = !DILocation(line: 8, column: 5, scope: !7)
!13 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !14, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{!10, !10, !10}
!16 = !DILocalVariable(name: "a", arg: 1, scope: !13, file: !1, line: 10, type: !10)
!17 = !DILocation(line: 10, column: 15, scope: !13)
!18 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !1, line: 10, type: !10)
!19 = !DILocation(line: 10, column: 21, scope: !13)
!20 = !DILocation(line: 12, column: 12, scope: !13)
!21 = !DILocation(line: 12, column: 14, scope: !13)
!22 = !DILocation(line: 12, column: 13, scope: !13)
!23 = !DILocation(line: 12, column: 5, scope: !13)
!24 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 14, type: !14, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DILocalVariable(name: "a", arg: 1, scope: !24, file: !1, line: 14, type: !10)
!26 = !DILocation(line: 14, column: 14, scope: !24)
!27 = !DILocalVariable(name: "b", arg: 2, scope: !24, file: !1, line: 14, type: !10)
!28 = !DILocation(line: 14, column: 21, scope: !24)
!29 = !DILocation(line: 16, column: 12, scope: !24)
!30 = !DILocation(line: 16, column: 14, scope: !24)
!31 = !DILocation(line: 16, column: 13, scope: !24)
!32 = !DILocation(line: 16, column: 5, scope: !24)
