; ModuleID = 'mcf.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.network = type { [200 x i8], [200 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double, i64, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i64 }
%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }

@net = common global %struct.network zeroinitializer, align 8
@.str = private unnamed_addr constant { [34 x i8], [62 x i8] } { [34 x i8] c"active arcs                : %ld\0A\00", [62 x i8] zeroinitializer }, align 32
@.str1 = private unnamed_addr constant { [34 x i8], [62 x i8] } { [34 x i8] c"simplex iterations         : %ld\0A\00", [62 x i8] zeroinitializer }, align 32
@.str2 = private unnamed_addr constant { [36 x i8], [60 x i8] } { [36 x i8] c"objective value            : %0.0f\0A\00", [60 x i8] zeroinitializer }, align 32
@.str3 = private unnamed_addr constant { [34 x i8], [62 x i8] } { [34 x i8] c"erased arcs                : %ld\0A\00", [62 x i8] zeroinitializer }, align 32
@.str4 = private unnamed_addr constant { [34 x i8], [62 x i8] } { [34 x i8] c"new implicit arcs          : %ld\0A\00", [62 x i8] zeroinitializer }, align 32
@.str5 = private unnamed_addr constant { [29 x i8], [35 x i8] } { [29 x i8] c"not enough memory, exit(-1)\0A\00", [35 x i8] zeroinitializer }, align 32
@.str6 = private unnamed_addr constant { [34 x i8], [62 x i8] } { [34 x i8] c"checksum                   : %ld\0A\00", [62 x i8] zeroinitializer }, align 32
@.str7 = private unnamed_addr constant { [32 x i8], [32 x i8] } { [32 x i8] c"\0AMCF SPEC CPU2006 version 1.10\0A\00", [32 x i8] zeroinitializer }, align 32
@.str8 = private unnamed_addr constant { [52 x i8], [44 x i8] } { [52 x i8] c"Copyright (c) 1998-2000 Zuse Institut Berlin (ZIB)\0A\00", [44 x i8] zeroinitializer }, align 32
@.str9 = private unnamed_addr constant { [46 x i8], [50 x i8] } { [46 x i8] c"Copyright (c) 2000-2002 Andreas Loebel & ZIB\0A\00", [50 x i8] zeroinitializer }, align 32
@.str10 = private unnamed_addr constant { [40 x i8], [56 x i8] } { [40 x i8] c"Copyright (c) 2003-2005 Andreas Loebel\0A\00", [56 x i8] zeroinitializer }, align 32
@.str11 = private unnamed_addr constant { [2 x i8], [62 x i8] } { [2 x i8] c"\0A\00", [62 x i8] zeroinitializer }, align 32
@.str12 = private unnamed_addr constant { [18 x i8], [46 x i8] } { [18 x i8] c"read error, exit\0A\00", [46 x i8] zeroinitializer }, align 32
@.str13 = private unnamed_addr constant { [34 x i8], [62 x i8] } { [34 x i8] c"nodes                      : %ld\0A\00", [62 x i8] zeroinitializer }, align 32
@.str14 = private unnamed_addr constant { [6 x i8], [58 x i8] } { [6 x i8] c"done\0A\00", [58 x i8] zeroinitializer }, align 32
@.str15 = private unnamed_addr constant { [8 x i8], [56 x i8] } { [8 x i8] c"mcf.out\00", [56 x i8] zeroinitializer }, align 32
@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]
@__asan_gen_ = private constant [13 x i8] c".str (mcf.c)\00"
@__asan_gen_16 = private constant [14 x i8] c".str1 (mcf.c)\00"
@__asan_gen_17 = private constant [14 x i8] c".str2 (mcf.c)\00"
@__asan_gen_18 = private constant [14 x i8] c".str3 (mcf.c)\00"
@__asan_gen_19 = private constant [14 x i8] c".str4 (mcf.c)\00"
@__asan_gen_20 = private constant [14 x i8] c".str5 (mcf.c)\00"
@__asan_gen_21 = private constant [14 x i8] c".str6 (mcf.c)\00"
@__asan_gen_22 = private constant [14 x i8] c".str7 (mcf.c)\00"
@__asan_gen_23 = private constant [14 x i8] c".str8 (mcf.c)\00"
@__asan_gen_24 = private constant [14 x i8] c".str9 (mcf.c)\00"
@__asan_gen_25 = private constant [15 x i8] c".str10 (mcf.c)\00"
@__asan_gen_26 = private constant [15 x i8] c".str11 (mcf.c)\00"
@__asan_gen_27 = private constant [15 x i8] c".str12 (mcf.c)\00"
@__asan_gen_28 = private constant [15 x i8] c".str13 (mcf.c)\00"
@__asan_gen_29 = private constant [15 x i8] c".str14 (mcf.c)\00"
@__asan_gen_30 = private constant [15 x i8] c".str15 (mcf.c)\00"
@0 = private global [16 x { i64, i64, i64, i64, i64 }] [{ i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [34 x i8], [62 x i8] }* @.str to i64), i64 34, i64 96, i64 ptrtoint ([13 x i8]* @__asan_gen_ to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [34 x i8], [62 x i8] }* @.str1 to i64), i64 34, i64 96, i64 ptrtoint ([14 x i8]* @__asan_gen_16 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [36 x i8], [60 x i8] }* @.str2 to i64), i64 36, i64 96, i64 ptrtoint ([14 x i8]* @__asan_gen_17 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [34 x i8], [62 x i8] }* @.str3 to i64), i64 34, i64 96, i64 ptrtoint ([14 x i8]* @__asan_gen_18 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [34 x i8], [62 x i8] }* @.str4 to i64), i64 34, i64 96, i64 ptrtoint ([14 x i8]* @__asan_gen_19 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [29 x i8], [35 x i8] }* @.str5 to i64), i64 29, i64 64, i64 ptrtoint ([14 x i8]* @__asan_gen_20 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [34 x i8], [62 x i8] }* @.str6 to i64), i64 34, i64 96, i64 ptrtoint ([14 x i8]* @__asan_gen_21 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [32 x i8], [32 x i8] }* @.str7 to i64), i64 32, i64 64, i64 ptrtoint ([14 x i8]* @__asan_gen_22 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [52 x i8], [44 x i8] }* @.str8 to i64), i64 52, i64 96, i64 ptrtoint ([14 x i8]* @__asan_gen_23 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [46 x i8], [50 x i8] }* @.str9 to i64), i64 46, i64 96, i64 ptrtoint ([14 x i8]* @__asan_gen_24 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [40 x i8], [56 x i8] }* @.str10 to i64), i64 40, i64 96, i64 ptrtoint ([15 x i8]* @__asan_gen_25 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [2 x i8], [62 x i8] }* @.str11 to i64), i64 2, i64 64, i64 ptrtoint ([15 x i8]* @__asan_gen_26 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [18 x i8], [46 x i8] }* @.str12 to i64), i64 18, i64 64, i64 ptrtoint ([15 x i8]* @__asan_gen_27 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [34 x i8], [62 x i8] }* @.str13 to i64), i64 34, i64 96, i64 ptrtoint ([15 x i8]* @__asan_gen_28 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [6 x i8], [58 x i8] }* @.str14 to i64), i64 6, i64 64, i64 ptrtoint ([15 x i8]* @__asan_gen_29 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [8 x i8], [56 x i8] }* @.str15 to i64), i64 8, i64 64, i64 ptrtoint ([15 x i8]* @__asan_gen_30 to i64), i64 0 }]
@llvm.global_dtors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_dtor }]

