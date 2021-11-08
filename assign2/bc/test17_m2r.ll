; ModuleID = 'test17.ll'
source_filename = "test/test17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever() #0 !dbg !7 {
  call void @llvm.dbg.value(metadata i32 0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 0, metadata !13, metadata !DIExpression()), !dbg !15
  br label %1, !dbg !16

1:                                                ; preds = %11, %0
  %.01 = phi i32 [ 0, %0 ], [ %12, %11 ], !dbg !15
  %.0 = phi i32 [ 0, %0 ], [ %.1, %11 ], !dbg !12
  call void @llvm.dbg.value(metadata i32 %.0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %.01, metadata !13, metadata !DIExpression()), !dbg !15
  %2 = icmp slt i32 %.01, 10, !dbg !17
  br i1 %2, label %3, label %13, !dbg !19

3:                                                ; preds = %1
  %4 = srem i32 %.01, 2, !dbg !20
  %5 = icmp ne i32 %4, 0, !dbg !20
  br i1 %5, label %6, label %8, !dbg !23

6:                                                ; preds = %3
  %7 = call i32 @plus(i32 %.0, i32 %.01), !dbg !24
  call void @llvm.dbg.value(metadata i32 %7, metadata !11, metadata !DIExpression()), !dbg !12
  br label %10, !dbg !25

8:                                                ; preds = %3
  %9 = call i32 @minus(i32 %.0, i32 %.01), !dbg !26
  call void @llvm.dbg.value(metadata i32 %9, metadata !11, metadata !DIExpression()), !dbg !12
  br label %10

10:                                               ; preds = %8, %6
  %.1 = phi i32 [ %7, %6 ], [ %9, %8 ], !dbg !27
  call void @llvm.dbg.value(metadata i32 %.1, metadata !11, metadata !DIExpression()), !dbg !12
  br label %11, !dbg !28

11:                                               ; preds = %10
  %12 = add nsw i32 %.01, 1, !dbg !29
  call void @llvm.dbg.value(metadata i32 %12, metadata !13, metadata !DIExpression()), !dbg !15
  br label %1, !dbg !30, !llvm.loop !31

13:                                               ; preds = %1
  ret i32 %.0, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !34 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 %1, metadata !39, metadata !DIExpression()), !dbg !38
  %3 = add nsw i32 %0, %1, !dbg !40
  ret i32 %3, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !42 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 %1, metadata !45, metadata !DIExpression()), !dbg !44
  %3 = sub nsw i32 %0, %1, !dbg !46
  ret i32 %3, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 ()* %0) #0 !dbg !48 {
  call void @llvm.dbg.value(metadata i32 ()* %0, metadata !52, metadata !DIExpression()), !dbg !53
  %2 = call i32 %0(), !dbg !54
  ret i32 %2, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i32 (i32 ()*)* %0, i32 ()* %1) #0 !dbg !56 {
  call void @llvm.dbg.value(metadata i32 (i32 ()*)* %0, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i32 ()* %1, metadata !62, metadata !DIExpression()), !dbg !61
  %3 = call i32 %0(i32 ()* %1), !dbg !63
  ret i32 %3, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @use() #0 !dbg !65 {
  call void @llvm.dbg.value(metadata i32 (i32 (i32 ()*)*, i32 ()*)* @moo, metadata !66, metadata !DIExpression()), !dbg !68
  %1 = call i32 @moo(i32 (i32 ()*)* @foo, i32 ()* @clever), !dbg !69
  ret i32 %1, !dbg !70
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test/test17.c", directory: "/home/hikonaka/compiler_2021/hw_2/assign2")
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
!13 = !DILocalVariable(name: "i", scope: !14, file: !1, line: 9, type: !10)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 5)
!15 = !DILocation(line: 0, scope: !14)
!16 = !DILocation(line: 9, column: 9, scope: !14)
!17 = !DILocation(line: 9, column: 18, scope: !18)
!18 = distinct !DILexicalBlock(scope: !14, file: !1, line: 9, column: 5)
!19 = !DILocation(line: 9, column: 5, scope: !14)
!20 = !DILocation(line: 11, column: 13, scope: !21)
!21 = distinct !DILexicalBlock(scope: !22, file: !1, line: 11, column: 12)
!22 = distinct !DILexicalBlock(scope: !18, file: !1, line: 10, column: 5)
!23 = !DILocation(line: 11, column: 12, scope: !22)
!24 = !DILocation(line: 12, column: 15, scope: !21)
!25 = !DILocation(line: 12, column: 13, scope: !21)
!26 = !DILocation(line: 14, column: 15, scope: !21)
!27 = !DILocation(line: 0, scope: !21)
!28 = !DILocation(line: 15, column: 5, scope: !22)
!29 = !DILocation(line: 9, column: 23, scope: !18)
!30 = !DILocation(line: 9, column: 5, scope: !18)
!31 = distinct !{!31, !19, !32}
!32 = !DILocation(line: 15, column: 5, scope: !14)
!33 = !DILocation(line: 16, column: 5, scope: !7)
!34 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 37, type: !35, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!10, !10, !10}
!37 = !DILocalVariable(name: "a", arg: 1, scope: !34, file: !1, line: 37, type: !10)
!38 = !DILocation(line: 0, scope: !34)
!39 = !DILocalVariable(name: "b", arg: 2, scope: !34, file: !1, line: 37, type: !10)
!40 = !DILocation(line: 39, column: 13, scope: !34)
!41 = !DILocation(line: 39, column: 5, scope: !34)
!42 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 33, type: !35, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "a", arg: 1, scope: !42, file: !1, line: 33, type: !10)
!44 = !DILocation(line: 0, scope: !42)
!45 = !DILocalVariable(name: "b", arg: 2, scope: !42, file: !1, line: 33, type: !10)
!46 = !DILocation(line: 35, column: 13, scope: !42)
!47 = !DILocation(line: 35, column: 5, scope: !42)
!48 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 18, type: !49, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!10, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!52 = !DILocalVariable(name: "pf_ptr", arg: 1, scope: !48, file: !1, line: 18, type: !51)
!53 = !DILocation(line: 0, scope: !48)
!54 = !DILocation(line: 20, column: 12, scope: !48)
!55 = !DILocation(line: 20, column: 5, scope: !48)
!56 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 23, type: !57, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!10, !59, !51}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!60 = !DILocalVariable(name: "uf_ptr", arg: 1, scope: !56, file: !1, line: 23, type: !59)
!61 = !DILocation(line: 0, scope: !56)
!62 = !DILocalVariable(name: "pf_ptr", arg: 2, scope: !56, file: !1, line: 23, type: !51)
!63 = !DILocation(line: 25, column: 12, scope: !56)
!64 = !DILocation(line: 25, column: 5, scope: !56)
!65 = distinct !DISubprogram(name: "use", scope: !1, file: !1, line: 27, type: !8, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "uf_ptr", scope: !65, file: !1, line: 29, type: !67)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!68 = !DILocation(line: 0, scope: !65)
!69 = !DILocation(line: 31, column: 9, scope: !65)
!70 = !DILocation(line: 31, column: 2, scope: !65)
