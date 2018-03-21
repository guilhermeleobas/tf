; ModuleID = 'pbeampp.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.basket = type { %struct.arc*, i64, i64 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }
%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }

@perm = internal global { [351 x %struct.basket*], [680 x i8] } zeroinitializer, align 32
@initialize = internal global { i64, [56 x i8] } { i64 1, [56 x i8] zeroinitializer }, align 32
@basket = internal global { [351 x %struct.basket], [2104 x i8] } zeroinitializer, align 32
@nr_group = internal global { i64, [56 x i8] } zeroinitializer, align 32
@group_pos = internal global { i64, [56 x i8] } zeroinitializer, align 32
@basket_size = internal global { i64, [56 x i8] } zeroinitializer, align 32
@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]
@__asan_gen_ = private constant [17 x i8] c"perm (pbeampp.c)\00"
@__asan_gen_1 = private constant [23 x i8] c"initialize (pbeampp.c)\00"
@__asan_gen_2 = private constant [19 x i8] c"basket (pbeampp.c)\00"
@__asan_gen_3 = private constant [21 x i8] c"nr_group (pbeampp.c)\00"
@__asan_gen_4 = private constant [22 x i8] c"group_pos (pbeampp.c)\00"
@__asan_gen_5 = private constant [24 x i8] c"basket_size (pbeampp.c)\00"
@0 = private global [6 x { i64, i64, i64, i64, i64 }] [{ i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [351 x %struct.basket*], [680 x i8] }* @perm to i64), i64 2808, i64 3488, i64 ptrtoint ([17 x i8]* @__asan_gen_ to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ i64, [56 x i8] }* @initialize to i64), i64 8, i64 64, i64 ptrtoint ([23 x i8]* @__asan_gen_1 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [351 x %struct.basket], [2104 x i8] }* @basket to i64), i64 8424, i64 10528, i64 ptrtoint ([19 x i8]* @__asan_gen_2 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ i64, [56 x i8] }* @nr_group to i64), i64 8, i64 64, i64 ptrtoint ([21 x i8]* @__asan_gen_3 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ i64, [56 x i8] }* @group_pos to i64), i64 8, i64 64, i64 ptrtoint ([22 x i8]* @__asan_gen_4 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ i64, [56 x i8] }* @basket_size to i64), i64 8, i64 64, i64 ptrtoint ([24 x i8]* @__asan_gen_5 to i64), i64 0 }]
@llvm.global_dtors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_dtor }]

define i32 @bea_is_dual_infeasible(%struct.arc* %arc, i64 %red_cost) address_safety nounwind {
entry:
  %cmp = icmp slt i64 %red_cost, 0
  br i1 %cmp, label %land.lhs.true, label %entry.lor.rhs_crit_edge

entry.lor.rhs_crit_edge:                          ; preds = %entry
  %sigma_node5 = phi i64 [ %red_cost, %entry ]
  br label %lor.rhs

land.lhs.true:                                    ; preds = %entry
  %sigma_node = phi i64 [ %red_cost, %entry ]
  %ident = getelementptr inbounds %struct.arc* %arc, i32 0, i32 3
  %0 = ptrtoint i32* %ident to i64
  %1 = lshr i64 %0, 3
  %2 = or i64 %1, 17592186044416
  %3 = inttoptr i64 %2 to i8*
  %4 = load i8* %3
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %land.lhs.true
  %7 = and i64 %0, 7
  %8 = add i64 %7, 3
  %9 = trunc i64 %8 to i8
  %10 = icmp sge i8 %9, %4
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %6
  call void @__asan_report_load4(i64 %0)
  call void asm sideeffect "", ""()
  unreachable

; <label>:12                                      ; preds = %6, %land.lhs.true
  %13 = load i32* %ident, align 4
  %cmp1 = icmp eq i32 %13, 1
  br i1 %cmp1, label %land.lhs.true.lor.end_crit_edge, label %land.lhs.true.lor.rhs_crit_edge

land.lhs.true.lor.rhs_crit_edge:                  ; preds = %12
  %sigma_node9 = phi i32 [ %13, %12 ]
  br label %lor.rhs

land.lhs.true.lor.end_crit_edge:                  ; preds = %12
  %sigma_node8 = phi i32 [ %13, %12 ]
  br label %lor.end

lor.rhs:                                          ; preds = %land.lhs.true.lor.rhs_crit_edge, %entry.lor.rhs_crit_edge
  %phi_node = phi i64 [ %sigma_node, %land.lhs.true.lor.rhs_crit_edge ], [ %sigma_node5, %entry.lor.rhs_crit_edge ]
  %cmp2 = icmp sgt i64 %phi_node, 0
  br i1 %cmp2, label %land.rhs, label %lor.rhs.land.end_crit_edge

lor.rhs.land.end_crit_edge:                       ; preds = %lor.rhs
  %sigma_node7 = phi i64 [ %phi_node, %lor.rhs ]
  br label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %sigma_node6 = phi i64 [ %phi_node, %lor.rhs ]
  %ident3 = getelementptr inbounds %struct.arc* %arc, i32 0, i32 3
  %14 = ptrtoint i32* %ident3 to i64
  %15 = lshr i64 %14, 3
  %16 = or i64 %15, 17592186044416
  %17 = inttoptr i64 %16 to i8*
  %18 = load i8* %17
  %19 = icmp ne i8 %18, 0
  br i1 %19, label %20, label %26

; <label>:20                                      ; preds = %land.rhs
  %21 = and i64 %14, 7
  %22 = add i64 %21, 3
  %23 = trunc i64 %22 to i8
  %24 = icmp sge i8 %23, %18
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %20
  call void @__asan_report_load4(i64 %14)
  call void asm sideeffect "", ""()
  unreachable

; <label>:26                                      ; preds = %20, %land.rhs
  %27 = load i32* %ident3, align 4
  %cmp4 = icmp eq i32 %27, 2
  br label %land.end

land.end:                                         ; preds = %lor.rhs.land.end_crit_edge, %26
  %28 = phi i1 [ false, %lor.rhs.land.end_crit_edge ], [ %cmp4, %26 ]
  br label %lor.end

lor.end:                                          ; preds = %land.lhs.true.lor.end_crit_edge, %land.end
  %29 = phi i1 [ true, %land.lhs.true.lor.end_crit_edge ], [ %28, %land.end ]
  %lor.ext = zext i1 %29 to i32
  ret i32 %lor.ext
}