define i64 @global_opt() address_safety nounwind {
entry:
  %0 = load i8* inttoptr (i64 or (i64 lshr (i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 3) to i64), i64 3), i64 17592186044416) to i8*)
  %1 = icmp ne i8 %0, 0
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %entry
  call void @__asan_report_load8(i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 3) to i64))
  call void asm sideeffect "", ""()
  unreachable

; <label>:3                                       ; preds = %entry
  %4 = load i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 3), align 8
  %cmp = icmp sle i64 %4, 15000
  %cond = select i1 %cmp, i32 5, i32 5
  %conv = sext i32 %cond to i64
  br label %while.cond

while.cond:                                       ; preds = %if.end23, %3
  %residual_nb_it.0 = phi i64 [ %conv, %3 ], [ %dec, %if.end23 ]
  %new_arcs.0 = phi i64 [ -1, %3 ], [ %sigma_node35, %if.end23 ]
  %tobool = icmp ne i64 %new_arcs.0, 0
  br i1 %tobool, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.cond
  %sigma_node25 = phi i64 [ %new_arcs.0, %while.cond ]
  br label %while.end

while.body:                                       ; preds = %while.cond
  %sigma_node = phi i64 [ %new_arcs.0, %while.cond ]
  %5 = load i8* inttoptr (i64 or (i64 lshr (i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 5) to i64), i64 3), i64 17592186044416) to i8*)
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %while.body
  call void @__asan_report_load8(i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 5) to i64))
  call void asm sideeffect "", ""()
  unreachable

