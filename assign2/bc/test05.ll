; ModuleID = 'test05.bc'
source_filename = "test05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !9 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !15, metadata !DIExpression()), !dbg !16
  %5 = load i32, i32* %3, align 4, !dbg !17
  %6 = load i32, i32* %4, align 4, !dbg !18
  %7 = add nsw i32 %5, %6, !dbg !19
  ret i32 %7, !dbg !20
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !21 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !24, metadata !DIExpression()), !dbg !25
  %5 = load i32, i32* %3, align 4, !dbg !26
  %6 = load i32, i32* %4, align 4, !dbg !27
  %7 = sub nsw i32 %5, %6, !dbg !28
  ret i32 %7, !dbg !29
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0) #0 !dbg !30 {
  %2 = alloca i32, align 4
  %3 = alloca i32 (i32, i32)*, align 8
  %4 = alloca i32 (i32, i32)*, align 8
  %5 = alloca i32 (i32, i32)*, align 8
  %6 = alloca i32 (i32, i32)*, align 8
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %3, metadata !35, metadata !DIExpression()), !dbg !37
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %5, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 (i32, i32)* null, i32 (i32, i32)** %5, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 (i32, i32)* null, i32 (i32, i32)** %6, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 (i32, i32)* null, i32 (i32, i32)** %7, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %8, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 1, i32* %8, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %9, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 2, i32* %9, align 4, !dbg !49
  %11 = load i32, i32* %2, align 4, !dbg !50
  %12 = icmp sge i32 %11, 3, !dbg !52
  br i1 %12, label %13, label %15, !dbg !53

13:                                               ; preds = %1
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !54
  store i32 (i32, i32)* %14, i32 (i32, i32)** %5, align 8, !dbg !56
  br label %15, !dbg !57

15:                                               ; preds = %13, %1
  %16 = load i32, i32* %2, align 4, !dbg !58
  %17 = icmp sge i32 %16, 4, !dbg !60
  br i1 %17, label %18, label %20, !dbg !61

18:                                               ; preds = %15
  %19 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !62
  store i32 (i32, i32)* %19, i32 (i32, i32)** %5, align 8, !dbg !64
  br label %20, !dbg !65

20:                                               ; preds = %18, %15
  %21 = load i32, i32* %2, align 4, !dbg !66
  %22 = icmp sge i32 %21, 5, !dbg !68
  br i1 %22, label %23, label %25, !dbg !69

23:                                               ; preds = %20
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !70
  store i32 (i32, i32)* %24, i32 (i32, i32)** %6, align 8, !dbg !72
  br label %25, !dbg !73

25:                                               ; preds = %23, %20
  %26 = load i32, i32* %2, align 4, !dbg !74
  %27 = icmp sge i32 %26, 6, !dbg !76
  br i1 %27, label %28, label %30, !dbg !77

28:                                               ; preds = %25
  %29 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !78
  store i32 (i32, i32)* %29, i32 (i32, i32)** %7, align 8, !dbg !79
  br label %30, !dbg !80

30:                                               ; preds = %28, %25
  %31 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !81
  %32 = icmp ne i32 (i32, i32)* %31, null, !dbg !83
  br i1 %32, label %33, label %38, !dbg !84

33:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata i32* %10, metadata !85, metadata !DIExpression()), !dbg !88
  %34 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !89
  %35 = load i32, i32* %8, align 4, !dbg !90
  %36 = load i32, i32* %9, align 4, !dbg !91
  %37 = call i32 %34(i32 %35, i32 %36), !dbg !89
  store i32 %37, i32* %10, align 4, !dbg !88
  br label %38, !dbg !92