define void @sort_basket(i64 %min, i64 %max) address_safety nounwind {
entry:
  %add = add nsw i64 %min, %max
  %div = sdiv i64 %add, 2
  %arrayidx = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %div, !byte_size !0, !safe !1
  %0 = load %struct.basket** %arrayidx, align 8
  %abs_cost = getelementptr inbounds %struct.basket* %0, i32 0, i32 2
  %1 = ptrtoint i64* %abs_cost to i64
  %2 = lshr i64 %1, 3
  %3 = or i64 %2, 17592186044416
  %4 = inttoptr i64 %3 to i8*
  %5 = load i8* %4
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %entry
  call void @__asan_report_load8(i64 %1)
  call void asm sideeffect "", ""()
  unreachable

; <label>:8                                       ; preds = %entry
  %9 = load i64* %abs_cost, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond.do.body_crit_edge, %8
  %phi_node30 = phi i64 [ %sigma_node33, %do.cond.do.body_crit_edge ], [ %9, %8 ]
  %l.0 = phi i64 [ %min, %8 ], [ %sigma_node46, %do.cond.do.body_crit_edge ]
  %r.0 = phi i64 [ %max, %8 ], [ %sigma_node48, %do.cond.do.body_crit_edge ]
  br label %while.cond

while.cond:                                       ; preds = %while.body, %do.body
  %phi_node = phi i64 [ %sigma_node28, %while.body ], [ %phi_node30, %do.body ]
  %l.1 = phi i64 [ %l.0, %do.body ], [ %inc, %while.body ]
  %arrayidx1 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %l.1, !byte_size !0, !safe !1
  %10 = load %struct.basket** %arrayidx1, align 8
  %abs_cost2 = getelementptr inbounds %struct.basket* %10, i32 0, i32 2
  %11 = ptrtoint i64* %abs_cost2 to i64
  %12 = lshr i64 %11, 3
  %13 = or i64 %12, 17592186044416
  %14 = inttoptr i64 %13 to i8*
  %15 = load i8* %14
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %while.cond
  call void @__asan_report_load8(i64 %11)
  call void asm sideeffect "", ""()
  unreachable

; <label>:18                                      ; preds = %while.cond
  %19 = load i64* %abs_cost2, align 8
  %cmp = icmp sgt i64 %19, %phi_node
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %18
  %sigma_node28 = phi i64 [ %phi_node, %18 ]
  %sigma_node = phi i64 [ %19, %18 ]
  %inc = add nsw i64 %l.1, 1
  br label %while.cond

while.end:                                        ; preds = %18
  %sigma_node29 = phi i64 [ %phi_node, %18 ]
  %sigma_node27 = phi i64 [ %19, %18 ]
  br label %while.cond3

while.cond3:                                      ; preds = %while.body7, %while.end
  %phi_node32 = phi i64 [ %sigma_node31, %while.body7 ], [ %sigma_node29, %while.end ]
  %r.1 = phi i64 [ %r.0, %while.end ], [ %dec, %while.body7 ]
  %arrayidx4 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %r.1, !byte_size !0, !safe !1
  %20 = load %struct.basket** %arrayidx4, align 8
  %abs_cost5 = getelementptr inbounds %struct.basket* %20, i32 0, i32 2
  %21 = ptrtoint i64* %abs_cost5 to i64
  %22 = lshr i64 %21, 3
  %23 = or i64 %22, 17592186044416
  %24 = inttoptr i64 %23 to i8*
  %25 = load i8* %24
  %26 = icmp ne i8 %25, 0
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %while.cond3
  call void @__asan_report_load8(i64 %21)
  call void asm sideeffect "", ""()
  unreachable

; <label>:28                                      ; preds = %while.cond3
  %29 = load i64* %abs_cost5, align 8
  %cmp6 = icmp sgt i64 %phi_node32, %29
  br i1 %cmp6, label %while.body7, label %while.end8

while.body7:                                      ; preds = %28
  %sigma_node34 = phi i64 [ %29, %28 ]
  %sigma_node31 = phi i64 [ %phi_node32, %28 ]
  %dec = add nsw i64 %r.1, -1
  br label %while.cond3

while.end8:                                       ; preds = %28
  %sigma_node35 = phi i64 [ %29, %28 ]
  %sigma_node33 = phi i64 [ %phi_node32, %28 ]
  %cmp9 = icmp slt i64 %l.1, %r.1
  br i1 %cmp9, label %if.then, label %while.end8.if.end_crit_edge

while.end8.if.end_crit_edge:                      ; preds = %while.end8
  %sigma_node45 = phi i64 [ %r.1, %while.end8 ]
  %sigma_node38 = phi i64 [ %l.1, %while.end8 ]
  br label %if.end

if.then:                                          ; preds = %while.end8
  %sigma_node43 = phi i64 [ %r.1, %while.end8 ]
  %sigma_node36 = phi i64 [ %l.1, %while.end8 ]
  %arrayidx10 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %sigma_node36, !byte_size !0, !safe !1
  %30 = load %struct.basket** %arrayidx10, align 8
  %arrayidx11 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %sigma_node43, !byte_size !0, !safe !1
  %31 = load %struct.basket** %arrayidx11, align 8
  %arrayidx12 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %sigma_node36, !byte_size !0, !safe !1
  store %struct.basket* %31, %struct.basket** %arrayidx12, align 8
  %arrayidx13 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %sigma_node43, !byte_size !0, !safe !1
  store %struct.basket* %30, %struct.basket** %arrayidx13, align 8
  br label %if.end

if.end:                                           ; preds = %while.end8.if.end_crit_edge, %if.then
  %phi_node44 = phi i64 [ %sigma_node43, %if.then ], [ %sigma_node45, %while.end8.if.end_crit_edge ]
  %phi_node37 = phi i64 [ %sigma_node36, %if.then ], [ %sigma_node38, %while.end8.if.end_crit_edge ]
  %cmp14 = icmp sle i64 %phi_node37, %phi_node44
  br i1 %cmp14, label %if.then15, label %if.end.if.end18_crit_edge

if.end.if.end18_crit_edge:                        ; preds = %if.end
  %sigma_node42 = phi i64 [ %phi_node44, %if.end ]
  %sigma_node40 = phi i64 [ %phi_node37, %if.end ]
  br label %if.end18

if.then15:                                        ; preds = %if.end
  %sigma_node41 = phi i64 [ %phi_node44, %if.end ]
  %sigma_node39 = phi i64 [ %phi_node37, %if.end ]
  %inc16 = add nsw i64 %sigma_node39, 1
  %dec17 = add nsw i64 %sigma_node41, -1
  br label %if.end18

if.end18:                                         ; preds = %if.end.if.end18_crit_edge, %if.then15
  %l.2 = phi i64 [ %inc16, %if.then15 ], [ %sigma_node40, %if.end.if.end18_crit_edge ]
  %r.2 = phi i64 [ %dec17, %if.then15 ], [ %sigma_node42, %if.end.if.end18_crit_edge ]
  br label %do.cond

do.cond:                                          ; preds = %if.end18
  %cmp19 = icmp sle i64 %l.2, %r.2
  br i1 %cmp19, label %do.cond.do.body_crit_edge, label %do.end

do.cond.do.body_crit_edge:                        ; preds = %do.cond
  %sigma_node48 = phi i64 [ %r.2, %do.cond ]
  %sigma_node46 = phi i64 [ %l.2, %do.cond ]
  br label %do.body

do.end:                                           ; preds = %do.cond
  %sigma_node49 = phi i64 [ %r.2, %do.cond ]
  %sigma_node47 = phi i64 [ %l.2, %do.cond ]
  %cmp20 = icmp slt i64 %min, %sigma_node49
  br i1 %cmp20, label %if.then21, label %do.end.if.end22_crit_edge

do.end.if.end22_crit_edge:                        ; preds = %do.end
  %sigma_node53 = phi i64 [ %sigma_node49, %do.end ]
  %sigma_node51 = phi i64 [ %min, %do.end ]
  br label %if.end22

if.then21:                                        ; preds = %do.end
  %sigma_node52 = phi i64 [ %sigma_node49, %do.end ]
  %sigma_node50 = phi i64 [ %min, %do.end ]
  call void @sort_basket(i64 %sigma_node50, i64 %sigma_node52)
  br label %if.end22

if.end22:                                         ; preds = %do.end.if.end22_crit_edge, %if.then21
  %cmp23 = icmp slt i64 %sigma_node47, %max
  br i1 %cmp23, label %land.lhs.true, label %if.end22.if.end26_crit_edge

if.end22.if.end26_crit_edge:                      ; preds = %if.end22
  %sigma_node57 = phi i64 [ %max, %if.end22 ]
  %sigma_node55 = phi i64 [ %sigma_node47, %if.end22 ]
  br label %if.end26

land.lhs.true:                                    ; preds = %if.end22
  %sigma_node56 = phi i64 [ %max, %if.end22 ]
  %sigma_node54 = phi i64 [ %sigma_node47, %if.end22 ]
  %cmp24 = icmp sle i64 %sigma_node54, 50
  br i1 %cmp24, label %if.then25, label %land.lhs.true.if.end26_crit_edge

land.lhs.true.if.end26_crit_edge:                 ; preds = %land.lhs.true
  %sigma_node59 = phi i64 [ %sigma_node54, %land.lhs.true ]
  br label %if.end26

if.then25:                                        ; preds = %land.lhs.true
  %sigma_node58 = phi i64 [ %sigma_node54, %land.lhs.true ]
  call void @sort_basket(i64 %sigma_node58, i64 %sigma_node56)
  br label %if.end26

if.end26:                                         ; preds = %land.lhs.true.if.end26_crit_edge, %if.end22.if.end26_crit_edge, %if.then25
  ret void
}