; <label>:8                                       ; preds = %while.body
  %9 = load i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 5), align 8
  br label %while.body.split

while.body.split:                                 ; preds = %8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [34 x i8], [62 x i8] }* @.str, i32 0, i32 0, i32 0), i64 %9)
  br label %while.body.split.split

while.body.split.split:                           ; preds = %while.body.split
  %call1 = call i64 @primal_net_simplex(%struct.network* @net)
  %10 = load i8* inttoptr (i64 or (i64 lshr (i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 27) to i64), i64 3), i64 17592186044416) to i8*)
  %11 = icmp ne i8 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %while.body.split.split
  call void @__asan_report_load8(i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 27) to i64))
  call void asm sideeffect "", ""()
  unreachable

; <label>:13                                      ; preds = %while.body.split.split
  %14 = load i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 27), align 8
  br label %while.body.split.split.split

while.body.split.split.split:                     ; preds = %13
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [34 x i8], [62 x i8] }* @.str1, i32 0, i32 0, i32 0), i64 %14)
  br label %while.body.split.split.split.split

while.body.split.split.split.split:               ; preds = %while.body.split.split.split
  %call3 = call double @flow_cost(%struct.network* @net)
  br label %while.body.split.split.split.split.split

while.body.split.split.split.split.split:         ; preds = %while.body.split.split.split.split
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [36 x i8], [60 x i8] }* @.str2, i32 0, i32 0, i32 0), double %call3)
  %tobool5 = icmp ne i64 %residual_nb_it.0, 0
  br i1 %tobool5, label %if.end, label %if.then

if.then:                                          ; preds = %while.body.split.split.split.split.split
  %sigma_node27 = phi i64 [ %residual_nb_it.0, %while.body.split.split.split.split.split ]
  br label %while.end

if.end:                                           ; preds = %while.body.split.split.split.split.split
  %sigma_node26 = phi i64 [ %residual_nb_it.0, %while.body.split.split.split.split.split ]
  %15 = load i8* inttoptr (i64 or (i64 lshr (i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 7) to i64), i64 3), i64 17592186044416) to i8*)
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %if.end
  call void @__asan_report_load8(i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 7) to i64))
  call void asm sideeffect "", ""()
  unreachable

; <label>:18                                      ; preds = %if.end
  %19 = load i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 7), align 8
  %tobool6 = icmp ne i64 %19, 0
  br i1 %tobool6, label %if.then7, label %if.end.if.end13_crit_edge

if.end.if.end13_crit_edge:                        ; preds = %18
  %sigma_node29 = phi i64 [ %19, %18 ]
  br label %if.end13

if.then7:                                         ; preds = %18
  %sigma_node28 = phi i64 [ %19, %18 ]
  br label %if.then7.split

