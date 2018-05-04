; ModuleID = 'app.rbc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [31 x i8] c"Sintaxe: %s M N O s dummy(=0)\0A\00", align 1
@.str.1 = private unnamed_addr constant [42 x i8] c"Sparsity must be greater than or equal 1\0A\00", align 1
@M1 = common global i32** null, align 8
@M2 = common global i32** null, align 8
@M3 = common global i32** null, align 8
@.str.1.10 = private unnamed_addr constant [4 x i8] c"%4d\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"%8.4lf,\00", align 1
@switch.table = private unnamed_addr constant [7 x void (i32**, i32**, i32**, i32, i32, i32)*] [void (i32**, i32**, i32**, i32, i32, i32)* @mul_mat0, void (i32**, i32**, i32**, i32, i32, i32)* @mul_mat1, void (i32**, i32**, i32**, i32, i32, i32)* @mul_mat2, void (i32**, i32**, i32**, i32, i32, i32)* @mul_mat3, void (i32**, i32**, i32**, i32, i32, i32)* @mul_mat4, void (i32**, i32**, i32**, i32, i32, i32)* @mul_mat5, void (i32**, i32**, i32**, i32, i32, i32)* @mul_mat6]

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %cmp = icmp eq i32 %argc, 7
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = load i8*, i8** %argv, align 8
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0), i8* %1) #7
  br label %if.end23

if.else:                                          ; preds = %entry
  %arrayidx1 = getelementptr inbounds i8*, i8** %argv, i64 1
  %2 = load i8*, i8** %arrayidx1, align 8
  %call2 = tail call i32 @atoi(i8* %2) #8
  %arrayidx3 = getelementptr inbounds i8*, i8** %argv, i64 2
  %3 = load i8*, i8** %arrayidx3, align 8
  %call4 = tail call i32 @atoi(i8* %3) #8
  %arrayidx5 = getelementptr inbounds i8*, i8** %argv, i64 3
  %4 = load i8*, i8** %arrayidx5, align 8
  %call6 = tail call i32 @atoi(i8* %4) #8
  %arrayidx7 = getelementptr inbounds i8*, i8** %argv, i64 4
  %5 = load i8*, i8** %arrayidx7, align 8
  %call8 = tail call i32 @atoi(i8* %5) #8
  %cmp9 = icmp slt i32 %call8, 1
  br i1 %cmp9, label %if.then10, label %if.else12

if.then10:                                        ; preds = %if.else
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %6) #7
  br label %if.end23

if.else12:                                        ; preds = %if.else
  tail call void @alloc_mats(i32 %call2, i32 %call4, i32 %call6)
  %arrayidx13 = getelementptr inbounds i8*, i8** %argv, i64 5
  %8 = load i8*, i8** %arrayidx13, align 8
  %call14 = tail call i32 @atoi(i8* %8) #8
  %arrayidx15 = getelementptr inbounds i8*, i8** %argv, i64 6
  %9 = load i8*, i8** %arrayidx15, align 8
  %call16 = tail call i32 @atoi(i8* %9) #8
  %call17 = tail call i32** @get_mat(i32 %call16)
  %add = add nsw i32 %call16, 1
  %call18 = tail call i32** @get_mat(i32 %add)
  %add19 = add nsw i32 %call16, 2
  %call20 = tail call i32** @get_mat(i32 %add19)
  tail call void @init_mat(i32** %call17, i32 %call2, i32 %call4, i32 %call8)
  tail call void @init_mat(i32** %call18, i32 %call4, i32 %call6, i32 %call8)
  %call21 = tail call void (i32**, i32**, i32**, i32, i32, i32)* @choose_fun(i32 %call14)
  %call22 = tail call double @run(void (i32**, i32**, i32**, i32, i32, i32)* %call21, i32** %call17, i32** %call18, i32** %call20, i32 %call2, i32 %call4, i32 %call6, i32 undef)
  br label %if.end23

if.end23:                                         ; preds = %if.then, %if.then10, %if.else12
  %retval.0 = phi i32 [ 1, %if.then ], [ 1, %if.then10 ], [ 0, %if.else12 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) #2

; Function Attrs: norecurse nounwind uwtable
define void @mul_mat0(i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** nocapture readonly %mm, i32 %M, i32 %N, i32 %O) #3 {
entry:
  %cmp17 = icmp sgt i32 %M, 0
  br i1 %cmp17, label %for.cond1.preheader.lr.ph, label %for.end26

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp215 = icmp sgt i32 %O, 0
  %cmp713 = icmp sgt i32 %N, 0
  br i1 %cmp215, label %for.body3.lr.ph.us.preheader, label %for.end26

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %O, -1
  %xtraiter59 = and i32 %N, 1
  %lcmp.mod60 = icmp eq i32 %xtraiter59, 0
  %1 = icmp eq i32 %N, 1
  %xtraiter = and i32 %O, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %2 = icmp ult i32 %0, 7
  br label %for.body3.lr.ph.us

for.body3.us19:                                   ; preds = %for.body3.us19, %for.body3.us19.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body3.us19.preheader.split.split ], [ %indvars.iv.next.7, %for.body3.us19 ]
  %3 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us22 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv
  store i32 0, i32* %arrayidx5.us22, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us22.1 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv.next
  store i32 0, i32* %arrayidx5.us22.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %5 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us22.2 = getelementptr inbounds i32, i32* %5, i64 %indvars.iv.next.1
  store i32 0, i32* %arrayidx5.us22.2, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %6 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us22.3 = getelementptr inbounds i32, i32* %6, i64 %indvars.iv.next.2
  store i32 0, i32* %arrayidx5.us22.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %7 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us22.4 = getelementptr inbounds i32, i32* %7, i64 %indvars.iv.next.3
  store i32 0, i32* %arrayidx5.us22.4, align 4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %8 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us22.5 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv.next.4
  store i32 0, i32* %arrayidx5.us22.5, align 4
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %9 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us22.6 = getelementptr inbounds i32, i32* %9, i64 %indvars.iv.next.5
  store i32 0, i32* %arrayidx5.us22.6, align 4
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %10 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us22.7 = getelementptr inbounds i32, i32* %10, i64 %indvars.iv.next.6
  store i32 0, i32* %arrayidx5.us22.7, align 4
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %O
  br i1 %exitcond.7, label %for.cond1.for.inc24_crit_edge.us.loopexit58.unr-lcssa, label %for.body3.us19

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond1.for.inc24_crit_edge.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.cond1.for.inc24_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %mm, i64 %indvars.iv51
  %arrayidx11.us = getelementptr inbounds i32*, i32** %m1, i64 %indvars.iv51
  br i1 %cmp713, label %for.body3.us.us.preheader, label %for.body3.us19.preheader

for.body3.us19.preheader:                         ; preds = %for.body3.lr.ph.us
  br i1 %lcmp.mod, label %for.body3.us19.preheader.split, label %for.body3.us19.prol.preheader

for.body3.us19.prol.preheader:                    ; preds = %for.body3.us19.preheader
  br label %for.body3.us19.prol

for.body3.us19.prol:                              ; preds = %for.body3.us19.prol, %for.body3.us19.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us19.prol ], [ 0, %for.body3.us19.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us19.prol ], [ %xtraiter, %for.body3.us19.prol.preheader ]
  %11 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us22.prol = getelementptr inbounds i32, i32* %11, i64 %indvars.iv.prol
  store i32 0, i32* %arrayidx5.us22.prol, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us19.preheader.split.loopexit, label %for.body3.us19.prol, !llvm.loop !1

for.body3.us19.preheader.split.loopexit:          ; preds = %for.body3.us19.prol
  %indvars.iv.next.prol.lcssa = phi i64 [ %indvars.iv.next.prol, %for.body3.us19.prol ]
  br label %for.body3.us19.preheader.split

for.body3.us19.preheader.split:                   ; preds = %for.body3.us19.preheader, %for.body3.us19.preheader.split.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.body3.us19.preheader ], [ %indvars.iv.next.prol.lcssa, %for.body3.us19.preheader.split.loopexit ]
  br i1 %2, label %for.cond1.for.inc24_crit_edge.us.loopexit58, label %for.body3.us19.preheader.split.split

for.body3.us19.preheader.split.split:             ; preds = %for.body3.us19.preheader.split
  br label %for.body3.us19

for.body3.us.us.preheader:                        ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us.loopexit58.unr-lcssa: ; preds = %for.body3.us19
  br label %for.cond1.for.inc24_crit_edge.us.loopexit58