define %struct.arc* @primal_bea_mpp(i64 %m, %struct.arc* %arcs, %struct.arc* %stop_arcs, i64* %red_cost_of_bea) address_safety nounwind {
entry:
  %0 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @initialize, i32 0, i32 0), align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %sigma_node = phi i64 [ %0, %entry ]
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %i.0 = phi i64 [ 1, %if.then ], [ %inc, %for.inc ]
  %cmp = icmp slt i64 %i.0, 351
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node77 = phi i64 [ %i.0, %for.cond ]
  %arrayidx = getelementptr inbounds [351 x %struct.basket]* getelementptr inbounds ({ [351 x %struct.basket], [2104 x i8] }* @basket, i32 0, i32 0), i32 0, i64 %sigma_node77, !byte_size !2, !safe !1, !index_size !3
  %arrayidx1 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %sigma_node77, !byte_size !4, !safe !1, !index_size !3
  store %struct.basket* %arrayidx, %struct.basket** %arrayidx1, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i64 %sigma_node77, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node78 = phi i64 [ %i.0, %for.cond ]
  %sub = sub nsw i64 %m, 1
  %div = sdiv i64 %sub, 300
  %add = add nsw i64 %div, 1
  store i64 %add, i64* getelementptr inbounds ({ i64, [56 x i8] }* @nr_group, i32 0, i32 0), align 8
  store i64 0, i64* getelementptr inbounds ({ i64, [56 x i8] }* @group_pos, i32 0, i32 0), align 8
  store i64 0, i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  store i64 0, i64* getelementptr inbounds ({ i64, [56 x i8] }* @initialize, i32 0, i32 0), align 8
  br label %if.end28

if.else:                                          ; preds = %entry
  %sigma_node76 = phi i64 [ %0, %entry ]
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc25, %if.else
  %i.1 = phi i64 [ 2, %if.else ], [ %inc26, %for.inc25 ]
  %next.0 = phi i64 [ 0, %if.else ], [ %next.1, %for.inc25 ]
  %cmp3 = icmp sle i64 %i.1, 50
  br i1 %cmp3, label %land.rhs, label %for.cond2.land.end_crit_edge

for.cond2.land.end_crit_edge:                     ; preds = %for.cond2
  %sigma_node80 = phi i64 [ %i.1, %for.cond2 ]
  br label %land.end

land.rhs:                                         ; preds = %for.cond2
  %sigma_node79 = phi i64 [ %i.1, %for.cond2 ]
  %1 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  %cmp4 = icmp sle i64 %sigma_node79, %1
  br label %land.end