if.then7.split:                                   ; preds = %if.then7
  %call8 = call i64 @suspend_impl(%struct.network* @net, i64 -1, i64 0)
  %tobool9 = icmp ne i64 %call8, 0
  br i1 %tobool9, label %if.then10, label %if.then7.if.end12_crit_edge

if.then7.if.end12_crit_edge:                      ; preds = %if.then7.split
  %sigma_node31 = phi i64 [ %call8, %if.then7.split ]
  br label %if.end12

if.then10:                                        ; preds = %if.then7.split
  %sigma_node30 = phi i64 [ %call8, %if.then7.split ]
  br label %if.then10.split

if.then10.split:                                  ; preds = %if.then10
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [34 x i8], [62 x i8] }* @.str3, i32 0, i32 0, i32 0), i64 %sigma_node30)
  br label %if.end12

if.end12:                                         ; preds = %if.then7.if.end12_crit_edge, %if.then10.split
  br label %if.end13

if.end13:                                         ; preds = %if.end.if.end13_crit_edge, %if.end12
  br label %if.end13.split

if.end13.split:                                   ; preds = %if.end13
  %call14 = call i64 @price_out_impl(%struct.network* @net)
  %tobool15 = icmp ne i64 %call14, 0
  br i1 %tobool15, label %if.then16, label %if.end13.if.end18_crit_edge

if.end13.if.end18_crit_edge:                      ; preds = %if.end13.split
  %sigma_node33 = phi i64 [ %call14, %if.end13.split ]
  br label %if.end18

if.then16:                                        ; preds = %if.end13.split
  %sigma_node32 = phi i64 [ %call14, %if.end13.split ]
  br label %if.then16.split

if.then16.split:                                  ; preds = %if.then16
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [34 x i8], [62 x i8] }* @.str4, i32 0, i32 0, i32 0), i64 %sigma_node32)
  br label %if.end18

if.end18:                                         ; preds = %if.end13.if.end18_crit_edge, %if.then16.split
  %phi_node = phi i64 [ %sigma_node32, %if.then16.split ], [ %sigma_node33, %if.end13.if.end18_crit_edge ]
  %cmp19 = icmp slt i64 %phi_node, 0
  br i1 %cmp19, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end18
  %sigma_node34 = phi i64 [ %phi_node, %if.end18 ]
  br label %if.then21.split

if.then21.split:                                  ; preds = %if.then21
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [29 x i8], [35 x i8] }* @.str5, i32 0, i32 0, i32 0))
  call void @__asan_handle_no_return()
  call void @exit(i32 -1) noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.end18
  %sigma_node35 = phi i64 [ %phi_node, %if.end18 ]
  %dec = add nsw i64 %sigma_node26, -1
  br label %while.cond

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %if.then
  %20 = load i8* inttoptr (i64 or (i64 lshr (i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 29) to i64), i64 3), i64 17592186044416) to i8*)
  %21 = icmp ne i8 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %while.end
  call void @__asan_report_load8(i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 29) to i64))
  call void asm sideeffect "", ""()
  unreachable

; <label>:23                                      ; preds = %while.end
  %24 = load i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 29), align 8
  br label %while.end.split

while.end.split:                                  ; preds = %23
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [34 x i8], [62 x i8] }* @.str6, i32 0, i32 0, i32 0), i64 %24)
  ret i64 0
}

declare i32 @printf(i8*, ...)

declare i64 @primal_net_simplex(%struct.network*)

declare double @flow_cost(%struct.network*)

declare i64 @suspend_impl(%struct.network*, i64, i64)

declare i64 @price_out_impl(%struct.network*)

declare void @exit(i32) noreturn nounwind

define i32 @main(i32 %argc, i8** %argv) address_safety nounwind {
entry:
  %cmp = icmp slt i32 %argc, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %sigma_node = phi i32 [ %argc, %entry ]
  br label %return

if.end:                                           ; preds = %entry
  %sigma_node21 = phi i32 [ %argc, %entry ]
  br label %if.end.split

if.end.split:                                     ; preds = %if.end
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [32 x i8], [32 x i8] }* @.str7, i32 0, i32 0, i32 0))
  br label %if.end.split.split