for.cond1.for.inc24_crit_edge.us.loopexit58:      ; preds = %for.body3.us19.preheader.split, %for.cond1.for.inc24_crit_edge.us.loopexit58.unr-lcssa
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond1.for.inc24_crit_edge.us.loopexit58, %for.cond1.for.inc24_crit_edge.us.loopexit
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %lftr.wideiv53 = trunc i64 %indvars.iv.next52 to i32
  %exitcond54 = icmp eq i32 %lftr.wideiv53, %M
  br i1 %exitcond54, label %for.end26.loopexit, label %for.body3.lr.ph.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %12 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us.us = getelementptr inbounds i32, i32* %12, i64 %indvars.iv47
  store i32 0, i32* %arrayidx5.us.us, align 4
  br i1 %lcmp.mod60, label %for.body3.us.us.split, label %for.body8.us.us.prol

for.body8.us.us.prol:                             ; preds = %for.body3.us.us
  %13 = load i32*, i32** %arrayidx11.us, align 8
  %14 = load i32, i32* %13, align 4
  %15 = load i32*, i32** %m2, align 8
  %arrayidx16.us.us.prol = getelementptr inbounds i32, i32* %15, i64 %indvars.iv47
  %16 = load i32, i32* %arrayidx16.us.us.prol, align 4
  %mul.us.us.prol = mul nsw i32 %16, %14
  %17 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us.prol = getelementptr inbounds i32, i32* %17, i64 %indvars.iv47
  %18 = load i32, i32* %arrayidx20.us.us.prol, align 4
  %add.us.us.prol = add nsw i32 %18, %mul.us.us.prol
  store i32 %add.us.us.prol, i32* %arrayidx20.us.us.prol, align 4
  br label %for.body3.us.us.split

for.body3.us.us.split:                            ; preds = %for.body3.us.us, %for.body8.us.us.prol
  %indvars.iv43.unr = phi i64 [ 0, %for.body3.us.us ], [ 1, %for.body8.us.us.prol ]
  br i1 %1, label %for.cond6.for.inc21_crit_edge.us.us, label %for.body3.us.us.split.split

for.body3.us.us.split.split:                      ; preds = %for.body3.us.us.split
  br label %for.body8.us.us

for.cond6.for.inc21_crit_edge.us.us.unr-lcssa:    ; preds = %for.body8.us.us
  br label %for.cond6.for.inc21_crit_edge.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.body3.us.us.split, %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %lftr.wideiv49 = trunc i64 %indvars.iv.next48 to i32
  %exitcond50 = icmp eq i32 %lftr.wideiv49, %O
  br i1 %exitcond50, label %for.cond1.for.inc24_crit_edge.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.body8.us.us, %for.body3.us.us.split.split
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr, %for.body3.us.us.split.split ], [ %indvars.iv.next44.1, %for.body8.us.us ]
  %19 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us = getelementptr inbounds i32, i32* %19, i64 %indvars.iv43
  %20 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx15.us.us = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv43
  %21 = load i32*, i32** %arrayidx15.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds i32, i32* %21, i64 %indvars.iv47
  %22 = load i32, i32* %arrayidx16.us.us, align 4
  %mul.us.us = mul nsw i32 %22, %20
  %23 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us = getelementptr inbounds i32, i32* %23, i64 %indvars.iv47
  %24 = load i32, i32* %arrayidx20.us.us, align 4
  %add.us.us = add nsw i32 %24, %mul.us.us
  store i32 %add.us.us, i32* %arrayidx20.us.us, align 4
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %25 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds i32, i32* %25, i64 %indvars.iv.next44
  %26 = load i32, i32* %arrayidx12.us.us.1, align 4
  %arrayidx15.us.us.1 = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv.next44
  %27 = load i32*, i32** %arrayidx15.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds i32, i32* %27, i64 %indvars.iv47
  %28 = load i32, i32* %arrayidx16.us.us.1, align 4
  %mul.us.us.1 = mul nsw i32 %28, %26
  %29 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us.1 = getelementptr inbounds i32, i32* %29, i64 %indvars.iv47
  %30 = load i32, i32* %arrayidx20.us.us.1, align 4
  %add.us.us.1 = add nsw i32 %30, %mul.us.us.1
  store i32 %add.us.us.1, i32* %arrayidx20.us.us.1, align 4
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %lftr.wideiv45.1 = trunc i64 %indvars.iv.next44.1 to i32
  %exitcond46.1 = icmp eq i32 %lftr.wideiv45.1, %N
  br i1 %exitcond46.1, label %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa, label %for.body8.us.us

for.end26.loopexit:                               ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.end26

for.end26:                                        ; preds = %for.end26.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @mul_mat1(i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** nocapture readonly %mm, i32 %M, i32 %N, i32 %O) #3 {
entry:
  %cmp18 = icmp sgt i32 %M, 0
  br i1 %cmp18, label %for.cond1.preheader.lr.ph, label %for.end26

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp216 = icmp sgt i32 %O, 0
  %cmp714 = icmp sgt i32 %N, 0
  br i1 %cmp216, label %for.body3.lr.ph.us.preheader, label %for.end26

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %O, -1
  %xtraiter63 = and i32 %N, 1
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  %1 = icmp eq i32 %N, 1
  %xtraiter = and i32 %O, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %2 = icmp ult i32 %0, 7
  br label %for.body3.lr.ph.us

for.body3.us20:                                   ; preds = %for.body3.us20, %for.body3.us20.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body3.us20.preheader.split.split ], [ %indvars.iv.next.7, %for.body3.us20 ]
  %3 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv
  store i32 0, i32* %arrayidx5.us23, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.1 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv.next
  store i32 0, i32* %arrayidx5.us23.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %5 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.2 = getelementptr inbounds i32, i32* %5, i64 %indvars.iv.next.1
  store i32 0, i32* %arrayidx5.us23.2, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %6 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.3 = getelementptr inbounds i32, i32* %6, i64 %indvars.iv.next.2
  store i32 0, i32* %arrayidx5.us23.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %7 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.4 = getelementptr inbounds i32, i32* %7, i64 %indvars.iv.next.3
  store i32 0, i32* %arrayidx5.us23.4, align 4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %8 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.5 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv.next.4
  store i32 0, i32* %arrayidx5.us23.5, align 4
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %9 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.6 = getelementptr inbounds i32, i32* %9, i64 %indvars.iv.next.5
  store i32 0, i32* %arrayidx5.us23.6, align 4
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %10 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.7 = getelementptr inbounds i32, i32* %10, i64 %indvars.iv.next.6
  store i32 0, i32* %arrayidx5.us23.7, align 4
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %O
  br i1 %exitcond.7, label %for.cond1.for.inc24_crit_edge.us.loopexit62.unr-lcssa, label %for.body3.us20

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond1.for.inc24_crit_edge.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond1.for.inc24_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %mm, i64 %indvars.iv55
  %arrayidx11.us = getelementptr inbounds i32*, i32** %m1, i64 %indvars.iv55
  br i1 %cmp714, label %for.body3.us.us.preheader, label %for.body3.us20.preheader

for.body3.us20.preheader:                         ; preds = %for.body3.lr.ph.us
  br i1 %lcmp.mod, label %for.body3.us20.preheader.split, label %for.body3.us20.prol.preheader

for.body3.us20.prol.preheader:                    ; preds = %for.body3.us20.preheader
  br label %for.body3.us20.prol

for.body3.us20.prol:                              ; preds = %for.body3.us20.prol, %for.body3.us20.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us20.prol ], [ 0, %for.body3.us20.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us20.prol ], [ %xtraiter, %for.body3.us20.prol.preheader ]
  %11 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.prol = getelementptr inbounds i32, i32* %11, i64 %indvars.iv.prol
  store i32 0, i32* %arrayidx5.us23.prol, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us20.preheader.split.loopexit, label %for.body3.us20.prol, !llvm.loop !3

for.body3.us20.preheader.split.loopexit:          ; preds = %for.body3.us20.prol
  %indvars.iv.next.prol.lcssa = phi i64 [ %indvars.iv.next.prol, %for.body3.us20.prol ]
  br label %for.body3.us20.preheader.split

for.body3.us20.preheader.split:                   ; preds = %for.body3.us20.preheader, %for.body3.us20.preheader.split.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.body3.us20.preheader ], [ %indvars.iv.next.prol.lcssa, %for.body3.us20.preheader.split.loopexit ]
  br i1 %2, label %for.cond1.for.inc24_crit_edge.us.loopexit62, label %for.body3.us20.preheader.split.split

for.body3.us20.preheader.split.split:             ; preds = %for.body3.us20.preheader.split
  br label %for.body3.us20

for.body3.us.us.preheader:                        ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us.loopexit62.unr-lcssa: ; preds = %for.body3.us20
  br label %for.cond1.for.inc24_crit_edge.us.loopexit62