land.end:                                         ; preds = %for.cond2.land.end_crit_edge, %land.rhs
  %phi_node = phi i64 [ %sigma_node79, %land.rhs ], [ %sigma_node80, %for.cond2.land.end_crit_edge ]
  %2 = phi i1 [ false, %for.cond2.land.end_crit_edge ], [ %cmp4, %land.rhs ]
  br i1 %2, label %for.body5, label %for.end27

for.body5:                                        ; preds = %land.end
  %arrayidx6 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %phi_node, !byte_size !0, !safe !1
  %3 = load %struct.basket** %arrayidx6, align 8
  %a = getelementptr inbounds %struct.basket* %3, i32 0, i32 0
  %4 = ptrtoint %struct.arc** %a to i64
  %5 = lshr i64 %4, 3
  %6 = or i64 %5, 17592186044416
  %7 = inttoptr i64 %6 to i8*
  %8 = load i8* %7
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %for.body5
  call void @__asan_report_load8(i64 %4)
  call void asm sideeffect "", ""()
  unreachable

; <label>:11                                      ; preds = %for.body5
  %12 = load %struct.arc** %a, align 8
  %cost = getelementptr inbounds %struct.arc* %12, i32 0, i32 0
  %13 = ptrtoint i64* %cost to i64
  %14 = lshr i64 %13, 3
  %15 = or i64 %14, 17592186044416
  %16 = inttoptr i64 %15 to i8*
  %17 = load i8* %16
  %18 = icmp ne i8 %17, 0
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %11
  call void @__asan_report_load8(i64 %13)
  call void asm sideeffect "", ""()
  unreachable

; <label>:20                                      ; preds = %11
  %21 = load i64* %cost, align 8
  %tail = getelementptr inbounds %struct.arc* %12, i32 0, i32 1
  %22 = ptrtoint %struct.node** %tail to i64
  %23 = lshr i64 %22, 3
  %24 = or i64 %23, 17592186044416
  %25 = inttoptr i64 %24 to i8*
  %26 = load i8* %25
  %27 = icmp ne i8 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %20
  call void @__asan_report_load8(i64 %22)
  call void asm sideeffect "", ""()
  unreachable

; <label>:29                                      ; preds = %20
  %30 = load %struct.node** %tail, align 8
  %potential = getelementptr inbounds %struct.node* %30, i32 0, i32 0
  %31 = ptrtoint i64* %potential to i64
  %32 = lshr i64 %31, 3
  %33 = or i64 %32, 17592186044416
  %34 = inttoptr i64 %33 to i8*
  %35 = load i8* %34
  %36 = icmp ne i8 %35, 0
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %29
  call void @__asan_report_load8(i64 %31)
  call void asm sideeffect "", ""()
  unreachable

; <label>:38                                      ; preds = %29
  %39 = load i64* %potential, align 8
  %sub7 = sub nsw i64 %21, %39
  %head = getelementptr inbounds %struct.arc* %12, i32 0, i32 2
  %40 = ptrtoint %struct.node** %head to i64
  %41 = lshr i64 %40, 3
  %42 = or i64 %41, 17592186044416
  %43 = inttoptr i64 %42 to i8*
  %44 = load i8* %43
  %45 = icmp ne i8 %44, 0
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %38
  call void @__asan_report_load8(i64 %40)
  call void asm sideeffect "", ""()
  unreachable

; <label>:47                                      ; preds = %38
  %48 = load %struct.node** %head, align 8
  %potential8 = getelementptr inbounds %struct.node* %48, i32 0, i32 0
  %49 = ptrtoint i64* %potential8 to i64
  %50 = lshr i64 %49, 3
  %51 = or i64 %50, 17592186044416
  %52 = inttoptr i64 %51 to i8*
  %53 = load i8* %52
  %54 = icmp ne i8 %53, 0
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %47
  call void @__asan_report_load8(i64 %49)
  call void asm sideeffect "", ""()
  unreachable

; <label>:56                                      ; preds = %47
  %57 = load i64* %potential8, align 8
  %add9 = add nsw i64 %sub7, %57
  %cmp10 = icmp slt i64 %add9, 0
  br i1 %cmp10, label %land.lhs.true, label %for.body5.lor.lhs.false_crit_edge

for.body5.lor.lhs.false_crit_edge:                ; preds = %56
  %sigma_node84 = phi i64 [ %add9, %56 ]
  br label %lor.lhs.false

land.lhs.true:                                    ; preds = %56
  %sigma_node81 = phi i64 [ %add9, %56 ]
  %ident = getelementptr inbounds %struct.arc* %12, i32 0, i32 3
  %58 = ptrtoint i32* %ident to i64
  %59 = lshr i64 %58, 3
  %60 = or i64 %59, 17592186044416
  %61 = inttoptr i64 %60 to i8*
  %62 = load i8* %61
  %63 = icmp ne i8 %62, 0
  br i1 %63, label %64, label %70

; <label>:64                                      ; preds = %land.lhs.true
  %65 = and i64 %58, 7
  %66 = add i64 %65, 3
  %67 = trunc i64 %66 to i8
  %68 = icmp sge i8 %67, %62
  br i1 %68, label %69, label %70

; <label>:69                                      ; preds = %64
  call void @__asan_report_load4(i64 %58)
  call void asm sideeffect "", ""()
  unreachable

; <label>:70                                      ; preds = %64, %land.lhs.true
  %71 = load i32* %ident, align 4
  %cmp11 = icmp eq i32 %71, 1
  br i1 %cmp11, label %land.lhs.true.if.then16_crit_edge, label %land.lhs.true.lor.lhs.false_crit_edge

land.lhs.true.lor.lhs.false_crit_edge:            ; preds = %70
  %sigma_node90 = phi i32 [ %71, %70 ]
  br label %lor.lhs.false

land.lhs.true.if.then16_crit_edge:                ; preds = %70
  %sigma_node89 = phi i32 [ %71, %70 ]
  br label %if.then16

