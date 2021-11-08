; ModuleID = 'test17.bc'
source_filename = "test/test17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 0, i32* %1, align 4, !dbg !12
  call void @llvm.dbg.declare(metadata i32* %2, metadata !13, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %2, align 4, !dbg !15
  br label %3, !dbg !16

3:                                                ; preds = %19, %0
  %4 = load i32, i32* %2, align 4, !dbg !17
  %5 = icmp slt i32 %4, 10, !dbg !19
  br i1 %5, label %6, label %22, !dbg !20

6:                                                ; preds = %3
  %7 = load i32, i32* %2, align 4, !dbg !21
  %8 = srem i32 %7, 2, !dbg !24
  %9 = icmp ne i32 %8, 0, !dbg !24
  br i1 %9, label %10, label %14, !dbg !25

10:                                               ; preds = %6
  %11 = load i32, i32* %1, align 4, !dbg !26
  %12 = load i32, i32* %2, align 4, !dbg !27
  %13 = call i32 @plus(i32 %11, i32 %12), !dbg !28
  store i32 %13, i32* %1, align 4, !dbg !29
  br label %18, !dbg !30

14:                                               ; preds = %6
  %15 = load i32, i32* %1, align 4, !dbg !31
  %16 = load i32, i32* %2, align 4, !dbg !32
  %17 = call i32 @minus(i32 %15, i32 %16), !dbg !33
  store i32 %17, i32* %1, align 4, !dbg !34
  br label %18

18:                                               ; preds = %14, %10
  br label %19, !dbg !35

19:                                               ; preds = %18
  %20 = load i32, i32* %2, align 4, !dbg !36
  %21 = add nsw i32 %20, 1, !dbg !36
  store i32 %21, i32* %2, align 4, !dbg !36
  br label %3, !dbg !37, !llvm.loop !38

22:                                               ; preds = %3
  %23 = load i32, i32* %1, align 4, !dbg !40
  ret i32 %23, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !42 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !47, metadata !DIExpression()), !dbg !48
  %5 = load i32, i32* %3, align 4, !dbg !49
  %6 = load i32, i32* %4, align 4, !dbg !50
  %7 = add nsw i32 %5, %6, !dbg !51
  ret i32 %7, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !53 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !56, metadata !DIExpression()), !dbg !57
  %5 = load i32, i32* %3, align 4, !dbg !58
  %6 = load i32, i32* %4, align 4, !dbg !59
  %7 = sub nsw i32 %5, %6, !dbg !60
  ret i32 %7, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 ()* %0) #0 !dbg !62 {
  %2 = alloca i32 ()*, align 8
  store i32 ()* %0, i32 ()** %2, align 8
  call void @llvm.dbg.declare(metadata i32 ()** %2, metadata !66, metadata !DIExpression()), !dbg !67
  %3 = load i32 ()*, i32 ()** %2, align 8, !dbg !68
  %4 = call i32 %3(), !dbg !68
  ret i32 %4, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i32 (i32 ()*)* %0, i32 ()* %1) #0 !dbg !70 {
  %3 = alloca i32 (i32 ()*)*, align 8
  %4 = alloca i32 ()*, align 8
  store i32 (i32 ()*)* %0, i32 (i32 ()*)** %3, align 8
  call void @llvm.dbg.declare(metadata i32 (i32 ()*)** %3, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 ()* %1, i32 ()** %4, align 8
  call void @llvm.dbg.declare(metadata i32 ()** %4, metadata !76, metadata !DIExpression()), !dbg !77
  %5 = load i32 (i32 ()*)*, i32 (i32 ()*)** %3, align 8, !dbg !78
  %6 = load i32 ()*, i32 ()** %4, align 8, !dbg !79
  %7 = call i32 %5(i32 ()* %6), !dbg !78
  ret i32 %7, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @use() #0 !dbg !81 {
  %1 = alloca i32 (i32 (i32 ()*)*, i32 ()*)*, align 8
  call void @llvm.dbg.declare(metadata i32 (i32 (i32 ()*)*, i32 ()*)** %1, metadata !82, metadata !DIExpression()), !dbg !84
  store i32 (i32 (i32 ()*)*, i32 ()*)* @moo, i32 (i32 (i32 ()*)*, i32 ()*)** %1, align 8, !dbg !85
  %2 = load i32 (i32 (i32 ()*)*, i32 ()*)*, i32 (i32 (i32 ()*)*, i32 ()*)** %1, align 8, !dbg !86
  %3 = call i32 %2(i32 (i32 ()*)* @foo, i32 ()* @clever), !dbg !86
  ret i32 %3, !dbg !87
}

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
!12 = !DILocation(line: 8, column: 9, scope: !7)
!13 = !DILocalVariable(name: "i", scope: !14, file: !1, line: 9, type: !10)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 5)
!15 = !DILocation(line: 9, column: 13, scope: !14)
!16 = !DILocation(line: 9, column: 9, scope: !14)
!17 = !DILocation(line: 9, column: 17, scope: !18)
!18 = distinct !DILexicalBlock(scope: !14, file: !1, line: 9, column: 5)
!19 = !DILocation(line: 9, column: 18, scope: !18)
!20 = !DILocation(line: 9, column: 5, scope: !14)
!21 = !DILocation(line: 11, column: 12, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !1, line: 11, column: 12)
!23 = distinct !DILexicalBlock(scope: !18, file: !1, line: 10, column: 5)
!24 = !DILocation(line: 11, column: 13, scope: !22)
!25 = !DILocation(line: 11, column: 12, scope: !23)
!26 = !DILocation(line: 12, column: 20, scope: !22)
!27 = !DILocation(line: 12, column: 22, scope: !22)
!28 = !DILocation(line: 12, column: 15, scope: !22)
!29 = !DILocation(line: 12, column: 14, scope: !22)
!30 = !DILocation(line: 12, column: 13, scope: !22)
!31 = !DILocation(line: 14, column: 21, scope: !22)
!32 = !DILocation(line: 14, column: 23, scope: !22)
!33 = !DILocation(line: 14, column: 15, scope: !22)
!34 = !DILocation(line: 14, column: 14, scope: !22)
!35 = !DILocation(line: 15, column: 5, scope: !23)
!36 = !DILocation(line: 9, column: 23, scope: !18)
!37 = !DILocation(line: 9, column: 5, scope: !18)
!38 = distinct !{!38, !20, !39}
!39 = !DILocation(line: 15, column: 5, scope: !14)
!40 = !DILocation(line: 16, column: 12, scope: !7)
!41 = !DILocation(line: 16, column: 5, scope: !7)
!42 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 37, type: !43, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!10, !10, !10}
!45 = !DILocalVariable(name: "a", arg: 1, scope: !42, file: !1, line: 37, type: !10)
!46 = !DILocation(line: 37, column: 14, scope: !42)
!47 = !DILocalVariable(name: "b", arg: 2, scope: !42, file: !1, line: 37, type: !10)
!48 = !DILocation(line: 37, column: 21, scope: !42)
!49 = !DILocation(line: 39, column: 12, scope: !42)
!50 = !DILocation(line: 39, column: 14, scope: !42)
!51 = !DILocation(line: 39, column: 13, scope: !42)
!52 = !DILocation(line: 39, column: 5, scope: !42)
!53 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 33, type: !43, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "a", arg: 1, scope: !53, file: !1, line: 33, type: !10)
!55 = !DILocation(line: 33, column: 15, scope: !53)
!56 = !DILocalVariable(name: "b", arg: 2, scope: !53, file: !1, line: 33, type: !10)
!57 = !DILocation(line: 33, column: 21, scope: !53)
!58 = !DILocation(line: 35, column: 12, scope: !53)
!59 = !DILocation(line: 35, column: 14, scope: !53)
!60 = !DILocation(line: 35, column: 13, scope: !53)
!61 = !DILocation(line: 35, column: 5, scope: !53)
!62 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 18, type: !63, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!10, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!66 = !DILocalVariable(name: "pf_ptr", arg: 1, scope: !62, file: !1, line: 18, type: !65)
!67 = !DILocation(line: 18, column: 14, scope: !62)
!68 = !DILocation(line: 20, column: 12, scope: !62)
!69 = !DILocation(line: 20, column: 5, scope: !62)
!70 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 23, type: !71, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!10, !73, !65}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!74 = !DILocalVariable(name: "uf_ptr", arg: 1, scope: !70, file: !1, line: 23, type: !73)
!75 = !DILocation(line: 23, column: 15, scope: !70)
!76 = !DILocalVariable(name: "pf_ptr", arg: 2, scope: !70, file: !1, line: 23, type: !65)
!77 = !DILocation(line: 23, column: 42, scope: !70)
!78 = !DILocation(line: 25, column: 12, scope: !70)
!79 = !DILocation(line: 25, column: 19, scope: !70)
!80 = !DILocation(line: 25, column: 5, scope: !70)
!81 = distinct !DISubprogram(name: "use", scope: !1, file: !1, line: 27, type: !8, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "uf_ptr", scope: !81, file: !1, line: 29, type: !83)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!84 = !DILocation(line: 29, column: 8, scope: !81)
!85 = !DILocation(line: 30, column: 8, scope: !81)
!86 = !DILocation(line: 31, column: 9, scope: !81)
!87 = !DILocation(line: 31, column: 2, scope: !81)