for.cond1.for.inc24_crit_edge.us.loopexit62:      ; preds = %for.body3.us20.preheader.split, %for.cond1.for.inc24_crit_edge.us.loopexit62.unr-lcssa
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond1.for.inc24_crit_edge.us.loopexit62, %for.cond1.for.inc24_crit_edge.us.loopexit
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %lftr.wideiv57 = trunc i64 %indvars.iv.next56 to i32
  %exitcond58 = icmp eq i32 %lftr.wideiv57, %M
  br i1 %exitcond58, label %for.end26.loopexit, label %for.body3.lr.ph.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %12 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us.us = getelementptr inbounds i32, i32* %12, i64 %indvars.iv51
  store i32 0, i32* %arrayidx5.us.us, align 4
  br i1 %lcmp.mod64, label %for.body3.us.us.split, label %for.body8.us.us.prol

for.body8.us.us.prol:                             ; preds = %for.body3.us.us
  %13 = load i32*, i32** %arrayidx11.us, align 8
  %14 = load i32, i32* %13, align 4
  %15 = load i32*, i32** %m2, align 8
  %arrayidx16.us.us.prol = getelementptr inbounds i32, i32* %15, i64 %indvars.iv51
  %16 = load i32, i32* %arrayidx16.us.us.prol, align 4
  %mul.us.us.prol = mul nsw i32 %16, %14
  %tobool.us.us.prol = icmp eq i32 %mul.us.us.prol, 0
  br i1 %tobool.us.us.prol, label %for.inc.us.us.prol, label %if.then.us.us.prol

if.then.us.us.prol:                               ; preds = %for.body8.us.us.prol
  %17 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us.prol = getelementptr inbounds i32, i32* %17, i64 %indvars.iv51
  %18 = load i32, i32* %arrayidx20.us.us.prol, align 4
  %add.us.us.prol = add nsw i32 %18, %mul.us.us.prol
  store i32 %add.us.us.prol, i32* %arrayidx20.us.us.prol, align 4
  br label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %if.then.us.us.prol, %for.body8.us.us.prol
  br label %for.body3.us.us.split

for.body3.us.us.split:                            ; preds = %for.body3.us.us, %for.inc.us.us.prol
  %indvars.iv47.unr = phi i64 [ 0, %for.body3.us.us ], [ 1, %for.inc.us.us.prol ]
  br i1 %1, label %for.cond6.for.inc21_crit_edge.us.us, label %for.body3.us.us.split.split

for.body3.us.us.split.split:                      ; preds = %for.body3.us.us.split
  br label %for.body8.us.us

for.cond6.for.inc21_crit_edge.us.us.unr-lcssa:    ; preds = %for.inc.us.us.1
  br label %for.cond6.for.inc21_crit_edge.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.body3.us.us.split, %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %lftr.wideiv53 = trunc i64 %indvars.iv.next52 to i32
  %exitcond54 = icmp eq i32 %lftr.wideiv53, %O
  br i1 %exitcond54, label %for.cond1.for.inc24_crit_edge.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.inc.us.us.1, %for.body3.us.us.split.split
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %for.body3.us.us.split.split ], [ %indvars.iv.next48.1, %for.inc.us.us.1 ]
  %19 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us = getelementptr inbounds i32, i32* %19, i64 %indvars.iv47
  %20 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx15.us.us = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv47
  %21 = load i32*, i32** %arrayidx15.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds i32, i32* %21, i64 %indvars.iv51
  %22 = load i32, i32* %arrayidx16.us.us, align 4
  %mul.us.us = mul nsw i32 %22, %20
  %tobool.us.us = icmp eq i32 %mul.us.us, 0
  br i1 %tobool.us.us, label %for.inc.us.us, label %if.then.us.us

if.then.us.us:                                    ; preds = %for.body8.us.us
  %23 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us = getelementptr inbounds i32, i32* %23, i64 %indvars.iv51
  %24 = load i32, i32* %arrayidx20.us.us, align 4
  %add.us.us = add nsw i32 %24, %mul.us.us
  store i32 %add.us.us, i32* %arrayidx20.us.us, align 4
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then.us.us, %for.body8.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %25 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds i32, i32* %25, i64 %indvars.iv.next48
  %26 = load i32, i32* %arrayidx12.us.us.1, align 4
  %arrayidx15.us.us.1 = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv.next48
  %27 = load i32*, i32** %arrayidx15.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds i32, i32* %27, i64 %indvars.iv51
  %28 = load i32, i32* %arrayidx16.us.us.1, align 4
  %mul.us.us.1 = mul nsw i32 %28, %26
  %tobool.us.us.1 = icmp eq i32 %mul.us.us.1, 0
  br i1 %tobool.us.us.1, label %for.inc.us.us.1, label %if.then.us.us.1

for.end26.loopexit:                               ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.end26

for.end26:                                        ; preds = %for.end26.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret void

if.then.us.us.1:                                  ; preds = %for.inc.us.us
  %29 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us.1 = getelementptr inbounds i32, i32* %29, i64 %indvars.iv51
  %30 = load i32, i32* %arrayidx20.us.us.1, align 4
  %add.us.us.1 = add nsw i32 %30, %mul.us.us.1
  store i32 %add.us.us.1, i32* %arrayidx20.us.us.1, align 4
  br label %for.inc.us.us.1

for.inc.us.us.1:                                  ; preds = %if.then.us.us.1, %for.inc.us.us
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %lftr.wideiv49.1 = trunc i64 %indvars.iv.next48.1 to i32
  %exitcond50.1 = icmp eq i32 %lftr.wideiv49.1, %N
  br i1 %exitcond50.1, label %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa, label %for.body8.us.us
}

; Function Attrs: norecurse nounwind uwtable
define void @mul_mat2(i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** nocapture readonly %mm, i32 %M, i32 %N, i32 %O) #3 {
entry:
  %cmp19 = icmp sgt i32 %M, 0
  br i1 %cmp19, label %for.cond1.preheader.lr.ph, label %for.end27

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp217 = icmp sgt i32 %O, 0
  %cmp715 = icmp sgt i32 %N, 0
  br i1 %cmp217, label %for.body3.lr.ph.us.preheader, label %for.end27

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %O, -1
  %xtraiter = and i32 %O, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp ult i32 %0, 7
  br label %for.body3.lr.ph.us

for.body3.us21:                                   ; preds = %for.body3.us21, %for.body3.us21.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body3.us21.preheader.split.split ], [ %indvars.iv.next.7, %for.body3.us21 ]
  %2 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  store i32 0, i32* %arrayidx5.us24, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %3 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.1 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv.next
  store i32 0, i32* %arrayidx5.us24.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %4 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.2 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv.next.1
  store i32 0, i32* %arrayidx5.us24.2, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %5 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.3 = getelementptr inbounds i32, i32* %5, i64 %indvars.iv.next.2
  store i32 0, i32* %arrayidx5.us24.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %6 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.4 = getelementptr inbounds i32, i32* %6, i64 %indvars.iv.next.3
  store i32 0, i32* %arrayidx5.us24.4, align 4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %7 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.5 = getelementptr inbounds i32, i32* %7, i64 %indvars.iv.next.4
  store i32 0, i32* %arrayidx5.us24.5, align 4
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %8 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.6 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv.next.5
  store i32 0, i32* %arrayidx5.us24.6, align 4
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %9 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.7 = getelementptr inbounds i32, i32* %9, i64 %indvars.iv.next.6
  store i32 0, i32* %arrayidx5.us24.7, align 4
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %O
  br i1 %exitcond.7, label %for.cond1.for.inc25_crit_edge.us.loopexit65.unr-lcssa, label %for.body3.us21

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond1.for.inc25_crit_edge.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.cond1.for.inc25_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %mm, i64 %indvars.iv58
  %arrayidx11.us = getelementptr inbounds i32*, i32** %m1, i64 %indvars.iv58
  br i1 %cmp715, label %for.body3.us.us.preheader, label %for.body3.us21.preheader

for.body3.us21.preheader:                         ; preds = %for.body3.lr.ph.us
  br i1 %lcmp.mod, label %for.body3.us21.preheader.split, label %for.body3.us21.prol.preheader

for.body3.us21.prol.preheader:                    ; preds = %for.body3.us21.preheader
  br label %for.body3.us21.prol

for.body3.us21.prol:                              ; preds = %for.body3.us21.prol, %for.body3.us21.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us21.prol ], [ 0, %for.body3.us21.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us21.prol ], [ %xtraiter, %for.body3.us21.prol.preheader ]
  %10 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.prol = getelementptr inbounds i32, i32* %10, i64 %indvars.iv.prol
  store i32 0, i32* %arrayidx5.us24.prol, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us21.preheader.split.loopexit, label %for.body3.us21.prol, !llvm.loop !4

for.body3.us21.preheader.split.loopexit:          ; preds = %for.body3.us21.prol
  %indvars.iv.next.prol.lcssa = phi i64 [ %indvars.iv.next.prol, %for.body3.us21.prol ]
  br label %for.body3.us21.preheader.split