lor.lhs.false:                                    ; preds = %land.lhs.true.lor.lhs.false_crit_edge, %for.body5.lor.lhs.false_crit_edge
  %phi_node83 = phi i64 [ %sigma_node81, %land.lhs.true.lor.lhs.false_crit_edge ], [ %sigma_node84, %for.body5.lor.lhs.false_crit_edge ]
  %cmp12 = icmp sgt i64 %phi_node83, 0
  br i1 %cmp12, label %land.lhs.true13, label %lor.lhs.false.if.end_crit_edge

lor.lhs.false.if.end_crit_edge:                   ; preds = %lor.lhs.false
  %sigma_node88 = phi i64 [ %phi_node83, %lor.lhs.false ]
  br label %if.end

land.lhs.true13:                                  ; preds = %lor.lhs.false
  %sigma_node87 = phi i64 [ %phi_node83, %lor.lhs.false ]
  %ident14 = getelementptr inbounds %struct.arc* %12, i32 0, i32 3
  %72 = ptrtoint i32* %ident14 to i64
  %73 = lshr i64 %72, 3
  %74 = or i64 %73, 17592186044416
  %75 = inttoptr i64 %74 to i8*
  %76 = load i8* %75
  %77 = icmp ne i8 %76, 0
  br i1 %77, label %78, label %84

; <label>:78                                      ; preds = %land.lhs.true13
  %79 = and i64 %72, 7
  %80 = add i64 %79, 3
  %81 = trunc i64 %80 to i8
  %82 = icmp sge i8 %81, %76
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %78
  call void @__asan_report_load4(i64 %72)
  call void asm sideeffect "", ""()
  unreachable

; <label>:84                                      ; preds = %78, %land.lhs.true13
  %85 = load i32* %ident14, align 4
  %cmp15 = icmp eq i32 %85, 2
  br i1 %cmp15, label %land.lhs.true13.if.then16_crit_edge, label %land.lhs.true13.if.end_crit_edge

land.lhs.true13.if.end_crit_edge:                 ; preds = %84
  %sigma_node92 = phi i32 [ %85, %84 ]
  br label %if.end

land.lhs.true13.if.then16_crit_edge:              ; preds = %84
  %sigma_node91 = phi i32 [ %85, %84 ]
  br label %if.then16

if.then16:                                        ; preds = %land.lhs.true13.if.then16_crit_edge, %land.lhs.true.if.then16_crit_edge
  %phi_node82 = phi i64 [ %sigma_node81, %land.lhs.true.if.then16_crit_edge ], [ %sigma_node87, %land.lhs.true13.if.then16_crit_edge ]
  %inc17 = add nsw i64 %next.0, 1
  %arrayidx18 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %inc17, !byte_size !0, !safe !1
  %86 = load %struct.basket** %arrayidx18, align 8
  %a19 = getelementptr inbounds %struct.basket* %86, i32 0, i32 0
  %87 = ptrtoint %struct.arc** %a19 to i64
  %88 = lshr i64 %87, 3
  %89 = or i64 %88, 17592186044416
  %90 = inttoptr i64 %89 to i8*
  %91 = load i8* %90
  %92 = icmp ne i8 %91, 0
  br i1 %92, label %93, label %94

; <label>:93                                      ; preds = %if.then16
  call void @__asan_report_store8(i64 %87)
  call void asm sideeffect "", ""()
  unreachable

; <label>:94                                      ; preds = %if.then16
  store %struct.arc* %12, %struct.arc** %a19, align 8
  %arrayidx20 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %inc17, !byte_size !0, !safe !1
  %95 = load %struct.basket** %arrayidx20, align 8
  %cost21 = getelementptr inbounds %struct.basket* %95, i32 0, i32 1
  %96 = ptrtoint i64* %cost21 to i64
  %97 = lshr i64 %96, 3
  %98 = or i64 %97, 17592186044416
  %99 = inttoptr i64 %98 to i8*
  %100 = load i8* %99
  %101 = icmp ne i8 %100, 0
  br i1 %101, label %102, label %103

; <label>:102                                     ; preds = %94
  call void @__asan_report_store8(i64 %96)
  call void asm sideeffect "", ""()
  unreachable

; <label>:103                                     ; preds = %94
  store i64 %phi_node82, i64* %cost21, align 8
  %cmp22 = icmp sge i64 %phi_node82, 0
  br i1 %cmp22, label %cond.true, label %cond.false

cond.true:                                        ; preds = %103
  %sigma_node85 = phi i64 [ %phi_node82, %103 ]
  br label %cond.end

cond.false:                                       ; preds = %103
  %sigma_node86 = phi i64 [ %phi_node82, %103 ]
  %sub23 = sub nsw i64 0, %sigma_node86
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sigma_node85, %cond.true ], [ %sub23, %cond.false ]
  %arrayidx24 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %inc17, !byte_size !0, !safe !1
  %104 = load %struct.basket** %arrayidx24, align 8
  %abs_cost = getelementptr inbounds %struct.basket* %104, i32 0, i32 2
  %105 = ptrtoint i64* %abs_cost to i64
  %106 = lshr i64 %105, 3
  %107 = or i64 %106, 17592186044416
  %108 = inttoptr i64 %107 to i8*
  %109 = load i8* %108
  %110 = icmp ne i8 %109, 0
  br i1 %110, label %111, label %112

; <label>:111                                     ; preds = %cond.end
  call void @__asan_report_store8(i64 %105)
  call void asm sideeffect "", ""()
  unreachable

; <label>:112                                     ; preds = %cond.end
  store i64 %cond, i64* %abs_cost, align 8
  br label %if.end

if.end:                                           ; preds = %land.lhs.true13.if.end_crit_edge, %lor.lhs.false.if.end_crit_edge, %112
  %next.1 = phi i64 [ %inc17, %112 ], [ %next.0, %land.lhs.true13.if.end_crit_edge ], [ %next.0, %lor.lhs.false.if.end_crit_edge ]
  br label %for.inc25

for.inc25:                                        ; preds = %if.end
  %inc26 = add nsw i64 %phi_node, 1
  br label %for.cond2

for.end27:                                        ; preds = %land.end
  store i64 %next.0, i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  br label %if.end28

if.end28:                                         ; preds = %for.end27, %for.end
  %113 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @group_pos, i32 0, i32 0), align 8
  br label %NEXT

