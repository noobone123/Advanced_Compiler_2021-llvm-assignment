; ModuleID = 'test12.bc'
source_filename = "test12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !7 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !13, metadata !DIExpression()), !dbg !14
  %5 = load i32, i32* %3, align 4, !dbg !15
  %6 = load i32, i32* %4, align 4, !dbg !16
  %7 = add nsw i32 %5, %6, !dbg !17
  ret i32 %7, !dbg !18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !19 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !22, metadata !DIExpression()), !dbg !23
  %5 = load i32, i32* %3, align 4, !dbg !24
  %6 = load i32, i32* %4, align 4, !dbg !25
  %7 = sub nsw i32 %5, %6, !dbg !26
  ret i32 %7, !dbg !27
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 (i32, i32)* @foo(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !28 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !32, metadata !DIExpression()), !dbg !33
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !38, metadata !DIExpression()), !dbg !39
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !40
  ret i32 (i32, i32)* %9, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !42 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !53, metadata !DIExpression()), !dbg !54
  %10 = load i32, i32* %5, align 4, !dbg !55
  %11 = load i32, i32* %6, align 4, !dbg !56
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !57
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !58
  %14 = call i32 (i32, i32)* @foo(i32 %10, i32 %11, i32 (i32, i32)* %12, i32 (i32, i32)* %13), !dbg !59
  store i32 (i32, i32)* %14, i32 (i32, i32)** %9, align 8, !dbg !60
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !61
  %16 = load i32, i32* %5, align 4, !dbg !62
  %17 = load i32, i32* %6, align 4, !dbg !63
  %18 = call i32 %15(i32 %16, i32 %17), !dbg !61
  ret i32 %18, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !65 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 (i32, i32)* null, i32 (i32, i32)** %9, align 8, !dbg !80
  %11 = load i8, i8* %4, align 1, !dbg !81
  %12 = sext i8 %11 to i32, !dbg !81
  %13 = icmp eq i32 %12, 43, !dbg !83
  br i1 %13, label %14, label %16, !dbg !84

14:                                               ; preds = %3
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !85
  store i32 (i32, i32)* %15, i32 (i32, i32)** %9, align 8, !dbg !87
  br label %23, !dbg !88

16:                                               ; preds = %3
  %17 = load i8, i8* %4, align 1, !dbg !89
  %18 = sext i8 %17 to i32, !dbg !89
  %19 = icmp eq i32 %18, 45, !dbg !91
  br i1 %19, label %20, label %22, !dbg !92

20:                                               ; preds = %16
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !93
  store i32 (i32, i32)* %21, i32 (i32, i32)** %9, align 8, !dbg !95
  br label %22, !dbg !96

22:                                               ; preds = %20, %16
  br label %23