for.body3.us21.preheader.split:                   ; preds = %for.body3.us21.preheader, %for.body3.us21.preheader.split.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.body3.us21.preheader ], [ %indvars.iv.next.prol.lcssa, %for.body3.us21.preheader.split.loopexit ]
  br i1 %1, label %for.cond1.for.inc25_crit_edge.us.loopexit65, label %for.body3.us21.preheader.split.split

for.body3.us21.preheader.split.split:             ; preds = %for.body3.us21.preheader.split
  br label %for.body3.us21

for.body3.us.us.preheader:                        ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.us

for.cond1.for.inc25_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc22_crit_edge.us.us
  br label %for.cond1.for.inc25_crit_edge.us

for.cond1.for.inc25_crit_edge.us.loopexit65.unr-lcssa: ; preds = %for.body3.us21
  br label %for.cond1.for.inc25_crit_edge.us.loopexit65

for.cond1.for.inc25_crit_edge.us.loopexit65:      ; preds = %for.body3.us21.preheader.split, %for.cond1.for.inc25_crit_edge.us.loopexit65.unr-lcssa
  br label %for.cond1.for.inc25_crit_edge.us

for.cond1.for.inc25_crit_edge.us:                 ; preds = %for.cond1.for.inc25_crit_edge.us.loopexit65, %for.cond1.for.inc25_crit_edge.us.loopexit
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %lftr.wideiv60 = trunc i64 %indvars.iv.next59 to i32
  %exitcond61 = icmp eq i32 %lftr.wideiv60, %M
  br i1 %exitcond61, label %for.end27.loopexit, label %for.body3.lr.ph.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc22_crit_edge.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond6.for.inc22_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %11 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us.us = getelementptr inbounds i32, i32* %11, i64 %indvars.iv54
  store i32 0, i32* %arrayidx5.us.us, align 4
  br label %for.body8.us.us

for.cond6.for.inc22_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %lftr.wideiv56 = trunc i64 %indvars.iv.next55 to i32
  %exitcond57 = icmp eq i32 %lftr.wideiv56, %O
  br i1 %exitcond57, label %for.cond1.for.inc25_crit_edge.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.inc.us.us, %for.body3.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc.us.us ], [ 0, %for.body3.us.us ]
  %12 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us = getelementptr inbounds i32, i32* %12, i64 %indvars.iv50
  %13 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx15.us.us = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv50
  %14 = load i32*, i32** %arrayidx15.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds i32, i32* %14, i64 %indvars.iv54
  %15 = load i32, i32* %arrayidx16.us.us, align 4
  %tobool.us.us = icmp ne i32 %13, 0
  %tobool17.us.us = icmp ne i32 %15, 0
  %or.cond.us.us = and i1 %tobool.us.us, %tobool17.us.us
  br i1 %or.cond.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body8.us.us
  %mul.us.us = mul nsw i32 %15, %13
  %16 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx21.us.us = getelementptr inbounds i32, i32* %16, i64 %indvars.iv54
  %17 = load i32, i32* %arrayidx21.us.us, align 4
  %add.us.us = add nsw i32 %17, %mul.us.us
  store i32 %add.us.us, i32* %arrayidx21.us.us, align 4
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then.us.us, %for.body8.us.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %lftr.wideiv52 = trunc i64 %indvars.iv.next51 to i32
  %exitcond53 = icmp eq i32 %lftr.wideiv52, %N
  br i1 %exitcond53, label %for.cond6.for.inc22_crit_edge.us.us, label %for.body8.us.us

for.end27.loopexit:                               ; preds = %for.cond1.for.inc25_crit_edge.us
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @mul_mat3(i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** nocapture readonly %mm, i32 %M, i32 %N, i32 %O) #3 {
entry:
  %cmp19 = icmp sgt i32 %M, 0
  br i1 %cmp19, label %for.cond1.preheader.lr.ph, label %for.end26

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp217 = icmp sgt i32 %O, 0
  %cmp715 = icmp sgt i32 %N, 0
  br i1 %cmp217, label %for.body3.lr.ph.us.preheader, label %for.end26

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %O, -1
  %xtraiter = and i32 %O, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp ult i32 %0, 7
  br label %for.body3.lr.ph.us

for.body3.us21:                                   ; preds = %for.body3.us21, %for.body3.us21.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body3.us21.preheader.split.split ], [ %indvars.iv.next.7, %for.body3.us21 ]
  %2 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  store i32 0, i32* %arrayidx5.us24, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %3 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.1 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv.next
  store i32 0, i32* %arrayidx5.us24.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %4 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.2 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv.next.1
  store i32 0, i32* %arrayidx5.us24.2, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %5 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.3 = getelementptr inbounds i32, i32* %5, i64 %indvars.iv.next.2
  store i32 0, i32* %arrayidx5.us24.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %6 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.4 = getelementptr inbounds i32, i32* %6, i64 %indvars.iv.next.3
  store i32 0, i32* %arrayidx5.us24.4, align 4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %7 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.5 = getelementptr inbounds i32, i32* %7, i64 %indvars.iv.next.4
  store i32 0, i32* %arrayidx5.us24.5, align 4
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %8 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.6 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv.next.5
  store i32 0, i32* %arrayidx5.us24.6, align 4
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %9 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.7 = getelementptr inbounds i32, i32* %9, i64 %indvars.iv.next.6
  store i32 0, i32* %arrayidx5.us24.7, align 4
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %O
  br i1 %exitcond.7, label %for.cond1.for.inc24_crit_edge.us.loopexit64.unr-lcssa, label %for.body3.us21

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond1.for.inc24_crit_edge.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.cond1.for.inc24_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %mm, i64 %indvars.iv57
  %arrayidx11.us = getelementptr inbounds i32*, i32** %m1, i64 %indvars.iv57
  br i1 %cmp715, label %for.body3.us.us.preheader, label %for.body3.us21.preheader

for.body3.us21.preheader:                         ; preds = %for.body3.lr.ph.us
  br i1 %lcmp.mod, label %for.body3.us21.preheader.split, label %for.body3.us21.prol.preheader

for.body3.us21.prol.preheader:                    ; preds = %for.body3.us21.preheader
  br label %for.body3.us21.prol

for.body3.us21.prol:                              ; preds = %for.body3.us21.prol, %for.body3.us21.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us21.prol ], [ 0, %for.body3.us21.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us21.prol ], [ %xtraiter, %for.body3.us21.prol.preheader ]
  %10 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.prol = getelementptr inbounds i32, i32* %10, i64 %indvars.iv.prol
  store i32 0, i32* %arrayidx5.us24.prol, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us21.preheader.split.loopexit, label %for.body3.us21.prol, !llvm.loop !5

for.body3.us21.preheader.split.loopexit:          ; preds = %for.body3.us21.prol
  %indvars.iv.next.prol.lcssa = phi i64 [ %indvars.iv.next.prol, %for.body3.us21.prol ]
  br label %for.body3.us21.preheader.split

for.body3.us21.preheader.split:                   ; preds = %for.body3.us21.preheader, %for.body3.us21.preheader.split.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.body3.us21.preheader ], [ %indvars.iv.next.prol.lcssa, %for.body3.us21.preheader.split.loopexit ]
  br i1 %1, label %for.cond1.for.inc24_crit_edge.us.loopexit64, label %for.body3.us21.preheader.split.split

for.body3.us21.preheader.split.split:             ; preds = %for.body3.us21.preheader.split
  br label %for.body3.us21

for.body3.us.us.preheader:                        ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us.loopexit64.unr-lcssa: ; preds = %for.body3.us21
  br label %for.cond1.for.inc24_crit_edge.us.loopexit64

for.cond1.for.inc24_crit_edge.us.loopexit64:      ; preds = %for.body3.us21.preheader.split, %for.cond1.for.inc24_crit_edge.us.loopexit64.unr-lcssa
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond1.for.inc24_crit_edge.us.loopexit64, %for.cond1.for.inc24_crit_edge.us.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %lftr.wideiv59 = trunc i64 %indvars.iv.next58 to i32
  %exitcond60 = icmp eq i32 %lftr.wideiv59, %M
  br i1 %exitcond60, label %for.end26.loopexit, label %for.body3.lr.ph.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %11 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us.us = getelementptr inbounds i32, i32* %11, i64 %indvars.iv53
  store i32 0, i32* %arrayidx5.us.us, align 4
  br label %for.body8.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %lftr.wideiv55 = trunc i64 %indvars.iv.next54 to i32
  %exitcond56 = icmp eq i32 %lftr.wideiv55, %O
  br i1 %exitcond56, label %for.cond1.for.inc24_crit_edge.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.inc.us.us, %for.body3.us.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc.us.us ], [ 0, %for.body3.us.us ]
  %12 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us = getelementptr inbounds i32, i32* %12, i64 %indvars.iv49
  %13 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx15.us.us = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv49
  %14 = load i32*, i32** %arrayidx15.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds i32, i32* %14, i64 %indvars.iv53
  %15 = load i32, i32* %arrayidx16.us.us, align 4
  %or.us.us = or i32 %15, %13
  %tobool.us.us = icmp eq i32 %or.us.us, 0
  br i1 %tobool.us.us, label %for.inc.us.us, label %if.then.us.us