NEXT:                                             ; preds = %if.then69, %if.end28
  %phi_node114 = phi i64 [ %sigma_node113, %if.then69 ], [ %113, %if.end28 ]
  %phi_node98 = phi %struct.arc* [ %phi_node96, %if.then69 ], [ %stop_arcs, %if.end28 ]
  %114 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @group_pos, i32 0, i32 0), align 8
  %add.ptr = getelementptr inbounds %struct.arc* %arcs, i64 %114
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc59, %NEXT
  %phi_node96 = phi %struct.arc* [ %sigma_node95, %for.inc59 ], [ %phi_node98, %NEXT ]
  %arc.0 = phi %struct.arc* [ %add.ptr, %NEXT ], [ %add.ptr60, %for.inc59 ]
  %cmp30 = icmp ult %struct.arc* %arc.0, %phi_node96
  br i1 %cmp30, label %for.body31, label %for.end61

for.body31:                                       ; preds = %for.cond29
  %sigma_node95 = phi %struct.arc* [ %phi_node96, %for.cond29 ]
  %sigma_node93 = phi %struct.arc* [ %arc.0, %for.cond29 ]
  %ident32 = getelementptr inbounds %struct.arc* %sigma_node93, i32 0, i32 3
  %115 = ptrtoint i32* %ident32 to i64
  %116 = lshr i64 %115, 3
  %117 = or i64 %116, 17592186044416
  %118 = inttoptr i64 %117 to i8*
  %119 = load i8* %118
  %120 = icmp ne i8 %119, 0
  br i1 %120, label %121, label %127

; <label>:121                                     ; preds = %for.body31
  %122 = and i64 %115, 7
  %123 = add i64 %122, 3
  %124 = trunc i64 %123 to i8
  %125 = icmp sge i8 %124, %119
  br i1 %125, label %126, label %127

; <label>:126                                     ; preds = %121
  call void @__asan_report_load4(i64 %115)
  call void asm sideeffect "", ""()
  unreachable

; <label>:127                                     ; preds = %121, %for.body31
  %128 = load i32* %ident32, align 4
  %cmp33 = icmp sgt i32 %128, 0
  br i1 %cmp33, label %if.then34, label %for.body31.if.end58_crit_edge

for.body31.if.end58_crit_edge:                    ; preds = %127
  %sigma_node100 = phi i32 [ %128, %127 ]
  br label %if.end58

if.then34:                                        ; preds = %127
  %sigma_node99 = phi i32 [ %128, %127 ]
  %cost35 = getelementptr inbounds %struct.arc* %sigma_node93, i32 0, i32 0
  %129 = ptrtoint i64* %cost35 to i64
  %130 = lshr i64 %129, 3
  %131 = or i64 %130, 17592186044416
  %132 = inttoptr i64 %131 to i8*
  %133 = load i8* %132
  %134 = icmp ne i8 %133, 0
  br i1 %134, label %135, label %136

; <label>:135                                     ; preds = %if.then34
  call void @__asan_report_load8(i64 %129)
  call void asm sideeffect "", ""()
  unreachable

; <label>:136                                     ; preds = %if.then34
  %137 = load i64* %cost35, align 8
  %tail36 = getelementptr inbounds %struct.arc* %sigma_node93, i32 0, i32 1
  %138 = ptrtoint %struct.node** %tail36 to i64
  %139 = lshr i64 %138, 3
  %140 = or i64 %139, 17592186044416
  %141 = inttoptr i64 %140 to i8*
  %142 = load i8* %141
  %143 = icmp ne i8 %142, 0
  br i1 %143, label %144, label %145

; <label>:144                                     ; preds = %136
  call void @__asan_report_load8(i64 %138)
  call void asm sideeffect "", ""()
  unreachable

; <label>:145                                     ; preds = %136
  %146 = load %struct.node** %tail36, align 8
  %potential37 = getelementptr inbounds %struct.node* %146, i32 0, i32 0
  %147 = ptrtoint i64* %potential37 to i64
  %148 = lshr i64 %147, 3
  %149 = or i64 %148, 17592186044416
  %150 = inttoptr i64 %149 to i8*
  %151 = load i8* %150
  %152 = icmp ne i8 %151, 0
  br i1 %152, label %153, label %154

; <label>:153                                     ; preds = %145
  call void @__asan_report_load8(i64 %147)
  call void asm sideeffect "", ""()
  unreachable

; <label>:154                                     ; preds = %145
  %155 = load i64* %potential37, align 8
  %sub38 = sub nsw i64 %137, %155
  %head39 = getelementptr inbounds %struct.arc* %sigma_node93, i32 0, i32 2
  %156 = ptrtoint %struct.node** %head39 to i64
  %157 = lshr i64 %156, 3
  %158 = or i64 %157, 17592186044416
  %159 = inttoptr i64 %158 to i8*
  %160 = load i8* %159
  %161 = icmp ne i8 %160, 0
  br i1 %161, label %162, label %163

; <label>:162                                     ; preds = %154
  call void @__asan_report_load8(i64 %156)
  call void asm sideeffect "", ""()
  unreachable

; <label>:163                                     ; preds = %154
  %164 = load %struct.node** %head39, align 8
  %potential40 = getelementptr inbounds %struct.node* %164, i32 0, i32 0
  %165 = ptrtoint i64* %potential40 to i64
  %166 = lshr i64 %165, 3
  %167 = or i64 %166, 17592186044416
  %168 = inttoptr i64 %167 to i8*
  %169 = load i8* %168
  %170 = icmp ne i8 %169, 0
  br i1 %170, label %171, label %172

; <label>:171                                     ; preds = %163
  call void @__asan_report_load8(i64 %165)
  call void asm sideeffect "", ""()
  unreachable

; <label>:172                                     ; preds = %163
  %173 = load i64* %potential40, align 8
  %add41 = add nsw i64 %sub38, %173
  br label %if.then34.split

if.then34.split:                                  ; preds = %172
  %omega_node = phi %struct.arc* [ %sigma_node93, %172 ]
  %call = call i32 @bea_is_dual_infeasible(%struct.arc* %omega_node, i64 %add41)
  %tobool42 = icmp ne i32 %call, 0
  br i1 %tobool42, label %if.then43, label %if.then34.if.end57_crit_edge

if.then34.if.end57_crit_edge:                     ; preds = %if.then34.split
  %sigma_node102 = phi i32 [ %call, %if.then34.split ]
  br label %if.end57