if.end.split.split:                               ; preds = %if.end.split
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [52 x i8], [44 x i8] }* @.str8, i32 0, i32 0, i32 0))
  br label %if.end.split.split.split

if.end.split.split.split:                         ; preds = %if.end.split.split
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [46 x i8], [50 x i8] }* @.str9, i32 0, i32 0, i32 0))
  br label %if.end.split.split.split.split

if.end.split.split.split.split:                   ; preds = %if.end.split.split.split
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [40 x i8], [56 x i8] }* @.str10, i32 0, i32 0, i32 0))
  br label %if.end.split.split.split.split.split

if.end.split.split.split.split.split:             ; preds = %if.end.split.split.split.split
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [2 x i8], [62 x i8] }* @.str11, i32 0, i32 0, i32 0))
  br label %if.end.split.split.split.split.split.split

if.end.split.split.split.split.split.split:       ; preds = %if.end.split.split.split.split.split
  %0 = load i8* inttoptr (i64 or (i64 lshr (i64 ptrtoint (%struct.network* @net to i64), i64 3), i64 17592186044416) to i8*)
  %1 = icmp ne i8 %0, 0
  br i1 %1, label %2, label %5

; <label>:2                                       ; preds = %if.end.split.split.split.split.split.split
  %3 = icmp sge i8 0, %0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %2
  call void @__asan_report_store1(i64 ptrtoint (%struct.network* @net to i64))
  call void asm sideeffect "", ""()
  unreachable

; <label>:5                                       ; preds = %2, %if.end.split.split.split.split.split.split
  %6 = load i8* inttoptr (i64 or (i64 lshr (i64 add (i64 ptrtoint (%struct.network* @net to i64), i64 623), i64 3), i64 17592186044416) to i8*)
  %7 = icmp ne i8 %6, 0
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5
  %9 = icmp sge i8 trunc (i64 and (i64 add (i64 ptrtoint (%struct.network* @net to i64), i64 623), i64 7) to i8), %6
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %8
  call void @__asan_report_store1(i64 add (i64 ptrtoint (%struct.network* @net to i64), i64 623))
  call void asm sideeffect "", ""()
  unreachable

; <label>:11                                      ; preds = %8, %5
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds (%struct.network* @net, i32 0, i32 0, i32 0), i8 0, i64 624, i32 1, i1 false)
  %12 = load i8* inttoptr (i64 or (i64 lshr (i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 18) to i64), i64 3), i64 17592186044416) to i8*)
  %13 = icmp ne i8 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  call void @__asan_report_store8(i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 18) to i64))
  call void asm sideeffect "", ""()
  unreachable

; <label>:15                                      ; preds = %11
  store i64 10000000, i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 18), align 8
  %arrayidx = getelementptr inbounds i8** %argv, i64 1
  %16 = ptrtoint i8** %arrayidx to i64
  %17 = lshr i64 %16, 3
  %18 = or i64 %17, 17592186044416
  %19 = inttoptr i64 %18 to i8*
  %20 = load i8* %19
  %21 = icmp ne i8 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %15
  call void @__asan_report_load8(i64 %16)
  call void asm sideeffect "", ""()
  unreachable

; <label>:23                                      ; preds = %15
  %24 = load i8** %arrayidx, align 8
  br label %if.end.split.split.split.split.split.split.split

if.end.split.split.split.split.split.split.split: ; preds = %23
  %omega_node = phi i8* [ %24, %23 ]
  %call5 = call i8* @strcpy(i8* getelementptr inbounds (%struct.network* @net, i32 0, i32 0, i32 0), i8* %omega_node) nounwind
  br label %if.end.split.split.split.split.split.split.split.split