if.then.us.us:                                    ; preds = %for.body8.us.us
  %mul.us.us = mul nsw i32 %15, %13
  %16 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us = getelementptr inbounds i32, i32* %16, i64 %indvars.iv53
  %17 = load i32, i32* %arrayidx20.us.us, align 4
  %add.us.us = add nsw i32 %17, %mul.us.us
  store i32 %add.us.us, i32* %arrayidx20.us.us, align 4
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then.us.us, %for.body8.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %lftr.wideiv51 = trunc i64 %indvars.iv.next50 to i32
  %exitcond52 = icmp eq i32 %lftr.wideiv51, %N
  br i1 %exitcond52, label %for.cond6.for.inc21_crit_edge.us.us, label %for.body8.us.us

for.end26.loopexit:                               ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.end26

for.end26:                                        ; preds = %for.end26.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @mul_mat4(i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** nocapture readonly %mm, i32 %M, i32 %N, i32 %O) #3 {
entry:
  %cmp18 = icmp sgt i32 %M, 0
  br i1 %cmp18, label %for.cond1.preheader.lr.ph, label %for.end26

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp216 = icmp sgt i32 %O, 0
  %cmp714 = icmp sgt i32 %N, 0
  br i1 %cmp216, label %for.body3.lr.ph.us.preheader, label %for.end26

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %O, -1
  %xtraiter63 = and i32 %N, 1
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  %1 = icmp eq i32 %N, 1
  %xtraiter = and i32 %O, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %2 = icmp ult i32 %0, 7
  br label %for.body3.lr.ph.us

for.body3.us20:                                   ; preds = %for.body3.us20, %for.body3.us20.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body3.us20.preheader.split.split ], [ %indvars.iv.next.7, %for.body3.us20 ]
  %3 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv
  store i32 0, i32* %arrayidx5.us23, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.1 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv.next
  store i32 0, i32* %arrayidx5.us23.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %5 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.2 = getelementptr inbounds i32, i32* %5, i64 %indvars.iv.next.1
  store i32 0, i32* %arrayidx5.us23.2, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %6 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.3 = getelementptr inbounds i32, i32* %6, i64 %indvars.iv.next.2
  store i32 0, i32* %arrayidx5.us23.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %7 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.4 = getelementptr inbounds i32, i32* %7, i64 %indvars.iv.next.3
  store i32 0, i32* %arrayidx5.us23.4, align 4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %8 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.5 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv.next.4
  store i32 0, i32* %arrayidx5.us23.5, align 4
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %9 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.6 = getelementptr inbounds i32, i32* %9, i64 %indvars.iv.next.5
  store i32 0, i32* %arrayidx5.us23.6, align 4
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %10 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.7 = getelementptr inbounds i32, i32* %10, i64 %indvars.iv.next.6
  store i32 0, i32* %arrayidx5.us23.7, align 4
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %O
  br i1 %exitcond.7, label %for.cond1.for.inc24_crit_edge.us.loopexit62.unr-lcssa, label %for.body3.us20

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond1.for.inc24_crit_edge.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond1.for.inc24_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %mm, i64 %indvars.iv55
  %arrayidx11.us = getelementptr inbounds i32*, i32** %m1, i64 %indvars.iv55
  br i1 %cmp714, label %for.body3.us.us.preheader, label %for.body3.us20.preheader

for.body3.us20.preheader:                         ; preds = %for.body3.lr.ph.us
  br i1 %lcmp.mod, label %for.body3.us20.preheader.split, label %for.body3.us20.prol.preheader

for.body3.us20.prol.preheader:                    ; preds = %for.body3.us20.preheader
  br label %for.body3.us20.prol

for.body3.us20.prol:                              ; preds = %for.body3.us20.prol, %for.body3.us20.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us20.prol ], [ 0, %for.body3.us20.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us20.prol ], [ %xtraiter, %for.body3.us20.prol.preheader ]
  %11 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us23.prol = getelementptr inbounds i32, i32* %11, i64 %indvars.iv.prol
  store i32 0, i32* %arrayidx5.us23.prol, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us20.preheader.split.loopexit, label %for.body3.us20.prol, !llvm.loop !6

for.body3.us20.preheader.split.loopexit:          ; preds = %for.body3.us20.prol
  %indvars.iv.next.prol.lcssa = phi i64 [ %indvars.iv.next.prol, %for.body3.us20.prol ]
  br label %for.body3.us20.preheader.split

for.body3.us20.preheader.split:                   ; preds = %for.body3.us20.preheader, %for.body3.us20.preheader.split.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.body3.us20.preheader ], [ %indvars.iv.next.prol.lcssa, %for.body3.us20.preheader.split.loopexit ]
  br i1 %2, label %for.cond1.for.inc24_crit_edge.us.loopexit62, label %for.body3.us20.preheader.split.split

for.body3.us20.preheader.split.split:             ; preds = %for.body3.us20.preheader.split
  br label %for.body3.us20

for.body3.us.us.preheader:                        ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us.loopexit62.unr-lcssa: ; preds = %for.body3.us20
  br label %for.cond1.for.inc24_crit_edge.us.loopexit62

for.cond1.for.inc24_crit_edge.us.loopexit62:      ; preds = %for.body3.us20.preheader.split, %for.cond1.for.inc24_crit_edge.us.loopexit62.unr-lcssa
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond1.for.inc24_crit_edge.us.loopexit62, %for.cond1.for.inc24_crit_edge.us.loopexit
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %lftr.wideiv57 = trunc i64 %indvars.iv.next56 to i32
  %exitcond58 = icmp eq i32 %lftr.wideiv57, %M
  br i1 %exitcond58, label %for.end26.loopexit, label %for.body3.lr.ph.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %12 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us.us = getelementptr inbounds i32, i32* %12, i64 %indvars.iv51
  store i32 0, i32* %arrayidx5.us.us, align 4
  br i1 %lcmp.mod64, label %for.body3.us.us.split, label %for.body8.us.us.prol

for.body8.us.us.prol:                             ; preds = %for.body3.us.us
  %13 = load i32*, i32** %arrayidx11.us, align 8
  %14 = load i32, i32* %13, align 4
  %tobool.us.us.prol = icmp eq i32 %14, 0
  br i1 %tobool.us.us.prol, label %for.inc.us.us.prol, label %if.then.us.us.prol

if.then.us.us.prol:                               ; preds = %for.body8.us.us.prol
  %15 = load i32*, i32** %m2, align 8
  %arrayidx16.us.us.prol = getelementptr inbounds i32, i32* %15, i64 %indvars.iv51
  %16 = load i32, i32* %arrayidx16.us.us.prol, align 4
  %mul.us.us.prol = mul nsw i32 %16, %14
  %17 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us.prol = getelementptr inbounds i32, i32* %17, i64 %indvars.iv51
  %18 = load i32, i32* %arrayidx20.us.us.prol, align 4
  %add.us.us.prol = add nsw i32 %18, %mul.us.us.prol
  store i32 %add.us.us.prol, i32* %arrayidx20.us.us.prol, align 4
  br label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %if.then.us.us.prol, %for.body8.us.us.prol
  br label %for.body3.us.us.split

for.body3.us.us.split:                            ; preds = %for.body3.us.us, %for.inc.us.us.prol
  %indvars.iv47.unr = phi i64 [ 0, %for.body3.us.us ], [ 1, %for.inc.us.us.prol ]
  br i1 %1, label %for.cond6.for.inc21_crit_edge.us.us, label %for.body3.us.us.split.split

for.body3.us.us.split.split:                      ; preds = %for.body3.us.us.split
  br label %for.body8.us.us

for.cond6.for.inc21_crit_edge.us.us.unr-lcssa:    ; preds = %for.inc.us.us.1
  br label %for.cond6.for.inc21_crit_edge.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.body3.us.us.split, %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %lftr.wideiv53 = trunc i64 %indvars.iv.next52 to i32
  %exitcond54 = icmp eq i32 %lftr.wideiv53, %O
  br i1 %exitcond54, label %for.cond1.for.inc24_crit_edge.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.inc.us.us.1, %for.body3.us.us.split.split
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %for.body3.us.us.split.split ], [ %indvars.iv.next48.1, %for.inc.us.us.1 ]
  %19 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us = getelementptr inbounds i32, i32* %19, i64 %indvars.iv47
  %20 = load i32, i32* %arrayidx12.us.us, align 4
  %tobool.us.us = icmp eq i32 %20, 0
  br i1 %tobool.us.us, label %for.inc.us.us, label %if.then.us.us