if.then43:                                        ; preds = %if.then34.split
  %sigma_node101 = phi i32 [ %call, %if.then34.split ]
  %174 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  %inc44 = add nsw i64 %174, 1
  store i64 %inc44, i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  %175 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  %arrayidx45 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %175, !byte_size !0, !safe !1
  %176 = load %struct.basket** %arrayidx45, align 8
  %a46 = getelementptr inbounds %struct.basket* %176, i32 0, i32 0
  %177 = ptrtoint %struct.arc** %a46 to i64
  %178 = lshr i64 %177, 3
  %179 = or i64 %178, 17592186044416
  %180 = inttoptr i64 %179 to i8*
  %181 = load i8* %180
  %182 = icmp ne i8 %181, 0
  br i1 %182, label %183, label %184

; <label>:183                                     ; preds = %if.then43
  call void @__asan_report_store8(i64 %177)
  call void asm sideeffect "", ""()
  unreachable

; <label>:184                                     ; preds = %if.then43
  store %struct.arc* %omega_node, %struct.arc** %a46, align 8
  %185 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  %arrayidx47 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %185, !byte_size !0, !safe !1
  %186 = load %struct.basket** %arrayidx47, align 8
  %cost48 = getelementptr inbounds %struct.basket* %186, i32 0, i32 1
  %187 = ptrtoint i64* %cost48 to i64
  %188 = lshr i64 %187, 3
  %189 = or i64 %188, 17592186044416
  %190 = inttoptr i64 %189 to i8*
  %191 = load i8* %190
  %192 = icmp ne i8 %191, 0
  br i1 %192, label %193, label %194

; <label>:193                                     ; preds = %184
  call void @__asan_report_store8(i64 %187)
  call void asm sideeffect "", ""()
  unreachable

; <label>:194                                     ; preds = %184
  store i64 %add41, i64* %cost48, align 8
  %cmp49 = icmp sge i64 %add41, 0
  br i1 %cmp49, label %cond.true50, label %cond.false51

cond.true50:                                      ; preds = %194
  %sigma_node103 = phi i64 [ %add41, %194 ]
  br label %cond.end53

cond.false51:                                     ; preds = %194
  %sigma_node104 = phi i64 [ %add41, %194 ]
  %sub52 = sub nsw i64 0, %sigma_node104
  br label %cond.end53

cond.end53:                                       ; preds = %cond.false51, %cond.true50
  %cond54 = phi i64 [ %sigma_node103, %cond.true50 ], [ %sub52, %cond.false51 ]
  %195 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  %arrayidx55 = getelementptr inbounds [351 x %struct.basket*]* getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0), i32 0, i64 %195, !byte_size !0, !safe !1
  %196 = load %struct.basket** %arrayidx55, align 8
  %abs_cost56 = getelementptr inbounds %struct.basket* %196, i32 0, i32 2
  %197 = ptrtoint i64* %abs_cost56 to i64
  %198 = lshr i64 %197, 3
  %199 = or i64 %198, 17592186044416
  %200 = inttoptr i64 %199 to i8*
  %201 = load i8* %200
  %202 = icmp ne i8 %201, 0
  br i1 %202, label %203, label %204

; <label>:203                                     ; preds = %cond.end53
  call void @__asan_report_store8(i64 %197)
  call void asm sideeffect "", ""()
  unreachable

; <label>:204                                     ; preds = %cond.end53
  store i64 %cond54, i64* %abs_cost56, align 8
  br label %if.end57

if.end57:                                         ; preds = %if.then34.if.end57_crit_edge, %204
  br label %if.end58

if.end58:                                         ; preds = %for.body31.if.end58_crit_edge, %if.end57
  %phi_node118 = phi %struct.arc* [ %sigma_node93, %for.body31.if.end58_crit_edge ], [ %omega_node, %if.end57 ]
  br label %for.inc59

for.inc59:                                        ; preds = %if.end58
  %205 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @nr_group, i32 0, i32 0), align 8
  %add.ptr60 = getelementptr inbounds %struct.arc* %phi_node118, i64 %205
  br label %for.cond29

for.end61:                                        ; preds = %for.cond29
  %sigma_node97 = phi %struct.arc* [ %phi_node96, %for.cond29 ]
  %sigma_node94 = phi %struct.arc* [ %arc.0, %for.cond29 ]
  %206 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @group_pos, i32 0, i32 0), align 8
  %inc62 = add nsw i64 %206, 1
  store i64 %inc62, i64* getelementptr inbounds ({ i64, [56 x i8] }* @group_pos, i32 0, i32 0), align 8
  %207 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @nr_group, i32 0, i32 0), align 8
  %cmp63 = icmp eq i64 %inc62, %207
  br i1 %cmp63, label %if.then64, label %for.end61.if.end65_crit_edge

for.end61.if.end65_crit_edge:                     ; preds = %for.end61
  %sigma_node108 = phi i64 [ %207, %for.end61 ]
  %sigma_node106 = phi i64 [ %inc62, %for.end61 ]
  br label %if.end65

if.then64:                                        ; preds = %for.end61
  %sigma_node107 = phi i64 [ %207, %for.end61 ]
  %sigma_node105 = phi i64 [ %inc62, %for.end61 ]
  store i64 0, i64* getelementptr inbounds ({ i64, [56 x i8] }* @group_pos, i32 0, i32 0), align 8
  br label %if.end65

if.end65:                                         ; preds = %for.end61.if.end65_crit_edge, %if.then64
  %208 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  %cmp66 = icmp slt i64 %208, 50
  br i1 %cmp66, label %land.lhs.true67, label %if.end65.if.end70_crit_edge

if.end65.if.end70_crit_edge:                      ; preds = %if.end65
  %sigma_node110 = phi i64 [ %208, %if.end65 ]
  br label %if.end70

land.lhs.true67:                                  ; preds = %if.end65
  %sigma_node109 = phi i64 [ %208, %if.end65 ]
  %209 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @group_pos, i32 0, i32 0), align 8
  %cmp68 = icmp ne i64 %209, %phi_node114
  br i1 %cmp68, label %if.then69, label %land.lhs.true67.if.end70_crit_edge