if.end.split.split.split.split.split.split.split.split: ; preds = %if.end.split.split.split.split.split.split.split
  %call6 = call i64 @read_min(%struct.network* @net)
  %tobool = icmp ne i64 %call6, 0
  br i1 %tobool, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.end.split.split.split.split.split.split.split.split
  %sigma_node22 = phi i64 [ %call6, %if.end.split.split.split.split.split.split.split.split ]
  br label %if.then7.split

if.then7.split:                                   ; preds = %if.then7
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [18 x i8], [46 x i8] }* @.str12, i32 0, i32 0, i32 0))
  br label %if.then7.split.split

if.then7.split.split:                             ; preds = %if.then7.split
  %call9 = call i64 @getfree(%struct.network* @net)
  br label %return

if.end10:                                         ; preds = %if.end.split.split.split.split.split.split.split.split
  %sigma_node23 = phi i64 [ %call6, %if.end.split.split.split.split.split.split.split.split ]
  %25 = load i8* inttoptr (i64 or (i64 lshr (i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 3) to i64), i64 3), i64 17592186044416) to i8*)
  %26 = icmp ne i8 %25, 0
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %if.end10
  call void @__asan_report_load8(i64 ptrtoint (i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 3) to i64))
  call void asm sideeffect "", ""()
  unreachable

; <label>:28                                      ; preds = %if.end10
  %29 = load i64* getelementptr inbounds (%struct.network* @net, i32 0, i32 3), align 8
  br label %if.end10.split

if.end10.split:                                   ; preds = %28
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [34 x i8], [62 x i8] }* @.str13, i32 0, i32 0, i32 0), i64 %29)
  br label %if.end10.split.split

if.end10.split.split:                             ; preds = %if.end10.split
  %call12 = call i64 @primal_start_artificial(%struct.network* @net)
  %call13 = call i64 @global_opt()
  br label %if.end10.split.split.split

if.end10.split.split.split:                       ; preds = %if.end10.split.split
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [6 x i8], [58 x i8] }* @.str14, i32 0, i32 0, i32 0))
  br label %if.end10.split.split.split.split

if.end10.split.split.split.split:                 ; preds = %if.end10.split.split.split
  %call15 = call i64 @write_circulations(i8* getelementptr inbounds ({ [8 x i8], [56 x i8] }* @.str15, i32 0, i32 0, i32 0), %struct.network* @net)
  %tobool16 = icmp ne i64 %call15, 0
  br i1 %tobool16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.end10.split.split.split.split
  %sigma_node24 = phi i64 [ %call15, %if.end10.split.split.split.split ]
  br label %if.then17.split

if.then17.split:                                  ; preds = %if.then17
  %call18 = call i64 @getfree(%struct.network* @net)
  br label %return

if.end19:                                         ; preds = %if.end10.split.split.split.split
  %sigma_node25 = phi i64 [ %call15, %if.end10.split.split.split.split ]
  br label %if.end19.split

if.end19.split:                                   ; preds = %if.end19
  %call20 = call i64 @getfree(%struct.network* @net)
  br label %return

return:                                           ; preds = %if.end19.split, %if.then17.split, %if.then7.split.split, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ -1, %if.then7.split.split ], [ -1, %if.then17.split ], [ 0, %if.end19.split ]
  ret i32 %retval.0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i8* @strcpy(i8*, i8*) nounwind

declare i64 @read_min(%struct.network*)

declare i64 @getfree(%struct.network*)

declare i64 @primal_start_artificial(%struct.network*)

declare i64 @write_circulations(i8*, %struct.network*)

define internal void @asan.module_ctor() {
  call void @__asan_init()
  %1 = load volatile i64* @__asan_mapping_offset
  %2 = load volatile i64* @__asan_mapping_scale
  call void @__asan_register_globals(i64 ptrtoint ([16 x { i64, i64, i64, i64, i64 }]* @0 to i64), i64 16)
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
  call void @__asan_unregister_globals(i64 ptrtoint ([16 x { i64, i64, i64, i64, i64 }]* @0 to i64), i64 16)
  ret void
}