if.then.us.us:                                    ; preds = %for.body8.us.us
  %arrayidx15.us.us = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv47
  %21 = load i32*, i32** %arrayidx15.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds i32, i32* %21, i64 %indvars.iv51
  %22 = load i32, i32* %arrayidx16.us.us, align 4
  %mul.us.us = mul nsw i32 %22, %20
  %23 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us = getelementptr inbounds i32, i32* %23, i64 %indvars.iv51
  %24 = load i32, i32* %arrayidx20.us.us, align 4
  %add.us.us = add nsw i32 %24, %mul.us.us
  store i32 %add.us.us, i32* %arrayidx20.us.us, align 4
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then.us.us, %for.body8.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %25 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds i32, i32* %25, i64 %indvars.iv.next48
  %26 = load i32, i32* %arrayidx12.us.us.1, align 4
  %tobool.us.us.1 = icmp eq i32 %26, 0
  br i1 %tobool.us.us.1, label %for.inc.us.us.1, label %if.then.us.us.1

for.end26.loopexit:                               ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.end26

for.end26:                                        ; preds = %for.end26.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret void

if.then.us.us.1:                                  ; preds = %for.inc.us.us
  %arrayidx15.us.us.1 = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv.next48
  %27 = load i32*, i32** %arrayidx15.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds i32, i32* %27, i64 %indvars.iv51
  %28 = load i32, i32* %arrayidx16.us.us.1, align 4
  %mul.us.us.1 = mul nsw i32 %28, %26
  %29 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us.1 = getelementptr inbounds i32, i32* %29, i64 %indvars.iv51
  %30 = load i32, i32* %arrayidx20.us.us.1, align 4
  %add.us.us.1 = add nsw i32 %30, %mul.us.us.1
  store i32 %add.us.us.1, i32* %arrayidx20.us.us.1, align 4
  br label %for.inc.us.us.1

for.inc.us.us.1:                                  ; preds = %if.then.us.us.1, %for.inc.us.us
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %lftr.wideiv49.1 = trunc i64 %indvars.iv.next48.1 to i32
  %exitcond50.1 = icmp eq i32 %lftr.wideiv49.1, %N
  br i1 %exitcond50.1, label %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa, label %for.body8.us.us
}

; Function Attrs: norecurse nounwind uwtable
define void @mul_mat5(i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** nocapture readonly %mm, i32 %M, i32 %N, i32 %O) #3 {
entry:
  %cmp19 = icmp sgt i32 %M, 0
  br i1 %cmp19, label %for.cond1.preheader.lr.ph, label %for.end26

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp217 = icmp sgt i32 %O, 0
  %cmp715 = icmp sgt i32 %N, 0
  br i1 %cmp217, label %for.body3.lr.ph.us.preheader, label %for.end26

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %O, -1
  %xtraiter64 = and i32 %N, 1
  %lcmp.mod65 = icmp eq i32 %xtraiter64, 0
  %1 = icmp eq i32 %N, 1
  %xtraiter = and i32 %O, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %2 = icmp ult i32 %0, 7
  br label %for.body3.lr.ph.us

for.body3.us21:                                   ; preds = %for.body3.us21, %for.body3.us21.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body3.us21.preheader.split.split ], [ %indvars.iv.next.7, %for.body3.us21 ]
  %3 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv
  store i32 0, i32* %arrayidx5.us24, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.1 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv.next
  store i32 0, i32* %arrayidx5.us24.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %5 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.2 = getelementptr inbounds i32, i32* %5, i64 %indvars.iv.next.1
  store i32 0, i32* %arrayidx5.us24.2, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %6 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.3 = getelementptr inbounds i32, i32* %6, i64 %indvars.iv.next.2
  store i32 0, i32* %arrayidx5.us24.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %7 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.4 = getelementptr inbounds i32, i32* %7, i64 %indvars.iv.next.3
  store i32 0, i32* %arrayidx5.us24.4, align 4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %8 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.5 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv.next.4
  store i32 0, i32* %arrayidx5.us24.5, align 4
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %9 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.6 = getelementptr inbounds i32, i32* %9, i64 %indvars.iv.next.5
  store i32 0, i32* %arrayidx5.us24.6, align 4
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %10 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.7 = getelementptr inbounds i32, i32* %10, i64 %indvars.iv.next.6
  store i32 0, i32* %arrayidx5.us24.7, align 4
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %O
  br i1 %exitcond.7, label %for.cond1.for.inc24_crit_edge.us.loopexit63.unr-lcssa, label %for.body3.us21

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond1.for.inc24_crit_edge.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.cond1.for.inc24_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %mm, i64 %indvars.iv56
  %arrayidx11.us = getelementptr inbounds i32*, i32** %m1, i64 %indvars.iv56
  br i1 %cmp715, label %for.body3.us.us.preheader, label %for.body3.us21.preheader

for.body3.us21.preheader:                         ; preds = %for.body3.lr.ph.us
  br i1 %lcmp.mod, label %for.body3.us21.preheader.split, label %for.body3.us21.prol.preheader

for.body3.us21.prol.preheader:                    ; preds = %for.body3.us21.preheader
  br label %for.body3.us21.prol

for.body3.us21.prol:                              ; preds = %for.body3.us21.prol, %for.body3.us21.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us21.prol ], [ 0, %for.body3.us21.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us21.prol ], [ %xtraiter, %for.body3.us21.prol.preheader ]
  %11 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.prol = getelementptr inbounds i32, i32* %11, i64 %indvars.iv.prol
  store i32 0, i32* %arrayidx5.us24.prol, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us21.preheader.split.loopexit, label %for.body3.us21.prol, !llvm.loop !7

for.body3.us21.preheader.split.loopexit:          ; preds = %for.body3.us21.prol
  %indvars.iv.next.prol.lcssa = phi i64 [ %indvars.iv.next.prol, %for.body3.us21.prol ]
  br label %for.body3.us21.preheader.split

for.body3.us21.preheader.split:                   ; preds = %for.body3.us21.preheader, %for.body3.us21.preheader.split.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.body3.us21.preheader ], [ %indvars.iv.next.prol.lcssa, %for.body3.us21.preheader.split.loopexit ]
  br i1 %2, label %for.cond1.for.inc24_crit_edge.us.loopexit63, label %for.body3.us21.preheader.split.split

for.body3.us21.preheader.split.split:             ; preds = %for.body3.us21.preheader.split
  br label %for.body3.us21

for.body3.us.us.preheader:                        ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us.loopexit63.unr-lcssa: ; preds = %for.body3.us21
  br label %for.cond1.for.inc24_crit_edge.us.loopexit63

for.cond1.for.inc24_crit_edge.us.loopexit63:      ; preds = %for.body3.us21.preheader.split, %for.cond1.for.inc24_crit_edge.us.loopexit63.unr-lcssa
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond1.for.inc24_crit_edge.us.loopexit63, %for.cond1.for.inc24_crit_edge.us.loopexit
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %lftr.wideiv58 = trunc i64 %indvars.iv.next57 to i32
  %exitcond59 = icmp eq i32 %lftr.wideiv58, %M
  br i1 %exitcond59, label %for.end26.loopexit, label %for.body3.lr.ph.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %12 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us.us = getelementptr inbounds i32, i32* %12, i64 %indvars.iv52
  store i32 0, i32* %arrayidx5.us.us, align 4
  br i1 %lcmp.mod65, label %for.body3.us.us.split, label %for.body8.us.us.prol

for.body8.us.us.prol:                             ; preds = %for.body3.us.us
  %13 = load i32*, i32** %arrayidx11.us, align 8
  %14 = load i32, i32* %13, align 4
  %15 = load i32*, i32** %m2, align 8
  %arrayidx16.us.us.prol = getelementptr inbounds i32, i32* %15, i64 %indvars.iv52
  %16 = load i32, i32* %arrayidx16.us.us.prol, align 4
  %or.us.us.prol = or i32 %16, %14
  %tobool.us.us.prol = icmp eq i32 %or.us.us.prol, 0
  %mul.us.us.prol = mul nsw i32 %16, %14
  %.mul.us.us.prol = select i1 %tobool.us.us.prol, i32 0, i32 %mul.us.us.prol
  %17 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us.prol = getelementptr inbounds i32, i32* %17, i64 %indvars.iv52
  %18 = load i32, i32* %arrayidx20.us.us.prol, align 4
  %add.us.us.prol = add nsw i32 %.mul.us.us.prol, %18
  store i32 %add.us.us.prol, i32* %arrayidx20.us.us.prol, align 4
  br label %for.body3.us.us.split

for.body3.us.us.split:                            ; preds = %for.body3.us.us, %for.body8.us.us.prol
  %indvars.iv48.unr = phi i64 [ 0, %for.body3.us.us ], [ 1, %for.body8.us.us.prol ]
  br i1 %1, label %for.cond6.for.inc21_crit_edge.us.us, label %for.body3.us.us.split.split