land.lhs.true67.if.end70_crit_edge:               ; preds = %land.lhs.true67
  %sigma_node115 = phi i64 [ %phi_node114, %land.lhs.true67 ]
  %sigma_node112 = phi i64 [ %209, %land.lhs.true67 ]
  br label %if.end70

if.then69:                                        ; preds = %land.lhs.true67
  %sigma_node113 = phi i64 [ %phi_node114, %land.lhs.true67 ]
  %sigma_node111 = phi i64 [ %209, %land.lhs.true67 ]
  br label %NEXT

if.end70:                                         ; preds = %land.lhs.true67.if.end70_crit_edge, %if.end65.if.end70_crit_edge
  %210 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  %cmp71 = icmp eq i64 %210, 0
  br i1 %cmp71, label %if.then72, label %if.end73

if.then72:                                        ; preds = %if.end70
  %sigma_node116 = phi i64 [ %210, %if.end70 ]
  store i64 1, i64* getelementptr inbounds ({ i64, [56 x i8] }* @initialize, i32 0, i32 0), align 8
  %211 = ptrtoint i64* %red_cost_of_bea to i64
  %212 = lshr i64 %211, 3
  %213 = or i64 %212, 17592186044416
  %214 = inttoptr i64 %213 to i8*
  %215 = load i8* %214
  %216 = icmp ne i8 %215, 0
  br i1 %216, label %217, label %218

; <label>:217                                     ; preds = %if.then72
  call void @__asan_report_store8(i64 %211)
  call void asm sideeffect "", ""()
  unreachable

; <label>:218                                     ; preds = %if.then72
  store i64 0, i64* %red_cost_of_bea, align 8
  br label %return

if.end73:                                         ; preds = %if.end70
  %sigma_node117 = phi i64 [ %210, %if.end70 ]
  %219 = load i64* getelementptr inbounds ({ i64, [56 x i8] }* @basket_size, i32 0, i32 0), align 8
  call void @sort_basket(i64 1, i64 %219)
  %220 = load i8* inttoptr (i64 or (i64 lshr (i64 ptrtoint (%struct.basket** getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0, i64 1) to i64), i64 3), i64 17592186044416) to i8*)
  %221 = icmp ne i8 %220, 0
  br i1 %221, label %222, label %223

; <label>:222                                     ; preds = %if.end73
  call void @__asan_report_load8(i64 ptrtoint (%struct.basket** getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0, i64 1) to i64))
  call void asm sideeffect "", ""()
  unreachable

; <label>:223                                     ; preds = %if.end73
  %224 = load %struct.basket** getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0, i64 1), align 8
  %cost74 = getelementptr inbounds %struct.basket* %224, i32 0, i32 1
  %225 = ptrtoint i64* %cost74 to i64
  %226 = lshr i64 %225, 3
  %227 = or i64 %226, 17592186044416
  %228 = inttoptr i64 %227 to i8*
  %229 = load i8* %228
  %230 = icmp ne i8 %229, 0
  br i1 %230, label %231, label %232

; <label>:231                                     ; preds = %223
  call void @__asan_report_load8(i64 %225)
  call void asm sideeffect "", ""()
  unreachable

; <label>:232                                     ; preds = %223
  %233 = load i64* %cost74, align 8
  %234 = ptrtoint i64* %red_cost_of_bea to i64
  %235 = lshr i64 %234, 3
  %236 = or i64 %235, 17592186044416
  %237 = inttoptr i64 %236 to i8*
  %238 = load i8* %237
  %239 = icmp ne i8 %238, 0
  br i1 %239, label %240, label %241

; <label>:240                                     ; preds = %232
  call void @__asan_report_store8(i64 %234)
  call void asm sideeffect "", ""()
  unreachable

; <label>:241                                     ; preds = %232
  store i64 %233, i64* %red_cost_of_bea, align 8
  %242 = load %struct.basket** getelementptr inbounds ({ [351 x %struct.basket*], [680 x i8] }* @perm, i32 0, i32 0, i64 1), align 8
  %a75 = getelementptr inbounds %struct.basket* %242, i32 0, i32 0
  %243 = ptrtoint %struct.arc** %a75 to i64
  %244 = lshr i64 %243, 3
  %245 = or i64 %244, 17592186044416
  %246 = inttoptr i64 %245 to i8*
  %247 = load i8* %246
  %248 = icmp ne i8 %247, 0
  br i1 %248, label %249, label %250

; <label>:249                                     ; preds = %241
  call void @__asan_report_load8(i64 %243)
  call void asm sideeffect "", ""()
  unreachable

; <label>:250                                     ; preds = %241
  %251 = load %struct.arc** %a75, align 8
  br label %return

return:                                           ; preds = %250, %218
  %retval.0 = phi %struct.arc* [ null, %218 ], [ %251, %250 ]
  ret %struct.arc* %retval.0
}

define internal void @asan.module_ctor() {
  call void @__asan_init()
  %1 = load volatile i64* @__asan_mapping_offset
  %2 = load volatile i64* @__asan_mapping_scale
  call void @__asan_register_globals(i64 ptrtoint ([6 x { i64, i64, i64, i64, i64 }]* @0 to i64), i64 6)
  ret void
}

declare void @__asan_init()

declare void @__asan_report_load1(i64)

declare void @__asan_report_load2(i64)

declare void @__asan_report_load4(i64)

declare void @__asan_report_load8(i64)

declare void @__asan_report_load16(i64)

declare void @__asan_report_store1(i64)

declare void @__asan_report_store2(i64)

declare void @__asan_report_store4(i64)

declare void @__asan_report_store8(i64)

declare void @__asan_report_store16(i64)

declare void @__asan_handle_no_return()

declare void @__asan_before_dynamic_init(i64, i64)

declare void @__asan_after_dynamic_init()

declare void @__asan_register_globals(i64, i64)

declare void @__asan_unregister_globals(i64, i64)

define internal void @asan.module_dtor() {
  call void @__asan_unregister_globals(i64 ptrtoint ([6 x { i64, i64, i64, i64, i64 }]* @0 to i64), i64 6)
  ret void
}

!0 = metadata !{i32 2816}
!1 = metadata !{}
!2 = metadata !{i32 24}
!3 = metadata !{i32 1}
!4 = metadata !{i32 8}