23:                                               ; preds = %22, %14
  call void @llvm.dbg.declare(metadata i32* %10, metadata !97, metadata !DIExpression()), !dbg !99
  %24 = load i32, i32* %5, align 4, !dbg !100
  %25 = load i32, i32* %6, align 4, !dbg !101
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !102
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !103
  %28 = call i32 @clever(i32 %24, i32 %25, i32 (i32, i32)* %26, i32 (i32, i32)* %27), !dbg !104
  store i32 %28, i32* %10, align 4, !dbg !99
  ret i32 0, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test12.c", directory: "/home/hikonaka/compiler_2021/hw_2/assign2/test")
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
!12 = !DILocation(line: 1, column: 14, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 1, column: 21, scope: !7)
!15 = !DILocation(line: 2, column: 11, scope: !7)
!16 = !DILocation(line: 2, column: 13, scope: !7)
!17 = !DILocation(line: 2, column: 12, scope: !7)
!18 = !DILocation(line: 2, column: 4, scope: !7)
!19 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 5, type: !10)
!21 = !DILocation(line: 5, column: 15, scope: !19)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 5, type: !10)
!23 = !DILocation(line: 5, column: 22, scope: !19)
!24 = !DILocation(line: 6, column: 11, scope: !19)
!25 = !DILocation(line: 6, column: 13, scope: !19)
!26 = !DILocation(line: 6, column: 12, scope: !19)
!27 = !DILocation(line: 6, column: 4, scope: !19)
!28 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 9, type: !29, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !10, !10, !31, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!32 = !DILocalVariable(name: "a", arg: 1, scope: !28, file: !1, line: 9, type: !10)
!33 = !DILocation(line: 9, column: 15, scope: !28)
!34 = !DILocalVariable(name: "b", arg: 2, scope: !28, file: !1, line: 9, type: !10)
!35 = !DILocation(line: 9, column: 22, scope: !28)
!36 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !28, file: !1, line: 9, type: !31)
!37 = !DILocation(line: 9, column: 31, scope: !28)
!38 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !28, file: !1, line: 9, type: !31)
!39 = !DILocation(line: 9, column: 55, scope: !28)
!40 = !DILocation(line: 10, column: 11, scope: !28)
!41 = !DILocation(line: 10, column: 4, scope: !28)
!42 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 13, type: !43, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!10, !10, !10, !31, !31}
!45 = !DILocalVariable(name: "a", arg: 1, scope: !42, file: !1, line: 13, type: !10)
!46 = !DILocation(line: 13, column: 16, scope: !42)
!47 = !DILocalVariable(name: "b", arg: 2, scope: !42, file: !1, line: 13, type: !10)
!48 = !DILocation(line: 13, column: 23, scope: !42)
!49 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !42, file: !1, line: 13, type: !31)
!50 = !DILocation(line: 13, column: 32, scope: !42)
!51 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !42, file: !1, line: 13, type: !31)
!52 = !DILocation(line: 13, column: 56, scope: !42)
!53 = !DILocalVariable(name: "s_fptr", scope: !42, file: !1, line: 14, type: !31)
!54 = !DILocation(line: 14, column: 10, scope: !42)
!55 = !DILocation(line: 15, column: 17, scope: !42)
!56 = !DILocation(line: 15, column: 20, scope: !42)
!57 = !DILocation(line: 15, column: 23, scope: !42)
!58 = !DILocation(line: 15, column: 31, scope: !42)
!59 = !DILocation(line: 15, column: 13, scope: !42)
!60 = !DILocation(line: 15, column: 11, scope: !42)
!61 = !DILocation(line: 16, column: 11, scope: !42)
!62 = !DILocation(line: 16, column: 18, scope: !42)
!63 = !DILocation(line: 16, column: 21, scope: !42)
!64 = !DILocation(line: 16, column: 4, scope: !42)
!65 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 20, type: !66, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!10, !68, !10, !10}
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "x", arg: 1, scope: !65, file: !1, line: 20, type: !68)
!70 = !DILocation(line: 20, column: 14, scope: !65)
!71 = !DILocalVariable(name: "op1", arg: 2, scope: !65, file: !1, line: 20, type: !10)
!72 = !DILocation(line: 20, column: 21, scope: !65)
!73 = !DILocalVariable(name: "op2", arg: 3, scope: !65, file: !1, line: 20, type: !10)
!74 = !DILocation(line: 20, column: 30, scope: !65)
!75 = !DILocalVariable(name: "a_fptr", scope: !65, file: !1, line: 21, type: !31)
!76 = !DILocation(line: 21, column: 11, scope: !65)
!77 = !DILocalVariable(name: "s_fptr", scope: !65, file: !1, line: 22, type: !31)
!78 = !DILocation(line: 22, column: 11, scope: !65)
!79 = !DILocalVariable(name: "t_fptr", scope: !65, file: !1, line: 23, type: !31)
!80 = !DILocation(line: 23, column: 11, scope: !65)
!81 = !DILocation(line: 25, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !65, file: !1, line: 25, column: 9)
!83 = !DILocation(line: 25, column: 11, scope: !82)
!84 = !DILocation(line: 25, column: 9, scope: !65)
!85 = !DILocation(line: 26, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 25, column: 19)
!87 = !DILocation(line: 26, column: 15, scope: !86)
!88 = !DILocation(line: 27, column: 5, scope: !86)
!89 = !DILocation(line: 28, column: 14, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !1, line: 28, column: 14)
!91 = !DILocation(line: 28, column: 16, scope: !90)
!92 = !DILocation(line: 28, column: 14, scope: !82)
!93 = !DILocation(line: 29, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !1, line: 28, column: 24)
!95 = !DILocation(line: 29, column: 15, scope: !94)
!96 = !DILocation(line: 30, column: 5, scope: !94)
!97 = !DILocalVariable(name: "result", scope: !65, file: !1, line: 32, type: !98)
!98 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!99 = !DILocation(line: 32, column: 14, scope: !65)
!100 = !DILocation(line: 32, column: 30, scope: !65)
!101 = !DILocation(line: 32, column: 35, scope: !65)
!102 = !DILocation(line: 32, column: 40, scope: !65)
!103 = !DILocation(line: 32, column: 48, scope: !65)
!104 = !DILocation(line: 32, column: 23, scope: !65)
!105 = !DILocation(line: 33, column: 5, scope: !65)