for.body3.us.us.split.split:                      ; preds = %for.body3.us.us.split
  br label %for.body8.us.us

for.cond6.for.inc21_crit_edge.us.us.unr-lcssa:    ; preds = %for.body8.us.us
  br label %for.cond6.for.inc21_crit_edge.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.body3.us.us.split, %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %lftr.wideiv54 = trunc i64 %indvars.iv.next53 to i32
  %exitcond55 = icmp eq i32 %lftr.wideiv54, %O
  br i1 %exitcond55, label %for.cond1.for.inc24_crit_edge.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.body8.us.us, %for.body3.us.us.split.split
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %for.body3.us.us.split.split ], [ %indvars.iv.next49.1, %for.body8.us.us ]
  %19 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us = getelementptr inbounds i32, i32* %19, i64 %indvars.iv48
  %20 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx15.us.us = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv48
  %21 = load i32*, i32** %arrayidx15.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds i32, i32* %21, i64 %indvars.iv52
  %22 = load i32, i32* %arrayidx16.us.us, align 4
  %or.us.us = or i32 %22, %20
  %tobool.us.us = icmp eq i32 %or.us.us, 0
  %mul.us.us = mul nsw i32 %22, %20
  %.mul.us.us = select i1 %tobool.us.us, i32 0, i32 %mul.us.us
  %23 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us = getelementptr inbounds i32, i32* %23, i64 %indvars.iv52
  %24 = load i32, i32* %arrayidx20.us.us, align 4
  %add.us.us = add nsw i32 %.mul.us.us, %24
  store i32 %add.us.us, i32* %arrayidx20.us.us, align 4
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %25 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds i32, i32* %25, i64 %indvars.iv.next49
  %26 = load i32, i32* %arrayidx12.us.us.1, align 4
  %arrayidx15.us.us.1 = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv.next49
  %27 = load i32*, i32** %arrayidx15.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds i32, i32* %27, i64 %indvars.iv52
  %28 = load i32, i32* %arrayidx16.us.us.1, align 4
  %or.us.us.1 = or i32 %28, %26
  %tobool.us.us.1 = icmp eq i32 %or.us.us.1, 0
  %mul.us.us.1 = mul nsw i32 %28, %26
  %.mul.us.us.1 = select i1 %tobool.us.us.1, i32 0, i32 %mul.us.us.1
  %29 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx20.us.us.1 = getelementptr inbounds i32, i32* %29, i64 %indvars.iv52
  %30 = load i32, i32* %arrayidx20.us.us.1, align 4
  %add.us.us.1 = add nsw i32 %.mul.us.us.1, %30
  store i32 %add.us.us.1, i32* %arrayidx20.us.us.1, align 4
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %lftr.wideiv50.1 = trunc i64 %indvars.iv.next49.1 to i32
  %exitcond51.1 = icmp eq i32 %lftr.wideiv50.1, %N
  br i1 %exitcond51.1, label %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa, label %for.body8.us.us

for.end26.loopexit:                               ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.end26

for.end26:                                        ; preds = %for.end26.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @mul_mat6(i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** nocapture readonly %mm, i32 %M, i32 %N, i32 %O) #3 {
entry:
  %cmp19 = icmp sgt i32 %M, 0
  br i1 %cmp19, label %for.cond1.preheader.lr.ph, label %for.end29

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp217 = icmp sgt i32 %O, 0
  %cmp715 = icmp sgt i32 %N, 0
  br i1 %cmp217, label %for.body3.lr.ph.us.preheader, label %for.end29

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %O, -1
  %xtraiter = and i32 %O, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp ult i32 %0, 7
  br label %for.body3.lr.ph.us

for.body3.us21:                                   ; preds = %for.body3.us21, %for.body3.us21.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body3.us21.preheader.split.split ], [ %indvars.iv.next.7, %for.body3.us21 ]
  %2 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  store i32 0, i32* %arrayidx5.us24, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %3 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.1 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv.next
  store i32 0, i32* %arrayidx5.us24.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %4 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.2 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv.next.1
  store i32 0, i32* %arrayidx5.us24.2, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %5 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.3 = getelementptr inbounds i32, i32* %5, i64 %indvars.iv.next.2
  store i32 0, i32* %arrayidx5.us24.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %6 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.4 = getelementptr inbounds i32, i32* %6, i64 %indvars.iv.next.3
  store i32 0, i32* %arrayidx5.us24.4, align 4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %7 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.5 = getelementptr inbounds i32, i32* %7, i64 %indvars.iv.next.4
  store i32 0, i32* %arrayidx5.us24.5, align 4
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %8 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.6 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv.next.5
  store i32 0, i32* %arrayidx5.us24.6, align 4
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %9 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.7 = getelementptr inbounds i32, i32* %9, i64 %indvars.iv.next.6
  store i32 0, i32* %arrayidx5.us24.7, align 4
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %O
  br i1 %exitcond.7, label %for.cond1.for.inc27_crit_edge.us.loopexit65.unr-lcssa, label %for.body3.us21

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond1.for.inc27_crit_edge.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.cond1.for.inc27_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %mm, i64 %indvars.iv58
  %arrayidx11.us = getelementptr inbounds i32*, i32** %m1, i64 %indvars.iv58
  br i1 %cmp715, label %for.body3.us.us.preheader, label %for.body3.us21.preheader

for.body3.us21.preheader:                         ; preds = %for.body3.lr.ph.us
  br i1 %lcmp.mod, label %for.body3.us21.preheader.split, label %for.body3.us21.prol.preheader

for.body3.us21.prol.preheader:                    ; preds = %for.body3.us21.preheader
  br label %for.body3.us21.prol

for.body3.us21.prol:                              ; preds = %for.body3.us21.prol, %for.body3.us21.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us21.prol ], [ 0, %for.body3.us21.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us21.prol ], [ %xtraiter, %for.body3.us21.prol.preheader ]
  %10 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us24.prol = getelementptr inbounds i32, i32* %10, i64 %indvars.iv.prol
  store i32 0, i32* %arrayidx5.us24.prol, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us21.preheader.split.loopexit, label %for.body3.us21.prol, !llvm.loop !8

for.body3.us21.preheader.split.loopexit:          ; preds = %for.body3.us21.prol
  %indvars.iv.next.prol.lcssa = phi i64 [ %indvars.iv.next.prol, %for.body3.us21.prol ]
  br label %for.body3.us21.preheader.split

for.body3.us21.preheader.split:                   ; preds = %for.body3.us21.preheader, %for.body3.us21.preheader.split.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.body3.us21.preheader ], [ %indvars.iv.next.prol.lcssa, %for.body3.us21.preheader.split.loopexit ]
  br i1 %1, label %for.cond1.for.inc27_crit_edge.us.loopexit65, label %for.body3.us21.preheader.split.split

for.body3.us21.preheader.split.split:             ; preds = %for.body3.us21.preheader.split
  br label %for.body3.us21

for.body3.us.us.preheader:                        ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.us

for.cond1.for.inc27_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc24_crit_edge.us.us
  br label %for.cond1.for.inc27_crit_edge.us

for.cond1.for.inc27_crit_edge.us.loopexit65.unr-lcssa: ; preds = %for.body3.us21
  br label %for.cond1.for.inc27_crit_edge.us.loopexit65

for.cond1.for.inc27_crit_edge.us.loopexit65:      ; preds = %for.body3.us21.preheader.split, %for.cond1.for.inc27_crit_edge.us.loopexit65.unr-lcssa
  br label %for.cond1.for.inc27_crit_edge.us

for.cond1.for.inc27_crit_edge.us:                 ; preds = %for.cond1.for.inc27_crit_edge.us.loopexit65, %for.cond1.for.inc27_crit_edge.us.loopexit
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %lftr.wideiv60 = trunc i64 %indvars.iv.next59 to i32
  %exitcond61 = icmp eq i32 %lftr.wideiv60, %M
  br i1 %exitcond61, label %for.end29.loopexit, label %for.body3.lr.ph.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc24_crit_edge.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond6.for.inc24_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %11 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us.us = getelementptr inbounds i32, i32* %11, i64 %indvars.iv54
  store i32 0, i32* %arrayidx5.us.us, align 4
  br label %for.body8.us.us

for.cond6.for.inc24_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %lftr.wideiv56 = trunc i64 %indvars.iv.next55 to i32
  %exitcond57 = icmp eq i32 %lftr.wideiv56, %O
  br i1 %exitcond57, label %for.cond1.for.inc27_crit_edge.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.inc.us.us, %for.body3.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc.us.us ], [ 0, %for.body3.us.us ]
  %12 = load i32*, i32** %arrayidx11.us, align 8
  %arrayidx12.us.us = getelementptr inbounds i32, i32* %12, i64 %indvars.iv50
  %13 = load i32, i32* %arrayidx12.us.us, align 4
  %tobool.us.us = icmp eq i32 %13, 0
  br i1 %tobool.us.us, label %for.inc.us.us, label %if.then.us.us