38:                                               ; preds = %33, %30
  ret i32 0, !dbg !93
}

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
!14 = !DILocation(line: 2, column: 14, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 2, type: !12)
!16 = !DILocation(line: 2, column: 21, scope: !9)
!17 = !DILocation(line: 3, column: 11, scope: !9)
!18 = !DILocation(line: 3, column: 13, scope: !9)
!19 = !DILocation(line: 3, column: 12, scope: !9)
!20 = !DILocation(line: 3, column: 4, scope: !9)
!21 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !10, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!22 = !DILocalVariable(name: "a", arg: 1, scope: !21, file: !1, line: 6, type: !12)
!23 = !DILocation(line: 6, column: 15, scope: !21)
!24 = !DILocalVariable(name: "b", arg: 2, scope: !21, file: !1, line: 6, type: !12)
!25 = !DILocation(line: 6, column: 22, scope: !21)
!26 = !DILocation(line: 7, column: 11, scope: !21)
!27 = !DILocation(line: 7, column: 13, scope: !21)
!28 = !DILocation(line: 7, column: 12, scope: !21)
!29 = !DILocation(line: 7, column: 4, scope: !21)
!30 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 10, type: !31, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{!12, !12}
!33 = !DILocalVariable(name: "x", arg: 1, scope: !30, file: !1, line: 10, type: !12)
!34 = !DILocation(line: 10, column: 16, scope: !30)
!35 = !DILocalVariable(name: "a_fptr", scope: !30, file: !1, line: 11, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!37 = !DILocation(line: 11, column: 11, scope: !30)
!38 = !DILocalVariable(name: "s_fptr", scope: !30, file: !1, line: 12, type: !36)
!39 = !DILocation(line: 12, column: 11, scope: !30)
!40 = !DILocalVariable(name: "t_fptr", scope: !30, file: !1, line: 13, type: !36)
!41 = !DILocation(line: 13, column: 11, scope: !30)
!42 = !DILocalVariable(name: "q_fptr", scope: !30, file: !1, line: 14, type: !36)
!43 = !DILocation(line: 14, column: 11, scope: !30)
!44 = !DILocalVariable(name: "r_fptr", scope: !30, file: !1, line: 15, type: !36)
!45 = !DILocation(line: 15, column: 11, scope: !30)
!46 = !DILocalVariable(name: "op1", scope: !30, file: !1, line: 17, type: !12)
!47 = !DILocation(line: 17, column: 9, scope: !30)
!48 = !DILocalVariable(name: "op2", scope: !30, file: !1, line: 17, type: !12)
!49 = !DILocation(line: 17, column: 16, scope: !30)
!50 = !DILocation(line: 19, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !30, file: !1, line: 19, column: 9)
!52 = !DILocation(line: 19, column: 11, scope: !51)
!53 = !DILocation(line: 19, column: 9, scope: !30)
!54 = !DILocation(line: 20, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !1, line: 19, column: 17)
!56 = !DILocation(line: 20, column: 15, scope: !55)
!57 = !DILocation(line: 21, column: 5, scope: !55)
!58 = !DILocation(line: 22, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !30, file: !1, line: 22, column: 9)
!60 = !DILocation(line: 22, column: 11, scope: !59)
!61 = !DILocation(line: 22, column: 9, scope: !30)
!62 = !DILocation(line: 23, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 22, column: 17)
!64 = !DILocation(line: 23, column: 15, scope: !63)
!65 = !DILocation(line: 24, column: 5, scope: !63)
!66 = !DILocation(line: 25, column: 9, scope: !67)
!67 = distinct !DILexicalBlock(scope: !30, file: !1, line: 25, column: 9)
!68 = !DILocation(line: 25, column: 11, scope: !67)
!69 = !DILocation(line: 25, column: 9, scope: !30)
!70 = !DILocation(line: 26, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !1, line: 25, column: 17)
!72 = !DILocation(line: 26, column: 15, scope: !71)
!73 = !DILocation(line: 27, column: 5, scope: !71)
!74 = !DILocation(line: 28, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !30, file: !1, line: 28, column: 9)
!76 = !DILocation(line: 28, column: 11, scope: !75)
!77 = !DILocation(line: 28, column: 9, scope: !30)
!78 = !DILocation(line: 29, column: 17, scope: !75)
!79 = !DILocation(line: 29, column: 15, scope: !75)
!80 = !DILocation(line: 29, column: 8, scope: !75)
!81 = !DILocation(line: 32, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !30, file: !1, line: 32, column: 9)
!83 = !DILocation(line: 32, column: 16, scope: !82)
!84 = !DILocation(line: 32, column: 9, scope: !30)
!85 = !DILocalVariable(name: "result", scope: !86, file: !1, line: 33, type: !87)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 32, column: 25)
!87 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!88 = !DILocation(line: 33, column: 17, scope: !86)
!89 = !DILocation(line: 33, column: 26, scope: !86)
!90 = !DILocation(line: 33, column: 33, scope: !86)
!91 = !DILocation(line: 33, column: 38, scope: !86)
!92 = !DILocation(line: 34, column: 5, scope: !86)
!93 = !DILocation(line: 35, column: 4, scope: !30)