if.then.us.us:                                    ; preds = %for.body8.us.us
  %arrayidx15.us.us = getelementptr inbounds i32*, i32** %m2, i64 %indvars.iv50
  %14 = load i32*, i32** %arrayidx15.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds i32, i32* %14, i64 %indvars.iv54
  %15 = load i32, i32* %arrayidx16.us.us, align 4
  %tobool17.us.us = icmp eq i32 %15, 0
  br i1 %tobool17.us.us, label %for.inc.us.us, label %if.then18.us.us

if.then18.us.us:                                  ; preds = %if.then.us.us
  %mul.us.us = mul nsw i32 %15, %13
  %16 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx22.us.us = getelementptr inbounds i32, i32* %16, i64 %indvars.iv54
  %17 = load i32, i32* %arrayidx22.us.us, align 4
  %add.us.us = add nsw i32 %17, %mul.us.us
  store i32 %add.us.us, i32* %arrayidx22.us.us, align 4
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then18.us.us, %if.then.us.us, %for.body8.us.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %lftr.wideiv52 = trunc i64 %indvars.iv.next51 to i32
  %exitcond53 = icmp eq i32 %lftr.wideiv52, %N
  br i1 %exitcond53, label %for.cond6.for.inc24_crit_edge.us.us, label %for.body8.us.us

for.end29.loopexit:                               ; preds = %for.cond1.for.inc27_crit_edge.us
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define void (i32**, i32**, i32**, i32, i32, i32)* @choose_fun(i32 %version) #4 {
entry:
  %0 = icmp ult i32 %version, 7
  br i1 %0, label %switch.lookup, label %return

switch.lookup:                                    ; preds = %entry
  %1 = sext i32 %version to i64
  %switch.gep = getelementptr inbounds [7 x void (i32**, i32**, i32**, i32, i32, i32)*], [7 x void (i32**, i32**, i32**, i32, i32, i32)*]* @switch.table, i64 0, i64 %1
  %switch.load = load void (i32**, i32**, i32**, i32, i32, i32)*, void (i32**, i32**, i32**, i32, i32, i32)** %switch.gep, align 8
  ret void (i32**, i32**, i32**, i32, i32, i32)* %switch.load

return:                                           ; preds = %entry
  ret void (i32**, i32**, i32**, i32, i32, i32)* null
}

; Function Attrs: nounwind uwtable
define noalias i32** @gen_mat(i32 %M, i32 %N) #0 {
entry:
  %conv = sext i32 %M to i64
  %mul = shl nsw i64 %conv, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %0 = bitcast i8* %call to i32**
  %cmp5 = icmp sgt i32 %M, 0
  br i1 %cmp5, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv2 = sext i32 %N to i64
  %mul3 = shl nsw i64 %conv2, 2
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %call4 = tail call noalias i8* @malloc(i64 %mul3) #6
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 %indvars.iv
  %1 = bitcast i32** %arrayidx to i8**
  store i8* %call4, i8** %1, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %M
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret i32** %0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @alloc_mats(i32 %M, i32 %N, i32 %O) #0 {
entry:
  %call = tail call i32** @gen_mat(i32 %M, i32 %N)
  store i32** %call, i32*** @M1, align 8
  %call1 = tail call i32** @gen_mat(i32 %N, i32 %O)
  store i32** %call1, i32*** @M2, align 8
  %call2 = tail call i32** @gen_mat(i32 %M, i32 %O)
  store i32** %call2, i32*** @M3, align 8
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define i32** @get_mat(i32 %option) #5 {
entry:
  switch i32 %option, label %return [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  %0 = load i32**, i32*** @M1, align 8
  br label %return

sw.bb1:                                           ; preds = %entry
  %1 = load i32**, i32*** @M2, align 8
  br label %return

sw.bb2:                                           ; preds = %entry
  %2 = load i32**, i32*** @M3, align 8
  br label %return

return:                                           ; preds = %entry, %sw.bb2, %sw.bb1, %sw.bb
  %retval.0 = phi i32** [ %2, %sw.bb2 ], [ %1, %sw.bb1 ], [ %0, %sw.bb ], [ null, %entry ]
  ret i32** %retval.0
}

; Function Attrs: nounwind uwtable
define void @init_mat(i32** nocapture readonly %m, i32 %M, i32 %N, i32 %sparsity) #0 {
entry:
  %cmp7 = icmp sgt i32 %M, 0
  %cmp25 = icmp sgt i32 %N, 0
  %or.cond = and i1 %cmp7, %cmp25
  br i1 %or.cond, label %for.body3.lr.ph.us.preheader, label %for.end8

for.body3.lr.ph.us.preheader:                     ; preds = %entry
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next, %for.body3.us ]
  %call.us = tail call i32 @rand() #6
  %rem.us = srem i32 %call.us, %sparsity
  %not.tobool.us = icmp eq i32 %rem.us, 0
  %cond.us = zext i1 %not.tobool.us to i32
  %0 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  store i32 %cond.us, i32* %arrayidx5.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %N
  br i1 %exitcond, label %for.cond1.for.inc6_crit_edge.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond1.for.inc6_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond1.for.inc6_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %m, i64 %indvars.iv10
  br label %for.body3.us

for.cond1.for.inc6_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %lftr.wideiv12 = trunc i64 %indvars.iv.next11 to i32
  %exitcond13 = icmp eq i32 %lftr.wideiv12, %M
  br i1 %exitcond13, label %for.end8.loopexit, label %for.body3.lr.ph.us

for.end8.loopexit:                                ; preds = %for.cond1.for.inc6_crit_edge.us
  br label %for.end8

for.end8:                                         ; preds = %for.end8.loopexit, %entry
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @print_mat(i8* nocapture %title, i32** nocapture readonly %m, i32 %M, i32 %N) #0 {
entry:
  %puts = tail call i32 @puts(i8* %title)
  %cmp7 = icmp sgt i32 %M, 0
  br i1 %cmp7, label %for.cond1.preheader.lr.ph, label %for.end10

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp25 = icmp sgt i32 %N, 0
  br i1 %cmp25, label %for.body3.lr.ph.us.preheader, label %for.end.preheader

for.end.preheader:                                ; preds = %for.cond1.preheader.lr.ph
  br label %for.end

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next, %for.body3.us ]
  %0 = load i32*, i32** %arrayidx.us, align 8
  %arrayidx5.us = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %1 = load i32, i32* %arrayidx5.us, align 4
  %call6.us = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1.10, i64 0, i64 0), i32 %1)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %N
  br i1 %exitcond, label %for.cond1.for.end_crit_edge.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond1.for.end_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond1.for.end_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %m, i64 %indvars.iv10
  br label %for.body3.us

for.cond1.for.end_crit_edge.us:                   ; preds = %for.body3.us
  %putchar.us = tail call i32 @putchar(i32 10) #6
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %lftr.wideiv12 = trunc i64 %indvars.iv.next11 to i32
  %exitcond13 = icmp eq i32 %lftr.wideiv12, %M
  br i1 %exitcond13, label %for.end10.loopexit, label %for.body3.lr.ph.us

for.end:                                          ; preds = %for.end.preheader, %for.end
  %i.08 = phi i32 [ %inc9, %for.end ], [ 0, %for.end.preheader ]
  %putchar = tail call i32 @putchar(i32 10) #6
  %inc9 = add nuw nsw i32 %i.08, 1
  %exitcond14 = icmp eq i32 %inc9, %M
  br i1 %exitcond14, label %for.end10.loopexit17, label %for.end

for.end10.loopexit:                               ; preds = %for.cond1.for.end_crit_edge.us
  br label %for.end10

for.end10.loopexit17:                             ; preds = %for.end
  br label %for.end10

for.end10:                                        ; preds = %for.end10.loopexit17, %for.end10.loopexit, %entry
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define double @run(void (i32**, i32**, i32**, i32, i32, i32)* nocapture %matMul, i32** %m1, i32** %m2, i32** %mm, i32 %M, i32 %N, i32 %O, i32 %s) #0 {
entry:
  %call = tail call i64 @clock() #6
  tail call void %matMul(i32** %m1, i32** %m2, i32** %mm, i32 %M, i32 %N, i32 %O) #6
  %call1 = tail call i64 @clock() #6
  %sub = sub nsw i64 %call1, %call
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), double %div)
  ret double %div
}

; Function Attrs: nounwind
declare i64 @clock() #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #6

declare i32 @putchar(i32)

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { nounwind readonly }

!llvm.ident = !{!0, !0, !0}

!0 = !{!"clang version 3.8.0 (tags/RELEASE_380/final 322489)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2}
!8 = distinct !{!8, !2}
