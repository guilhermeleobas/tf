; ModuleID = 'implicit.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.network = type { [200 x i8], [200 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double, i64, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i64 }
%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }

@.str = private unnamed_addr constant { [20 x i8], [44 x i8] } { [20 x i8] c"net->max_new_m >= 3\00", [44 x i8] zeroinitializer }, align 32
@.str1 = private unnamed_addr constant { [11 x i8], [53 x i8] } { [11 x i8] c"implicit.c\00", [53 x i8] zeroinitializer }, align 32
@__PRETTY_FUNCTION__.resize_prob = private unnamed_addr constant { [30 x i8], [34 x i8] } { [30 x i8] c"long resize_prob(network_t *)\00", [34 x i8] zeroinitializer }, align 32
@.str2 = private unnamed_addr constant { [31 x i8], [33 x i8] } { [31 x i8] c"network %s: not enough memory\0A\00", [33 x i8] zeroinitializer }, align 32
@stdout = external global %struct._IO_FILE*
@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]
@__asan_gen_ = private constant [18 x i8] c".str (implicit.c)\00"
@__asan_gen_3 = private constant [19 x i8] c".str1 (implicit.c)\00"
@__asan_gen_4 = private constant [45 x i8] c"__PRETTY_FUNCTION__.resize_prob (implicit.c)\00"
@__asan_gen_5 = private constant [19 x i8] c".str2 (implicit.c)\00"
@0 = private global [4 x { i64, i64, i64, i64, i64 }] [{ i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [20 x i8], [44 x i8] }* @.str to i64), i64 20, i64 64, i64 ptrtoint ([18 x i8]* @__asan_gen_ to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [11 x i8], [53 x i8] }* @.str1 to i64), i64 11, i64 64, i64 ptrtoint ([19 x i8]* @__asan_gen_3 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [30 x i8], [34 x i8] }* @__PRETTY_FUNCTION__.resize_prob to i64), i64 30, i64 64, i64 ptrtoint ([45 x i8]* @__asan_gen_4 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [31 x i8], [33 x i8] }* @.str2 to i64), i64 31, i64 64, i64 ptrtoint ([19 x i8]* @__asan_gen_5 to i64), i64 0 }]
@llvm.global_dtors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_dtor }]

define i64 @resize_prob(%struct.network* %net) address_safety nounwind {
entry:
  %max_new_m = getelementptr inbounds %struct.network* %net, i32 0, i32 9
  %0 = ptrtoint i64* %max_new_m to i64
  %1 = lshr i64 %0, 3
  %2 = or i64 %1, 17592186044416
  %3 = inttoptr i64 %2 to i8*
  %4 = load i8* %3
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %entry
  call void @__asan_report_load8(i64 %0)
  call void asm sideeffect "", ""()
  unreachable

; <label>:7                                       ; preds = %entry
  %8 = load i64* %max_new_m, align 8
  %cmp = icmp sge i64 %8, 3
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %7
  %sigma_node = phi i64 [ %8, %7 ]
  br label %cond.end

cond.false:                                       ; preds = %7
  %sigma_node16 = phi i64 [ %8, %7 ]
  br label %cond.false.split

cond.false.split:                                 ; preds = %cond.false
  call void @__asan_handle_no_return()
  call void @__assert_fail(i8* getelementptr inbounds ({ [20 x i8], [44 x i8] }* @.str, i32 0, i32 0, i32 0), i8* getelementptr inbounds ({ [11 x i8], [53 x i8] }* @.str1, i32 0, i32 0, i32 0), i32 39, i8* getelementptr inbounds ({ [30 x i8], [34 x i8] }* @__PRETTY_FUNCTION__.resize_prob, i32 0, i32 0, i32 0)) noreturn nounwind
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %9, %cond.true
  %max_new_m1 = getelementptr inbounds %struct.network* %net, i32 0, i32 9
  %10 = ptrtoint i64* %max_new_m1 to i64
  %11 = lshr i64 %10, 3
  %12 = or i64 %11, 17592186044416
  %13 = inttoptr i64 %12 to i8*
  %14 = load i8* %13
  %15 = icmp ne i8 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %cond.end
  call void @__asan_report_load8(i64 %10)
  call void asm sideeffect "", ""()
  unreachable

; <label>:17                                      ; preds = %cond.end
  %18 = load i64* %max_new_m1, align 8
  %max_m = getelementptr inbounds %struct.network* %net, i32 0, i32 4
  %19 = ptrtoint i64* %max_m to i64
  %20 = lshr i64 %19, 3
  %21 = or i64 %20, 17592186044416
  %22 = inttoptr i64 %21 to i8*
  %23 = load i8* %22
  %24 = icmp ne i8 %23, 0
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %17
  call void @__asan_report_load8(i64 %19)
  call void asm sideeffect "", ""()
  unreachable

; <label>:26                                      ; preds = %17
  %27 = load i64* %max_m, align 8
  %add = add nsw i64 %27, %18
  store i64 %add, i64* %max_m, align 8
  %max_new_m2 = getelementptr inbounds %struct.network* %net, i32 0, i32 9
  %28 = ptrtoint i64* %max_new_m2 to i64
  %29 = lshr i64 %28, 3
  %30 = or i64 %29, 17592186044416
  %31 = inttoptr i64 %30 to i8*
  %32 = load i8* %31
  %33 = icmp ne i8 %32, 0
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %26
  call void @__asan_report_load8(i64 %28)
  call void asm sideeffect "", ""()
  unreachable

; <label>:35                                      ; preds = %26
  %36 = load i64* %max_new_m2, align 8
  %max_residual_new_m = getelementptr inbounds %struct.network* %net, i32 0, i32 8
  %37 = ptrtoint i64* %max_residual_new_m to i64
  %38 = lshr i64 %37, 3
  %39 = or i64 %38, 17592186044416
  %40 = inttoptr i64 %39 to i8*
  %41 = load i8* %40
  %42 = icmp ne i8 %41, 0
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %35
  call void @__asan_report_load8(i64 %37)
  call void asm sideeffect "", ""()
  unreachable

; <label>:44                                      ; preds = %35
  %45 = load i64* %max_residual_new_m, align 8
  %add3 = add nsw i64 %45, %36
  store i64 %add3, i64* %max_residual_new_m, align 8
  %arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %46 = ptrtoint %struct.arc** %arcs to i64
  %47 = lshr i64 %46, 3
  %48 = or i64 %47, 17592186044416
  %49 = inttoptr i64 %48 to i8*
  %50 = load i8* %49
  %51 = icmp ne i8 %50, 0
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %44
  call void @__asan_report_load8(i64 %46)
  call void asm sideeffect "", ""()
  unreachable

; <label>:53                                      ; preds = %44
  %54 = load %struct.arc** %arcs, align 8
  %55 = bitcast %struct.arc* %54 to i8*
  %max_m4 = getelementptr inbounds %struct.network* %net, i32 0, i32 4
  %56 = ptrtoint i64* %max_m4 to i64
  %57 = lshr i64 %56, 3
  %58 = or i64 %57, 17592186044416
  %59 = inttoptr i64 %58 to i8*
  %60 = load i8* %59
  %61 = icmp ne i8 %60, 0
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %53
  call void @__asan_report_load8(i64 %56)
  call void asm sideeffect "", ""()
  unreachable

; <label>:63                                      ; preds = %53
  %64 = load i64* %max_m4, align 8
  %mul = mul i64 %64, 64
  br label %cond.end.split

cond.end.split:                                   ; preds = %63
  %omega_node = phi i8* [ %55, %63 ]
  %call = call i8* @realloc(i8* %omega_node, i64 %mul) nounwind
  %65 = bitcast i8* %call to %struct.arc*
  %tobool = icmp ne %struct.arc* %65, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %cond.end.split
  %sigma_node20 = phi i8* [ %call, %cond.end.split ]
  %sigma_node18 = phi %struct.arc* [ %65, %cond.end.split ]
  %inputfile = getelementptr inbounds %struct.network* %net, i32 0, i32 0
  %arraydecay = getelementptr inbounds [200 x i8]* %inputfile, i32 0, i32 0
  br label %if.then.split

if.then.split:                                    ; preds = %if.then
  %omega_node32 = phi i8* [ %arraydecay, %if.then ]
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [31 x i8], [33 x i8] }* @.str2, i32 0, i32 0, i32 0), i8* %omega_node32)
  %66 = load %struct._IO_FILE** @stdout, align 8
  br label %if.then.split.split

if.then.split.split:                              ; preds = %if.then.split
  %omega_node33 = phi %struct._IO_FILE* [ %66, %if.then.split ]
  %call6 = call i32 @fflush(%struct._IO_FILE* %omega_node33)
  br label %return

if.end:                                           ; preds = %cond.end.split
  %sigma_node19 = phi i8* [ %call, %cond.end.split ]
  %sigma_node17 = phi %struct.arc* [ %65, %cond.end.split ]
  %67 = ptrtoint %struct.arc* %sigma_node17 to i64
  %arcs7 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %68 = ptrtoint %struct.arc** %arcs7 to i64
  %69 = lshr i64 %68, 3
  %70 = or i64 %69, 17592186044416
  %71 = inttoptr i64 %70 to i8*
  %72 = load i8* %71
  %73 = icmp ne i8 %72, 0
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %if.end
  call void @__asan_report_load8(i64 %68)
  call void asm sideeffect "", ""()
  unreachable

; <label>:75                                      ; preds = %if.end
  %76 = load %struct.arc** %arcs7, align 8
  %77 = ptrtoint %struct.arc* %76 to i64
  %sub = sub i64 %67, %77
  %arcs8 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %78 = ptrtoint %struct.arc** %arcs8 to i64
  %79 = lshr i64 %78, 3
  %80 = or i64 %79, 17592186044416
  %81 = inttoptr i64 %80 to i8*
  %82 = load i8* %81
  %83 = icmp ne i8 %82, 0
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %75
  call void @__asan_report_store8(i64 %78)
  call void asm sideeffect "", ""()
  unreachable

; <label>:85                                      ; preds = %75
  store %struct.arc* %sigma_node17, %struct.arc** %arcs8, align 8
  %m = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %86 = ptrtoint i64* %m to i64
  %87 = lshr i64 %86, 3
  %88 = or i64 %87, 17592186044416
  %89 = inttoptr i64 %88 to i8*
  %90 = load i8* %89
  %91 = icmp ne i8 %90, 0
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %85
  call void @__asan_report_load8(i64 %86)
  call void asm sideeffect "", ""()
  unreachable

; <label>:93                                      ; preds = %85
  %94 = load i64* %m, align 8
  %add.ptr = getelementptr inbounds %struct.arc* %sigma_node17, i64 %94
  %stop_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %95 = ptrtoint %struct.arc** %stop_arcs to i64
  %96 = lshr i64 %95, 3
  %97 = or i64 %96, 17592186044416
  %98 = inttoptr i64 %97 to i8*
  %99 = load i8* %98
  %100 = icmp ne i8 %99, 0
  br i1 %100, label %101, label %102

; <label>:101                                     ; preds = %93
  call void @__asan_report_store8(i64 %95)
  call void asm sideeffect "", ""()
  unreachable

; <label>:102                                     ; preds = %93
  store %struct.arc* %add.ptr, %struct.arc** %stop_arcs, align 8
  %nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %103 = ptrtoint %struct.node** %nodes to i64
  %104 = lshr i64 %103, 3
  %105 = or i64 %104, 17592186044416
  %106 = inttoptr i64 %105 to i8*
  %107 = load i8* %106
  %108 = icmp ne i8 %107, 0
  br i1 %108, label %109, label %110

; <label>:109                                     ; preds = %102
  call void @__asan_report_load8(i64 %103)
  call void asm sideeffect "", ""()
  unreachable

; <label>:110                                     ; preds = %102
  %111 = load %struct.node** %nodes, align 8
  %incdec.ptr = getelementptr inbounds %struct.node* %111, i32 1
  %stop_nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 22
  %112 = ptrtoint %struct.node** %stop_nodes to i64
  %113 = lshr i64 %112, 3
  %114 = or i64 %113, 17592186044416
  %115 = inttoptr i64 %114 to i8*
  %116 = load i8* %115
  %117 = icmp ne i8 %116, 0
  br i1 %117, label %118, label %119

; <label>:118                                     ; preds = %110
  call void @__asan_report_load8(i64 %112)
  call void asm sideeffect "", ""()
  unreachable

; <label>:119                                     ; preds = %110
  %120 = load %struct.node** %stop_nodes, align 8
  %121 = bitcast %struct.node* %120 to i8*
  %122 = bitcast i8* %121 to %struct.node*
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %119
  %phi_node26 = phi i8* [ %sigma_node25, %for.inc ], [ %121, %119 ]
  %phi_node = phi %struct.node* [ %sigma_node23, %for.inc ], [ %122, %119 ]
  %node.0 = phi %struct.node* [ %incdec.ptr, %119 ], [ %incdec.ptr15, %for.inc ]
  %cmp9 = icmp ult %struct.node* %node.0, %phi_node
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node25 = phi i8* [ %phi_node26, %for.cond ]
  %sigma_node23 = phi %struct.node* [ %phi_node, %for.cond ]
  %sigma_node21 = phi %struct.node* [ %node.0, %for.cond ]
  %pred = getelementptr inbounds %struct.node* %sigma_node21, i32 0, i32 3
  %123 = ptrtoint %struct.node** %pred to i64
  %124 = lshr i64 %123, 3
  %125 = or i64 %124, 17592186044416
  %126 = inttoptr i64 %125 to i8*
  %127 = load i8* %126
  %128 = icmp ne i8 %127, 0
  br i1 %128, label %129, label %130

; <label>:129                                     ; preds = %for.body
  call void @__asan_report_load8(i64 %123)
  call void asm sideeffect "", ""()
  unreachable

; <label>:130                                     ; preds = %for.body
  %131 = load %struct.node** %pred, align 8
  %cmp10 = icmp ne %struct.node* %131, %111
  br i1 %cmp10, label %if.then11, label %for.body.if.end14_crit_edge

for.body.if.end14_crit_edge:                      ; preds = %130
  %sigma_node31 = phi %struct.node* [ %111, %130 ]
  %sigma_node29 = phi %struct.node* [ %131, %130 ]
  br label %if.end14

if.then11:                                        ; preds = %130
  %sigma_node30 = phi %struct.node* [ %111, %130 ]
  %sigma_node28 = phi %struct.node* [ %131, %130 ]
  %basic_arc = getelementptr inbounds %struct.node* %sigma_node21, i32 0, i32 6
  %132 = ptrtoint %struct.arc** %basic_arc to i64
  %133 = lshr i64 %132, 3
  %134 = or i64 %133, 17592186044416
  %135 = inttoptr i64 %134 to i8*
  %136 = load i8* %135
  %137 = icmp ne i8 %136, 0
  br i1 %137, label %138, label %139

; <label>:138                                     ; preds = %if.then11
  call void @__asan_report_load8(i64 %132)
  call void asm sideeffect "", ""()
  unreachable

; <label>:139                                     ; preds = %if.then11
  %140 = load %struct.arc** %basic_arc, align 8
  %141 = ptrtoint %struct.arc* %140 to i64
  %add12 = add i64 %141, %sub
  %142 = inttoptr i64 %add12 to %struct.arc*
  %basic_arc13 = getelementptr inbounds %struct.node* %sigma_node21, i32 0, i32 6
  %143 = ptrtoint %struct.arc** %basic_arc13 to i64
  %144 = lshr i64 %143, 3
  %145 = or i64 %144, 17592186044416
  %146 = inttoptr i64 %145 to i8*
  %147 = load i8* %146
  %148 = icmp ne i8 %147, 0
  br i1 %148, label %149, label %150

; <label>:149                                     ; preds = %139
  call void @__asan_report_store8(i64 %143)
  call void asm sideeffect "", ""()
  unreachable

; <label>:150                                     ; preds = %139
  store %struct.arc* %142, %struct.arc** %basic_arc13, align 8
  br label %if.end14

if.end14:                                         ; preds = %for.body.if.end14_crit_edge, %150
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %incdec.ptr15 = getelementptr inbounds %struct.node* %sigma_node21, i32 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node27 = phi i8* [ %phi_node26, %for.cond ]
  %sigma_node24 = phi %struct.node* [ %phi_node, %for.cond ]
  %sigma_node22 = phi %struct.node* [ %node.0, %for.cond ]
  br label %return

return:                                           ; preds = %for.end, %if.then.split.split
  %retval.0 = phi i64 [ 0, %for.end ], [ -1, %if.then.split.split ]
  ret i64 %retval.0
}

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

declare i8* @realloc(i8*, i64) nounwind

declare i32 @printf(i8*, ...)

declare i32 @fflush(%struct._IO_FILE*)

define void @insert_new_arc(%struct.arc* %new, i64 %newpos, %struct.node* %tail, %struct.node* %head, i64 %cost, i64 %red_cost) address_safety nounwind {
entry:
  %arrayidx = getelementptr inbounds %struct.arc* %new, i64 %newpos, !byte_size !0, !safe !1
  %tail1 = getelementptr inbounds %struct.arc* %arrayidx, i32 0, i32 1, !byte_size !2, !safe !1
  store %struct.node* %tail, %struct.node** %tail1, align 8
  %arrayidx2 = getelementptr inbounds %struct.arc* %new, i64 %newpos, !byte_size !0, !safe !1
  %head3 = getelementptr inbounds %struct.arc* %arrayidx2, i32 0, i32 2, !byte_size !3, !safe !1
  store %struct.node* %head, %struct.node** %head3, align 8
  %arrayidx4 = getelementptr inbounds %struct.arc* %new, i64 %newpos, !byte_size !0, !safe !1
  %org_cost = getelementptr inbounds %struct.arc* %arrayidx4, i32 0, i32 7, !byte_size !4, !safe !1
  store i64 %cost, i64* %org_cost, align 8
  %arrayidx5 = getelementptr inbounds %struct.arc* %new, i64 %newpos, !byte_size !0, !safe !1
  %cost6 = getelementptr inbounds %struct.arc* %arrayidx5, i32 0, i32 0, !byte_size !0, !safe !1
  store i64 %cost, i64* %cost6, align 8
  %arrayidx7 = getelementptr inbounds %struct.arc* %new, i64 %newpos, !byte_size !0, !safe !1
  %flow = getelementptr inbounds %struct.arc* %arrayidx7, i32 0, i32 6, !byte_size !5, !safe !1
  store i64 %red_cost, i64* %flow, align 8
  %add = add nsw i64 %newpos, 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %pos.0 = phi i64 [ %add, %entry ], [ %div46, %while.body ]
  %sub = sub nsw i64 %pos.0, 1
  %tobool = icmp ne i64 %sub, 0
  br i1 %tobool, label %land.rhs, label %while.cond.land.end_crit_edge

while.cond.land.end_crit_edge:                    ; preds = %while.cond
  %sigma_node62 = phi i64 [ %sub, %while.cond ]
  br label %land.end

land.rhs:                                         ; preds = %while.cond
  %sigma_node = phi i64 [ %sub, %while.cond ]
  %div = sdiv i64 %pos.0, 2
  %sub8 = sub nsw i64 %div, 1
  %arrayidx9 = getelementptr inbounds %struct.arc* %new, i64 %sub8, !byte_size !0, !safe !1
  %flow10 = getelementptr inbounds %struct.arc* %arrayidx9, i32 0, i32 6, !byte_size !5, !safe !1
  %0 = load i64* %flow10, align 8
  %cmp = icmp sgt i64 %red_cost, %0
  br label %land.end

land.end:                                         ; preds = %while.cond.land.end_crit_edge, %land.rhs
  %1 = phi i1 [ false, %while.cond.land.end_crit_edge ], [ %cmp, %land.rhs ]
  br i1 %1, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %div11 = sdiv i64 %pos.0, 2
  %sub12 = sub nsw i64 %div11, 1
  %arrayidx13 = getelementptr inbounds %struct.arc* %new, i64 %sub12, !byte_size !0, !safe !1
  %tail14 = getelementptr inbounds %struct.arc* %arrayidx13, i32 0, i32 1, !byte_size !2, !safe !1
  %2 = load %struct.node** %tail14, align 8
  %sub15 = sub nsw i64 %pos.0, 1
  %arrayidx16 = getelementptr inbounds %struct.arc* %new, i64 %sub15, !byte_size !0, !safe !1
  %tail17 = getelementptr inbounds %struct.arc* %arrayidx16, i32 0, i32 1, !byte_size !2, !safe !1
  store %struct.node* %2, %struct.node** %tail17, align 8
  %div18 = sdiv i64 %pos.0, 2
  %sub19 = sub nsw i64 %div18, 1
  %arrayidx20 = getelementptr inbounds %struct.arc* %new, i64 %sub19, !byte_size !0, !safe !1
  %head21 = getelementptr inbounds %struct.arc* %arrayidx20, i32 0, i32 2, !byte_size !3, !safe !1
  %3 = load %struct.node** %head21, align 8
  %sub22 = sub nsw i64 %pos.0, 1
  %arrayidx23 = getelementptr inbounds %struct.arc* %new, i64 %sub22, !byte_size !0, !safe !1
  %head24 = getelementptr inbounds %struct.arc* %arrayidx23, i32 0, i32 2, !byte_size !3, !safe !1
  store %struct.node* %3, %struct.node** %head24, align 8
  %div25 = sdiv i64 %pos.0, 2
  %sub26 = sub nsw i64 %div25, 1
  %arrayidx27 = getelementptr inbounds %struct.arc* %new, i64 %sub26, !byte_size !0, !safe !1
  %cost28 = getelementptr inbounds %struct.arc* %arrayidx27, i32 0, i32 0, !byte_size !0, !safe !1
  %4 = load i64* %cost28, align 8
  %sub29 = sub nsw i64 %pos.0, 1
  %arrayidx30 = getelementptr inbounds %struct.arc* %new, i64 %sub29, !byte_size !0, !safe !1
  %cost31 = getelementptr inbounds %struct.arc* %arrayidx30, i32 0, i32 0, !byte_size !0, !safe !1
  store i64 %4, i64* %cost31, align 8
  %div32 = sdiv i64 %pos.0, 2
  %sub33 = sub nsw i64 %div32, 1
  %arrayidx34 = getelementptr inbounds %struct.arc* %new, i64 %sub33, !byte_size !0, !safe !1
  %cost35 = getelementptr inbounds %struct.arc* %arrayidx34, i32 0, i32 0, !byte_size !0, !safe !1
  %5 = load i64* %cost35, align 8
  %sub36 = sub nsw i64 %pos.0, 1
  %arrayidx37 = getelementptr inbounds %struct.arc* %new, i64 %sub36, !byte_size !0, !safe !1
  %org_cost38 = getelementptr inbounds %struct.arc* %arrayidx37, i32 0, i32 7, !byte_size !4, !safe !1
  store i64 %5, i64* %org_cost38, align 8
  %div39 = sdiv i64 %pos.0, 2
  %sub40 = sub nsw i64 %div39, 1
  %arrayidx41 = getelementptr inbounds %struct.arc* %new, i64 %sub40, !byte_size !0, !safe !1
  %flow42 = getelementptr inbounds %struct.arc* %arrayidx41, i32 0, i32 6, !byte_size !5, !safe !1
  %6 = load i64* %flow42, align 8
  %sub43 = sub nsw i64 %pos.0, 1
  %arrayidx44 = getelementptr inbounds %struct.arc* %new, i64 %sub43, !byte_size !0, !safe !1
  %flow45 = getelementptr inbounds %struct.arc* %arrayidx44, i32 0, i32 6, !byte_size !5, !safe !1
  store i64 %6, i64* %flow45, align 8
  %div46 = sdiv i64 %pos.0, 2
  %sub47 = sub nsw i64 %div46, 1
  %arrayidx48 = getelementptr inbounds %struct.arc* %new, i64 %sub47, !byte_size !0, !safe !1
  %tail49 = getelementptr inbounds %struct.arc* %arrayidx48, i32 0, i32 1, !byte_size !2, !safe !1
  store %struct.node* %tail, %struct.node** %tail49, align 8
  %sub50 = sub nsw i64 %div46, 1
  %arrayidx51 = getelementptr inbounds %struct.arc* %new, i64 %sub50, !byte_size !0, !safe !1
  %head52 = getelementptr inbounds %struct.arc* %arrayidx51, i32 0, i32 2, !byte_size !3, !safe !1
  store %struct.node* %head, %struct.node** %head52, align 8
  %sub53 = sub nsw i64 %div46, 1
  %arrayidx54 = getelementptr inbounds %struct.arc* %new, i64 %sub53, !byte_size !0, !safe !1
  %cost55 = getelementptr inbounds %struct.arc* %arrayidx54, i32 0, i32 0, !byte_size !0, !safe !1
  store i64 %cost, i64* %cost55, align 8
  %sub56 = sub nsw i64 %div46, 1
  %arrayidx57 = getelementptr inbounds %struct.arc* %new, i64 %sub56, !byte_size !0, !safe !1
  %org_cost58 = getelementptr inbounds %struct.arc* %arrayidx57, i32 0, i32 7, !byte_size !4, !safe !1
  store i64 %cost, i64* %org_cost58, align 8
  %sub59 = sub nsw i64 %div46, 1
  %arrayidx60 = getelementptr inbounds %struct.arc* %new, i64 %sub59, !byte_size !0, !safe !1
  %flow61 = getelementptr inbounds %struct.arc* %arrayidx60, i32 0, i32 6, !byte_size !5, !safe !1
  store i64 %red_cost, i64* %flow61, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  ret void
}

define void @replace_weaker_arc(%struct.network* %net, %struct.arc* %new, %struct.node* %tail, %struct.node* %head, i64 %cost, i64 %red_cost) address_safety nounwind {
entry:
  %arrayidx = getelementptr inbounds %struct.arc* %new, i64 0, !byte_size !6
  %tail1 = getelementptr inbounds %struct.arc* %arrayidx, i32 0, i32 1, !byte_size !7, !safe !1
  store %struct.node* %tail, %struct.node** %tail1, align 8
  %arrayidx2 = getelementptr inbounds %struct.arc* %new, i64 0, !byte_size !6
  %head3 = getelementptr inbounds %struct.arc* %arrayidx2, i32 0, i32 2, !byte_size !8, !safe !1
  store %struct.node* %head, %struct.node** %head3, align 8
  %arrayidx4 = getelementptr inbounds %struct.arc* %new, i64 0, !byte_size !6
  %org_cost = getelementptr inbounds %struct.arc* %arrayidx4, i32 0, i32 7
  %0 = ptrtoint i64* %org_cost to i64
  %1 = lshr i64 %0, 3
  %2 = or i64 %1, 17592186044416
  %3 = inttoptr i64 %2 to i8*
  %4 = load i8* %3
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %entry
  call void @__asan_report_store8(i64 %0)
  call void asm sideeffect "", ""()
  unreachable

; <label>:7                                       ; preds = %entry
  store i64 %cost, i64* %org_cost, align 8
  %arrayidx5 = getelementptr inbounds %struct.arc* %new, i64 0, !byte_size !6
  %cost6 = getelementptr inbounds %struct.arc* %arrayidx5, i32 0, i32 0, !byte_size !6, !safe !1
  store i64 %cost, i64* %cost6, align 8
  %arrayidx7 = getelementptr inbounds %struct.arc* %new, i64 0, !byte_size !6
  %flow = getelementptr inbounds %struct.arc* %arrayidx7, i32 0, i32 6
  %8 = ptrtoint i64* %flow to i64
  %9 = lshr i64 %8, 3
  %10 = or i64 %9, 17592186044416
  %11 = inttoptr i64 %10 to i8*
  %12 = load i8* %11
  %13 = icmp ne i8 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %7
  call void @__asan_report_store8(i64 %8)
  call void asm sideeffect "", ""()
  unreachable

; <label>:15                                      ; preds = %7
  store i64 %red_cost, i64* %flow, align 8
  %arrayidx8 = getelementptr inbounds %struct.arc* %new, i64 1
  %flow9 = getelementptr inbounds %struct.arc* %arrayidx8, i32 0, i32 6
  %16 = ptrtoint i64* %flow9 to i64
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
  %24 = load i64* %flow9, align 8
  %arrayidx10 = getelementptr inbounds %struct.arc* %new, i64 2
  %flow11 = getelementptr inbounds %struct.arc* %arrayidx10, i32 0, i32 6
  %25 = ptrtoint i64* %flow11 to i64
  %26 = lshr i64 %25, 3
  %27 = or i64 %26, 17592186044416
  %28 = inttoptr i64 %27 to i8*
  %29 = load i8* %28
  %30 = icmp ne i8 %29, 0
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %23
  call void @__asan_report_load8(i64 %25)
  call void asm sideeffect "", ""()
  unreachable

; <label>:32                                      ; preds = %23
  %33 = load i64* %flow11, align 8
  %cmp12 = icmp sgt i64 %24, %33
  %cond = select i1 %cmp12, i32 2, i32 3
  %conv = sext i32 %cond to i64
  br label %while.cond

while.cond:                                       ; preds = %if.end75, %32
  %pos.0 = phi i64 [ 1, %32 ], [ %phi_node, %if.end75 ]
  %cmp.0 = phi i64 [ %conv, %32 ], [ %cmp.2, %if.end75 ]
  %max_residual_new_m = getelementptr inbounds %struct.network* %net, i32 0, i32 8
  %34 = ptrtoint i64* %max_residual_new_m to i64
  %35 = lshr i64 %34, 3
  %36 = or i64 %35, 17592186044416
  %37 = inttoptr i64 %36 to i8*
  %38 = load i8* %37
  %39 = icmp ne i8 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %while.cond
  call void @__asan_report_load8(i64 %34)
  call void asm sideeffect "", ""()
  unreachable

; <label>:41                                      ; preds = %while.cond
  %42 = load i64* %max_residual_new_m, align 8
  %cmp13 = icmp sle i64 %cmp.0, %42
  br i1 %cmp13, label %land.rhs, label %while.cond.land.end_crit_edge

while.cond.land.end_crit_edge:                    ; preds = %41
  %sigma_node78 = phi i64 [ %42, %41 ]
  %sigma_node76 = phi i64 [ %cmp.0, %41 ]
  br label %land.end

land.rhs:                                         ; preds = %41
  %sigma_node77 = phi i64 [ %42, %41 ]
  %sigma_node = phi i64 [ %cmp.0, %41 ]
  %sub = sub nsw i64 %sigma_node, 1
  %arrayidx15 = getelementptr inbounds %struct.arc* %new, i64 %sub, !byte_size !0, !safe !1
  %flow16 = getelementptr inbounds %struct.arc* %arrayidx15, i32 0, i32 6, !byte_size !5, !safe !1
  %43 = load i64* %flow16, align 8
  %cmp17 = icmp slt i64 %red_cost, %43
  br label %land.end

land.end:                                         ; preds = %while.cond.land.end_crit_edge, %land.rhs
  %phi_node = phi i64 [ %sigma_node, %land.rhs ], [ %sigma_node76, %while.cond.land.end_crit_edge ]
  %44 = phi i1 [ false, %while.cond.land.end_crit_edge ], [ %cmp17, %land.rhs ]
  br i1 %44, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %sub19 = sub nsw i64 %phi_node, 1
  %arrayidx20 = getelementptr inbounds %struct.arc* %new, i64 %sub19, !byte_size !0, !safe !1
  %tail21 = getelementptr inbounds %struct.arc* %arrayidx20, i32 0, i32 1, !byte_size !2, !safe !1
  %45 = load %struct.node** %tail21, align 8
  %sub22 = sub nsw i64 %pos.0, 1
  %arrayidx23 = getelementptr inbounds %struct.arc* %new, i64 %sub22, !byte_size !0, !safe !1
  %tail24 = getelementptr inbounds %struct.arc* %arrayidx23, i32 0, i32 1, !byte_size !2, !safe !1
  store %struct.node* %45, %struct.node** %tail24, align 8
  %sub25 = sub nsw i64 %phi_node, 1
  %arrayidx26 = getelementptr inbounds %struct.arc* %new, i64 %sub25, !byte_size !0, !safe !1
  %head27 = getelementptr inbounds %struct.arc* %arrayidx26, i32 0, i32 2, !byte_size !3, !safe !1
  %46 = load %struct.node** %head27, align 8
  %sub28 = sub nsw i64 %pos.0, 1
  %arrayidx29 = getelementptr inbounds %struct.arc* %new, i64 %sub28, !byte_size !0, !safe !1
  %head30 = getelementptr inbounds %struct.arc* %arrayidx29, i32 0, i32 2, !byte_size !3, !safe !1
  store %struct.node* %46, %struct.node** %head30, align 8
  %sub31 = sub nsw i64 %phi_node, 1
  %arrayidx32 = getelementptr inbounds %struct.arc* %new, i64 %sub31, !byte_size !0, !safe !1
  %cost33 = getelementptr inbounds %struct.arc* %arrayidx32, i32 0, i32 0, !byte_size !0, !safe !1
  %47 = load i64* %cost33, align 8
  %sub34 = sub nsw i64 %pos.0, 1
  %arrayidx35 = getelementptr inbounds %struct.arc* %new, i64 %sub34, !byte_size !0, !safe !1
  %cost36 = getelementptr inbounds %struct.arc* %arrayidx35, i32 0, i32 0, !byte_size !0, !safe !1
  store i64 %47, i64* %cost36, align 8
  %sub37 = sub nsw i64 %phi_node, 1
  %arrayidx38 = getelementptr inbounds %struct.arc* %new, i64 %sub37, !byte_size !0, !safe !1
  %cost39 = getelementptr inbounds %struct.arc* %arrayidx38, i32 0, i32 0, !byte_size !0, !safe !1
  %48 = load i64* %cost39, align 8
  %sub40 = sub nsw i64 %pos.0, 1
  %arrayidx41 = getelementptr inbounds %struct.arc* %new, i64 %sub40, !byte_size !0, !safe !1
  %org_cost42 = getelementptr inbounds %struct.arc* %arrayidx41, i32 0, i32 7, !byte_size !4, !safe !1
  store i64 %48, i64* %org_cost42, align 8
  %sub43 = sub nsw i64 %phi_node, 1
  %arrayidx44 = getelementptr inbounds %struct.arc* %new, i64 %sub43, !byte_size !0, !safe !1
  %flow45 = getelementptr inbounds %struct.arc* %arrayidx44, i32 0, i32 6, !byte_size !5, !safe !1
  %49 = load i64* %flow45, align 8
  %sub46 = sub nsw i64 %pos.0, 1
  %arrayidx47 = getelementptr inbounds %struct.arc* %new, i64 %sub46, !byte_size !0, !safe !1
  %flow48 = getelementptr inbounds %struct.arc* %arrayidx47, i32 0, i32 6, !byte_size !5, !safe !1
  store i64 %49, i64* %flow48, align 8
  %sub49 = sub nsw i64 %phi_node, 1
  %arrayidx50 = getelementptr inbounds %struct.arc* %new, i64 %sub49, !byte_size !0, !safe !1
  %tail51 = getelementptr inbounds %struct.arc* %arrayidx50, i32 0, i32 1, !byte_size !2, !safe !1
  store %struct.node* %tail, %struct.node** %tail51, align 8
  %sub52 = sub nsw i64 %phi_node, 1
  %arrayidx53 = getelementptr inbounds %struct.arc* %new, i64 %sub52, !byte_size !0, !safe !1
  %head54 = getelementptr inbounds %struct.arc* %arrayidx53, i32 0, i32 2, !byte_size !3, !safe !1
  store %struct.node* %head, %struct.node** %head54, align 8
  %sub55 = sub nsw i64 %phi_node, 1
  %arrayidx56 = getelementptr inbounds %struct.arc* %new, i64 %sub55, !byte_size !0, !safe !1
  %cost57 = getelementptr inbounds %struct.arc* %arrayidx56, i32 0, i32 0, !byte_size !0, !safe !1
  store i64 %cost, i64* %cost57, align 8
  %sub58 = sub nsw i64 %phi_node, 1
  %arrayidx59 = getelementptr inbounds %struct.arc* %new, i64 %sub58, !byte_size !0, !safe !1
  %org_cost60 = getelementptr inbounds %struct.arc* %arrayidx59, i32 0, i32 7, !byte_size !4, !safe !1
  store i64 %cost, i64* %org_cost60, align 8
  %sub61 = sub nsw i64 %phi_node, 1
  %arrayidx62 = getelementptr inbounds %struct.arc* %new, i64 %sub61, !byte_size !0, !safe !1
  %flow63 = getelementptr inbounds %struct.arc* %arrayidx62, i32 0, i32 6, !byte_size !5, !safe !1
  store i64 %red_cost, i64* %flow63, align 8
  %mul = mul nsw i64 %phi_node, 2
  %add = add nsw i64 %mul, 1
  %max_residual_new_m64 = getelementptr inbounds %struct.network* %net, i32 0, i32 8
  %50 = ptrtoint i64* %max_residual_new_m64 to i64
  %51 = lshr i64 %50, 3
  %52 = or i64 %51, 17592186044416
  %53 = inttoptr i64 %52 to i8*
  %54 = load i8* %53
  %55 = icmp ne i8 %54, 0
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %while.body
  call void @__asan_report_load8(i64 %50)
  call void asm sideeffect "", ""()
  unreachable

; <label>:57                                      ; preds = %while.body
  %58 = load i64* %max_residual_new_m64, align 8
  %cmp65 = icmp sle i64 %add, %58
  br i1 %cmp65, label %if.then, label %while.body.if.end75_crit_edge

while.body.if.end75_crit_edge:                    ; preds = %57
  %sigma_node82 = phi i64 [ %58, %57 ]
  %sigma_node80 = phi i64 [ %add, %57 ]
  br label %if.end75

if.then:                                          ; preds = %57
  %sigma_node81 = phi i64 [ %58, %57 ]
  %sigma_node79 = phi i64 [ %add, %57 ]
  %sub67 = sub nsw i64 %mul, 1
  %arrayidx68 = getelementptr inbounds %struct.arc* %new, i64 %sub67, !byte_size !0, !safe !1
  %flow69 = getelementptr inbounds %struct.arc* %arrayidx68, i32 0, i32 6, !byte_size !5, !safe !1
  %59 = load i64* %flow69, align 8
  %arrayidx70 = getelementptr inbounds %struct.arc* %new, i64 %mul, !byte_size !0, !safe !1
  %flow71 = getelementptr inbounds %struct.arc* %arrayidx70, i32 0, i32 6, !byte_size !5, !safe !1
  %60 = load i64* %flow71, align 8
  %cmp72 = icmp slt i64 %59, %60
  br i1 %cmp72, label %if.then74, label %if.then.if.end_crit_edge

if.then.if.end_crit_edge:                         ; preds = %if.then
  %sigma_node86 = phi i64 [ %60, %if.then ]
  %sigma_node84 = phi i64 [ %59, %if.then ]
  br label %if.end

if.then74:                                        ; preds = %if.then
  %sigma_node85 = phi i64 [ %60, %if.then ]
  %sigma_node83 = phi i64 [ %59, %if.then ]
  %inc = add nsw i64 %mul, 1
  br label %if.end

if.end:                                           ; preds = %if.then.if.end_crit_edge, %if.then74
  %cmp.1 = phi i64 [ %inc, %if.then74 ], [ %mul, %if.then.if.end_crit_edge ]
  br label %if.end75

if.end75:                                         ; preds = %while.body.if.end75_crit_edge, %if.end
  %cmp.2 = phi i64 [ %cmp.1, %if.end ], [ %mul, %while.body.if.end75_crit_edge ]
  br label %while.cond

while.end:                                        ; preds = %land.end
  ret void
}

define i64 @price_out_impl(%struct.network* %net) address_safety nounwind {
entry:
  %bigM1 = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %0 = ptrtoint i64* %bigM1 to i64
  %1 = lshr i64 %0, 3
  %2 = or i64 %1, 17592186044416
  %3 = inttoptr i64 %2 to i8*
  %4 = load i8* %3
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %entry
  call void @__asan_report_load8(i64 %0)
  call void asm sideeffect "", ""()
  unreachable

; <label>:7                                       ; preds = %entry
  %8 = load i64* %bigM1, align 8
  %sub = sub nsw i64 %8, 15
  %n_trips = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %9 = ptrtoint i64* %n_trips to i64
  %10 = lshr i64 %9, 3
  %11 = or i64 %10, 17592186044416
  %12 = inttoptr i64 %11 to i8*
  %13 = load i8* %12
  %14 = icmp ne i8 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %7
  call void @__asan_report_load8(i64 %9)
  call void asm sideeffect "", ""()
  unreachable

; <label>:16                                      ; preds = %7
  %17 = load i64* %n_trips, align 8
  %cmp = icmp sle i64 %17, 15000
  br i1 %cmp, label %if.then, label %entry.if.end12_crit_edge

entry.if.end12_crit_edge:                         ; preds = %16
  %sigma_node110 = phi i64 [ %17, %16 ]
  br label %if.end12

if.then:                                          ; preds = %16
  %sigma_node = phi i64 [ %17, %16 ]
  %m = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %18 = ptrtoint i64* %m to i64
  %19 = lshr i64 %18, 3
  %20 = or i64 %19, 17592186044416
  %21 = inttoptr i64 %20 to i8*
  %22 = load i8* %21
  %23 = icmp ne i8 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %if.then
  call void @__asan_report_load8(i64 %18)
  call void asm sideeffect "", ""()
  unreachable

; <label>:25                                      ; preds = %if.then
  %26 = load i64* %m, align 8
  %max_new_m = getelementptr inbounds %struct.network* %net, i32 0, i32 9
  %27 = ptrtoint i64* %max_new_m to i64
  %28 = lshr i64 %27, 3
  %29 = or i64 %28, 17592186044416
  %30 = inttoptr i64 %29 to i8*
  %31 = load i8* %30
  %32 = icmp ne i8 %31, 0
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %25
  call void @__asan_report_load8(i64 %27)
  call void asm sideeffect "", ""()
  unreachable

; <label>:34                                      ; preds = %25
  %35 = load i64* %max_new_m, align 8
  %add = add nsw i64 %26, %35
  %max_m = getelementptr inbounds %struct.network* %net, i32 0, i32 4
  %36 = ptrtoint i64* %max_m to i64
  %37 = lshr i64 %36, 3
  %38 = or i64 %37, 17592186044416
  %39 = inttoptr i64 %38 to i8*
  %40 = load i8* %39
  %41 = icmp ne i8 %40, 0
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %34
  call void @__asan_report_load8(i64 %36)
  call void asm sideeffect "", ""()
  unreachable

; <label>:43                                      ; preds = %34
  %44 = load i64* %max_m, align 8
  %cmp2 = icmp sgt i64 %add, %44
  br i1 %cmp2, label %land.lhs.true, label %if.then.if.end11_crit_edge

if.then.if.end11_crit_edge:                       ; preds = %43
  %sigma_node114 = phi i64 [ %44, %43 ]
  %sigma_node112 = phi i64 [ %add, %43 ]
  br label %if.end11

land.lhs.true:                                    ; preds = %43
  %sigma_node113 = phi i64 [ %44, %43 ]
  %sigma_node111 = phi i64 [ %add, %43 ]
  %n_trips3 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %45 = ptrtoint i64* %n_trips3 to i64
  %46 = lshr i64 %45, 3
  %47 = or i64 %46, 17592186044416
  %48 = inttoptr i64 %47 to i8*
  %49 = load i8* %48
  %50 = icmp ne i8 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %land.lhs.true
  call void @__asan_report_load8(i64 %45)
  call void asm sideeffect "", ""()
  unreachable

; <label>:52                                      ; preds = %land.lhs.true
  %53 = load i64* %n_trips3, align 8
  %n_trips4 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %54 = ptrtoint i64* %n_trips4 to i64
  %55 = lshr i64 %54, 3
  %56 = or i64 %55, 17592186044416
  %57 = inttoptr i64 %56 to i8*
  %58 = load i8* %57
  %59 = icmp ne i8 %58, 0
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %52
  call void @__asan_report_load8(i64 %54)
  call void asm sideeffect "", ""()
  unreachable

; <label>:61                                      ; preds = %52
  %62 = load i64* %n_trips4, align 8
  %mul = mul nsw i64 %53, %62
  %div = sdiv i64 %mul, 2
  %m5 = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %63 = ptrtoint i64* %m5 to i64
  %64 = lshr i64 %63, 3
  %65 = or i64 %64, 17592186044416
  %66 = inttoptr i64 %65 to i8*
  %67 = load i8* %66
  %68 = icmp ne i8 %67, 0
  br i1 %68, label %69, label %70

; <label>:69                                      ; preds = %61
  call void @__asan_report_load8(i64 %63)
  call void asm sideeffect "", ""()
  unreachable

; <label>:70                                      ; preds = %61
  %71 = load i64* %m5, align 8
  %add6 = add nsw i64 %div, %71
  %max_m7 = getelementptr inbounds %struct.network* %net, i32 0, i32 4
  %72 = ptrtoint i64* %max_m7 to i64
  %73 = lshr i64 %72, 3
  %74 = or i64 %73, 17592186044416
  %75 = inttoptr i64 %74 to i8*
  %76 = load i8* %75
  %77 = icmp ne i8 %76, 0
  br i1 %77, label %78, label %79

; <label>:78                                      ; preds = %70
  call void @__asan_report_load8(i64 %72)
  call void asm sideeffect "", ""()
  unreachable

; <label>:79                                      ; preds = %70
  %80 = load i64* %max_m7, align 8
  %cmp8 = icmp sgt i64 %add6, %80
  br i1 %cmp8, label %if.then9, label %land.lhs.true.if.end11_crit_edge

land.lhs.true.if.end11_crit_edge:                 ; preds = %79
  %sigma_node118 = phi i64 [ %80, %79 ]
  %sigma_node116 = phi i64 [ %add6, %79 ]
  br label %if.end11

if.then9:                                         ; preds = %79
  %sigma_node117 = phi i64 [ %80, %79 ]
  %sigma_node115 = phi i64 [ %add6, %79 ]
  br label %if.then9.split

if.then9.split:                                   ; preds = %if.then9
  %omega_node = phi %struct.network* [ %net, %if.then9 ]
  %call = call i64 @resize_prob(%struct.network* %omega_node)
  %tobool = icmp ne i64 %call, 0
  br i1 %tobool, label %if.then10, label %if.end

if.then10:                                        ; preds = %if.then9.split
  %sigma_node119 = phi i64 [ %call, %if.then9.split ]
  br label %return

if.end:                                           ; preds = %if.then9.split
  %sigma_node120 = phi i64 [ %call, %if.then9.split ]
  br label %if.end.split

if.end.split:                                     ; preds = %if.end
  %omega_node173 = phi %struct.network* [ %omega_node, %if.end ]
  call void @refresh_neighbour_lists(%struct.network* %omega_node173)
  br label %if.end11

if.end11:                                         ; preds = %land.lhs.true.if.end11_crit_edge, %if.then.if.end11_crit_edge, %if.end.split
  %resized.0 = phi i64 [ 1, %if.end.split ], [ 0, %land.lhs.true.if.end11_crit_edge ], [ 0, %if.then.if.end11_crit_edge ]
  br label %if.end12

if.end12:                                         ; preds = %entry.if.end12_crit_edge, %if.end11
  %resized.1 = phi i64 [ %resized.0, %if.end11 ], [ 0, %entry.if.end12_crit_edge ]
  %stop_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %81 = ptrtoint %struct.arc** %stop_arcs to i64
  %82 = lshr i64 %81, 3
  %83 = or i64 %82, 17592186044416
  %84 = inttoptr i64 %83 to i8*
  %85 = load i8* %84
  %86 = icmp ne i8 %85, 0
  br i1 %86, label %87, label %88

; <label>:87                                      ; preds = %if.end12
  call void @__asan_report_load8(i64 %81)
  call void asm sideeffect "", ""()
  unreachable

; <label>:88                                      ; preds = %if.end12
  %89 = load %struct.arc** %stop_arcs, align 8
  %n_trips13 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %90 = ptrtoint i64* %n_trips13 to i64
  %91 = lshr i64 %90, 3
  %92 = or i64 %91, 17592186044416
  %93 = inttoptr i64 %92 to i8*
  %94 = load i8* %93
  %95 = icmp ne i8 %94, 0
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %88
  call void @__asan_report_load8(i64 %90)
  call void asm sideeffect "", ""()
  unreachable

; <label>:97                                      ; preds = %88
  %98 = load i64* %n_trips13, align 8
  %arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %99 = ptrtoint %struct.arc** %arcs to i64
  %100 = lshr i64 %99, 3
  %101 = or i64 %100, 17592186044416
  %102 = inttoptr i64 %101 to i8*
  %103 = load i8* %102
  %104 = icmp ne i8 %103, 0
  br i1 %104, label %105, label %106

; <label>:105                                     ; preds = %97
  call void @__asan_report_load8(i64 %99)
  call void asm sideeffect "", ""()
  unreachable

; <label>:106                                     ; preds = %97
  %107 = load %struct.arc** %arcs, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %106
  %phi_node126 = phi i64 [ %phi_node124, %for.inc ], [ %98, %106 ]
  %arcout.0 = phi %struct.arc* [ %107, %106 ], [ %add.ptr, %for.inc ]
  %i.0 = phi i64 [ 0, %106 ], [ %inc, %for.inc ]
  %cmp14 = icmp slt i64 %i.0, %phi_node126
  br i1 %cmp14, label %land.rhs, label %for.cond.land.end_crit_edge

for.cond.land.end_crit_edge:                      ; preds = %for.cond
  %sigma_node125 = phi i64 [ %phi_node126, %for.cond ]
  %sigma_node122 = phi i64 [ %i.0, %for.cond ]
  br label %land.end

land.rhs:                                         ; preds = %for.cond
  %sigma_node123 = phi i64 [ %phi_node126, %for.cond ]
  %sigma_node121 = phi i64 [ %i.0, %for.cond ]
  %arrayidx = getelementptr inbounds %struct.arc* %arcout.0, i64 1
  %ident = getelementptr inbounds %struct.arc* %arrayidx, i32 0, i32 3
  %108 = ptrtoint i32* %ident to i64
  %109 = lshr i64 %108, 3
  %110 = or i64 %109, 17592186044416
  %111 = inttoptr i64 %110 to i8*
  %112 = load i8* %111
  %113 = icmp ne i8 %112, 0
  br i1 %113, label %114, label %120

; <label>:114                                     ; preds = %land.rhs
  %115 = and i64 %108, 7
  %116 = add i64 %115, 3
  %117 = trunc i64 %116 to i8
  %118 = icmp sge i8 %117, %112
  br i1 %118, label %119, label %120

; <label>:119                                     ; preds = %114
  call void @__asan_report_load4(i64 %108)
  call void asm sideeffect "", ""()
  unreachable

; <label>:120                                     ; preds = %114, %land.rhs
  %121 = load i32* %ident, align 4
  %cmp15 = icmp eq i32 %121, -1
  br label %land.end

land.end:                                         ; preds = %for.cond.land.end_crit_edge, %120
  %phi_node124 = phi i64 [ %sigma_node123, %120 ], [ %sigma_node125, %for.cond.land.end_crit_edge ]
  %phi_node = phi i64 [ %sigma_node121, %120 ], [ %sigma_node122, %for.cond.land.end_crit_edge ]
  %122 = phi i1 [ false, %for.cond.land.end_crit_edge ], [ %cmp15, %120 ]
  br i1 %122, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i64 %phi_node, 1
  %add.ptr = getelementptr inbounds %struct.arc* %arcout.0, i64 3
  br label %for.cond

for.end:                                          ; preds = %land.end
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc66, %for.end
  %phi_node130 = phi i64 [ %sigma_node129, %for.inc66 ], [ %phi_node124, %for.end ]
  %arcout.1 = phi %struct.arc* [ %arcout.0, %for.end ], [ %add.ptr68, %for.inc66 ]
  %new_arcs.0 = phi i64 [ 0, %for.end ], [ %new_arcs.4, %for.inc66 ]
  %i.1 = phi i64 [ %phi_node, %for.end ], [ %inc67, %for.inc66 ]
  %first_of_sparse_list.0 = phi %struct.arc* [ null, %for.end ], [ %first_of_sparse_list.1, %for.inc66 ]
  %cmp17 = icmp slt i64 %i.1, %phi_node130
  br i1 %cmp17, label %for.body18, label %for.end69

for.body18:                                       ; preds = %for.cond16
  %sigma_node129 = phi i64 [ %phi_node130, %for.cond16 ]
  %sigma_node127 = phi i64 [ %i.1, %for.cond16 ]
  %arrayidx19 = getelementptr inbounds %struct.arc* %arcout.1, i64 1
  %ident20 = getelementptr inbounds %struct.arc* %arrayidx19, i32 0, i32 3
  %123 = ptrtoint i32* %ident20 to i64
  %124 = lshr i64 %123, 3
  %125 = or i64 %124, 17592186044416
  %126 = inttoptr i64 %125 to i8*
  %127 = load i8* %126
  %128 = icmp ne i8 %127, 0
  br i1 %128, label %129, label %135

; <label>:129                                     ; preds = %for.body18
  %130 = and i64 %123, 7
  %131 = add i64 %130, 3
  %132 = trunc i64 %131 to i8
  %133 = icmp sge i8 %132, %127
  br i1 %133, label %134, label %135

; <label>:134                                     ; preds = %129
  call void @__asan_report_load4(i64 %123)
  call void asm sideeffect "", ""()
  unreachable

; <label>:135                                     ; preds = %129, %for.body18
  %136 = load i32* %ident20, align 4
  %cmp21 = icmp ne i32 %136, -1
  br i1 %cmp21, label %if.then22, label %for.body18.if.end26_crit_edge

for.body18.if.end26_crit_edge:                    ; preds = %135
  %sigma_node133 = phi i32 [ %136, %135 ]
  br label %if.end26

if.then22:                                        ; preds = %135
  %sigma_node132 = phi i32 [ %136, %135 ]
  %head23 = getelementptr inbounds %struct.arc* %arcout.1, i32 0, i32 2
  %137 = ptrtoint %struct.node** %head23 to i64
  %138 = lshr i64 %137, 3
  %139 = or i64 %138, 17592186044416
  %140 = inttoptr i64 %139 to i8*
  %141 = load i8* %140
  %142 = icmp ne i8 %141, 0
  br i1 %142, label %143, label %144

; <label>:143                                     ; preds = %if.then22
  call void @__asan_report_load8(i64 %137)
  call void asm sideeffect "", ""()
  unreachable

; <label>:144                                     ; preds = %if.then22
  %145 = load %struct.node** %head23, align 8
  %firstout = getelementptr inbounds %struct.node* %145, i32 0, i32 7
  %146 = ptrtoint %struct.arc** %firstout to i64
  %147 = lshr i64 %146, 3
  %148 = or i64 %147, 17592186044416
  %149 = inttoptr i64 %148 to i8*
  %150 = load i8* %149
  %151 = icmp ne i8 %150, 0
  br i1 %151, label %152, label %153

; <label>:152                                     ; preds = %144
  call void @__asan_report_load8(i64 %146)
  call void asm sideeffect "", ""()
  unreachable

; <label>:153                                     ; preds = %144
  %154 = load %struct.arc** %firstout, align 8
  %head24 = getelementptr inbounds %struct.arc* %154, i32 0, i32 2
  %155 = ptrtoint %struct.node** %head24 to i64
  %156 = lshr i64 %155, 3
  %157 = or i64 %156, 17592186044416
  %158 = inttoptr i64 %157 to i8*
  %159 = load i8* %158
  %160 = icmp ne i8 %159, 0
  br i1 %160, label %161, label %162

; <label>:161                                     ; preds = %153
  call void @__asan_report_load8(i64 %155)
  call void asm sideeffect "", ""()
  unreachable

; <label>:162                                     ; preds = %153
  %163 = load %struct.node** %head24, align 8
  %arc_tmp = getelementptr inbounds %struct.node* %163, i32 0, i32 9
  %164 = ptrtoint %struct.arc** %arc_tmp to i64
  %165 = lshr i64 %164, 3
  %166 = or i64 %165, 17592186044416
  %167 = inttoptr i64 %166 to i8*
  %168 = load i8* %167
  %169 = icmp ne i8 %168, 0
  br i1 %169, label %170, label %171

; <label>:170                                     ; preds = %162
  call void @__asan_report_store8(i64 %164)
  call void asm sideeffect "", ""()
  unreachable

; <label>:171                                     ; preds = %162
  store %struct.arc* %first_of_sparse_list.0, %struct.arc** %arc_tmp, align 8
  %add.ptr25 = getelementptr inbounds %struct.arc* %arcout.1, i64 1
  br label %if.end26

if.end26:                                         ; preds = %for.body18.if.end26_crit_edge, %171
  %first_of_sparse_list.1 = phi %struct.arc* [ %add.ptr25, %171 ], [ %first_of_sparse_list.0, %for.body18.if.end26_crit_edge ]
  %ident27 = getelementptr inbounds %struct.arc* %arcout.1, i32 0, i32 3
  %172 = ptrtoint i32* %ident27 to i64
  %173 = lshr i64 %172, 3
  %174 = or i64 %173, 17592186044416
  %175 = inttoptr i64 %174 to i8*
  %176 = load i8* %175
  %177 = icmp ne i8 %176, 0
  br i1 %177, label %178, label %184

; <label>:178                                     ; preds = %if.end26
  %179 = and i64 %172, 7
  %180 = add i64 %179, 3
  %181 = trunc i64 %180 to i8
  %182 = icmp sge i8 %181, %176
  br i1 %182, label %183, label %184

; <label>:183                                     ; preds = %178
  call void @__asan_report_load4(i64 %172)
  call void asm sideeffect "", ""()
  unreachable

; <label>:184                                     ; preds = %178, %if.end26
  %185 = load i32* %ident27, align 4
  %cmp28 = icmp eq i32 %185, -1
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %184
  %sigma_node134 = phi i32 [ %185, %184 ]
  br label %for.inc66

if.end30:                                         ; preds = %184
  %sigma_node135 = phi i32 [ %185, %184 ]
  %head31 = getelementptr inbounds %struct.arc* %arcout.1, i32 0, i32 2
  %186 = ptrtoint %struct.node** %head31 to i64
  %187 = lshr i64 %186, 3
  %188 = or i64 %187, 17592186044416
  %189 = inttoptr i64 %188 to i8*
  %190 = load i8* %189
  %191 = icmp ne i8 %190, 0
  br i1 %191, label %192, label %193

; <label>:192                                     ; preds = %if.end30
  call void @__asan_report_load8(i64 %186)
  call void asm sideeffect "", ""()
  unreachable

; <label>:193                                     ; preds = %if.end30
  %194 = load %struct.node** %head31, align 8
  %time = getelementptr inbounds %struct.node* %194, i32 0, i32 13
  %195 = ptrtoint i32* %time to i64
  %196 = lshr i64 %195, 3
  %197 = or i64 %196, 17592186044416
  %198 = inttoptr i64 %197 to i8*
  %199 = load i8* %198
  %200 = icmp ne i8 %199, 0
  br i1 %200, label %201, label %207

; <label>:201                                     ; preds = %193
  %202 = and i64 %195, 7
  %203 = add i64 %202, 3
  %204 = trunc i64 %203 to i8
  %205 = icmp sge i8 %204, %199
  br i1 %205, label %206, label %207

; <label>:206                                     ; preds = %201
  call void @__asan_report_load4(i64 %195)
  call void asm sideeffect "", ""()
  unreachable

; <label>:207                                     ; preds = %201, %193
  %208 = load i32* %time, align 4
  %conv = sext i32 %208 to i64
  %org_cost = getelementptr inbounds %struct.arc* %arcout.1, i32 0, i32 7
  %209 = ptrtoint i64* %org_cost to i64
  %210 = lshr i64 %209, 3
  %211 = or i64 %210, 17592186044416
  %212 = inttoptr i64 %211 to i8*
  %213 = load i8* %212
  %214 = icmp ne i8 %213, 0
  br i1 %214, label %215, label %216

; <label>:215                                     ; preds = %207
  call void @__asan_report_load8(i64 %209)
  call void asm sideeffect "", ""()
  unreachable

; <label>:216                                     ; preds = %207
  %217 = load i64* %org_cost, align 8
  %sub32 = sub nsw i64 %conv, %217
  %add33 = add nsw i64 %sub32, %sub
  %potential = getelementptr inbounds %struct.node* %194, i32 0, i32 0
  %218 = ptrtoint i64* %potential to i64
  %219 = lshr i64 %218, 3
  %220 = or i64 %219, 17592186044416
  %221 = inttoptr i64 %220 to i8*
  %222 = load i8* %221
  %223 = icmp ne i8 %222, 0
  br i1 %223, label %224, label %225

; <label>:224                                     ; preds = %216
  call void @__asan_report_load8(i64 %218)
  call void asm sideeffect "", ""()
  unreachable

; <label>:225                                     ; preds = %216
  %226 = load i64* %potential, align 8
  %tail34 = getelementptr inbounds %struct.arc* %first_of_sparse_list.1, i32 0, i32 1
  %227 = ptrtoint %struct.node** %tail34 to i64
  %228 = lshr i64 %227, 3
  %229 = or i64 %228, 17592186044416
  %230 = inttoptr i64 %229 to i8*
  %231 = load i8* %230
  %232 = icmp ne i8 %231, 0
  br i1 %232, label %233, label %234

; <label>:233                                     ; preds = %225
  call void @__asan_report_load8(i64 %227)
  call void asm sideeffect "", ""()
  unreachable

; <label>:234                                     ; preds = %225
  %235 = load %struct.node** %tail34, align 8
  %arc_tmp35 = getelementptr inbounds %struct.node* %235, i32 0, i32 9
  %236 = ptrtoint %struct.arc** %arc_tmp35 to i64
  %237 = lshr i64 %236, 3
  %238 = or i64 %237, 17592186044416
  %239 = inttoptr i64 %238 to i8*
  %240 = load i8* %239
  %241 = icmp ne i8 %240, 0
  br i1 %241, label %242, label %243

; <label>:242                                     ; preds = %234
  call void @__asan_report_load8(i64 %236)
  call void asm sideeffect "", ""()
  unreachable

; <label>:243                                     ; preds = %234
  %244 = load %struct.arc** %arc_tmp35, align 8
  br label %while.cond

while.cond:                                       ; preds = %329, %284, %243
  %phi_node141 = phi i64 [ %sigma_node140, %284 ], [ %sigma_node142, %329 ], [ %add33, %243 ]
  %arcin.0 = phi %struct.arc* [ %244, %243 ], [ %285, %284 ], [ %330, %329 ]
  %new_arcs.1 = phi i64 [ %new_arcs.0, %243 ], [ %new_arcs.1, %284 ], [ %new_arcs.3, %329 ]
  %tobool36 = icmp ne %struct.arc* %arcin.0, null
  br i1 %tobool36, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %sigma_node136 = phi %struct.arc* [ %arcin.0, %while.cond ]
  %tail37 = getelementptr inbounds %struct.arc* %sigma_node136, i32 0, i32 1
  %245 = ptrtoint %struct.node** %tail37 to i64
  %246 = lshr i64 %245, 3
  %247 = or i64 %246, 17592186044416
  %248 = inttoptr i64 %247 to i8*
  %249 = load i8* %248
  %250 = icmp ne i8 %249, 0
  br i1 %250, label %251, label %252

; <label>:251                                     ; preds = %while.body
  call void @__asan_report_load8(i64 %245)
  call void asm sideeffect "", ""()
  unreachable

; <label>:252                                     ; preds = %while.body
  %253 = load %struct.node** %tail37, align 8
  %time38 = getelementptr inbounds %struct.node* %253, i32 0, i32 13
  %254 = ptrtoint i32* %time38 to i64
  %255 = lshr i64 %254, 3
  %256 = or i64 %255, 17592186044416
  %257 = inttoptr i64 %256 to i8*
  %258 = load i8* %257
  %259 = icmp ne i8 %258, 0
  br i1 %259, label %260, label %266

; <label>:260                                     ; preds = %252
  %261 = and i64 %254, 7
  %262 = add i64 %261, 3
  %263 = trunc i64 %262 to i8
  %264 = icmp sge i8 %263, %258
  br i1 %264, label %265, label %266

; <label>:265                                     ; preds = %260
  call void @__asan_report_load4(i64 %254)
  call void asm sideeffect "", ""()
  unreachable

; <label>:266                                     ; preds = %260, %252
  %267 = load i32* %time38, align 4
  %conv39 = sext i32 %267 to i64
  %org_cost40 = getelementptr inbounds %struct.arc* %sigma_node136, i32 0, i32 7
  %268 = ptrtoint i64* %org_cost40 to i64
  %269 = lshr i64 %268, 3
  %270 = or i64 %269, 17592186044416
  %271 = inttoptr i64 %270 to i8*
  %272 = load i8* %271
  %273 = icmp ne i8 %272, 0
  br i1 %273, label %274, label %275

; <label>:274                                     ; preds = %266
  call void @__asan_report_load8(i64 %268)
  call void asm sideeffect "", ""()
  unreachable

; <label>:275                                     ; preds = %266
  %276 = load i64* %org_cost40, align 8
  %add41 = add nsw i64 %conv39, %276
  %cmp42 = icmp sgt i64 %add41, %phi_node141
  br i1 %cmp42, label %if.then44, label %if.end46

if.then44:                                        ; preds = %275
  %sigma_node140 = phi i64 [ %phi_node141, %275 ]
  %sigma_node138 = phi i64 [ %add41, %275 ]
  %arc_tmp45 = getelementptr inbounds %struct.node* %253, i32 0, i32 9
  %277 = ptrtoint %struct.arc** %arc_tmp45 to i64
  %278 = lshr i64 %277, 3
  %279 = or i64 %278, 17592186044416
  %280 = inttoptr i64 %279 to i8*
  %281 = load i8* %280
  %282 = icmp ne i8 %281, 0
  br i1 %282, label %283, label %284

; <label>:283                                     ; preds = %if.then44
  call void @__asan_report_load8(i64 %277)
  call void asm sideeffect "", ""()
  unreachable

; <label>:284                                     ; preds = %if.then44
  %285 = load %struct.arc** %arc_tmp45, align 8
  br label %while.cond

if.end46:                                         ; preds = %275
  %sigma_node142 = phi i64 [ %phi_node141, %275 ]
  %sigma_node139 = phi i64 [ %add41, %275 ]
  %potential47 = getelementptr inbounds %struct.node* %253, i32 0, i32 0
  %286 = ptrtoint i64* %potential47 to i64
  %287 = lshr i64 %286, 3
  %288 = or i64 %287, 17592186044416
  %289 = inttoptr i64 %288 to i8*
  %290 = load i8* %289
  %291 = icmp ne i8 %290, 0
  br i1 %291, label %292, label %293

; <label>:292                                     ; preds = %if.end46
  call void @__asan_report_load8(i64 %286)
  call void asm sideeffect "", ""()
  unreachable

; <label>:293                                     ; preds = %if.end46
  %294 = load i64* %potential47, align 8
  %sub48 = sub nsw i64 30, %294
  %potential49 = getelementptr inbounds %struct.node* %194, i32 0, i32 0
  %295 = ptrtoint i64* %potential49 to i64
  %296 = lshr i64 %295, 3
  %297 = or i64 %296, 17592186044416
  %298 = inttoptr i64 %297 to i8*
  %299 = load i8* %298
  %300 = icmp ne i8 %299, 0
  br i1 %300, label %301, label %302

; <label>:301                                     ; preds = %293
  call void @__asan_report_load8(i64 %295)
  call void asm sideeffect "", ""()
  unreachable

; <label>:302                                     ; preds = %293
  %303 = load i64* %potential49, align 8
  %add50 = add nsw i64 %sub48, %303
  %cmp51 = icmp slt i64 %add50, 0
  br i1 %cmp51, label %if.then53, label %if.end46.if.end64_crit_edge

if.end46.if.end64_crit_edge:                      ; preds = %302
  %sigma_node144 = phi i64 [ %add50, %302 ]
  br label %if.end64

if.then53:                                        ; preds = %302
  %sigma_node143 = phi i64 [ %add50, %302 ]
  %max_residual_new_m = getelementptr inbounds %struct.network* %net, i32 0, i32 8
  %304 = ptrtoint i64* %max_residual_new_m to i64
  %305 = lshr i64 %304, 3
  %306 = or i64 %305, 17592186044416
  %307 = inttoptr i64 %306 to i8*
  %308 = load i8* %307
  %309 = icmp ne i8 %308, 0
  br i1 %309, label %310, label %311

; <label>:310                                     ; preds = %if.then53
  call void @__asan_report_load8(i64 %304)
  call void asm sideeffect "", ""()
  unreachable

; <label>:311                                     ; preds = %if.then53
  %312 = load i64* %max_residual_new_m, align 8
  %cmp54 = icmp slt i64 %new_arcs.1, %312
  br i1 %cmp54, label %if.then56, label %if.else

if.then56:                                        ; preds = %311
  %sigma_node147 = phi i64 [ %312, %311 ]
  %sigma_node145 = phi i64 [ %new_arcs.1, %311 ]
  br label %if.then56.split

if.then56.split:                                  ; preds = %if.then56
  %omega_node176 = phi %struct.node* [ %194, %if.then56 ]
  %omega_node175 = phi %struct.node* [ %253, %if.then56 ]
  %omega_node174 = phi %struct.arc* [ %89, %if.then56 ]
  call void @insert_new_arc(%struct.arc* %omega_node174, i64 %sigma_node145, %struct.node* %omega_node175, %struct.node* %omega_node176, i64 30, i64 %sigma_node143)
  %inc57 = add nsw i64 %sigma_node145, 1
  br label %if.end63

if.else:                                          ; preds = %311
  %sigma_node148 = phi i64 [ %312, %311 ]
  %sigma_node146 = phi i64 [ %new_arcs.1, %311 ]
  %arrayidx58 = getelementptr inbounds %struct.arc* %89, i64 0
  %flow = getelementptr inbounds %struct.arc* %arrayidx58, i32 0, i32 6
  %313 = ptrtoint i64* %flow to i64
  %314 = lshr i64 %313, 3
  %315 = or i64 %314, 17592186044416
  %316 = inttoptr i64 %315 to i8*
  %317 = load i8* %316
  %318 = icmp ne i8 %317, 0
  br i1 %318, label %319, label %320

; <label>:319                                     ; preds = %if.else
  call void @__asan_report_load8(i64 %313)
  call void asm sideeffect "", ""()
  unreachable

; <label>:320                                     ; preds = %if.else
  %321 = load i64* %flow, align 8
  %cmp59 = icmp sgt i64 %321, %sigma_node143
  br i1 %cmp59, label %if.then61, label %if.else.if.end62_crit_edge

if.else.if.end62_crit_edge:                       ; preds = %320
  %sigma_node152 = phi i64 [ %sigma_node143, %320 ]
  %sigma_node150 = phi i64 [ %321, %320 ]
  br label %if.end62

if.then61:                                        ; preds = %320
  %sigma_node151 = phi i64 [ %sigma_node143, %320 ]
  %sigma_node149 = phi i64 [ %321, %320 ]
  br label %if.then61.split

if.then61.split:                                  ; preds = %if.then61
  %omega_node180 = phi %struct.node* [ %194, %if.then61 ]
  %omega_node179 = phi %struct.node* [ %253, %if.then61 ]
  %omega_node178 = phi %struct.arc* [ %89, %if.then61 ]
  %omega_node177 = phi %struct.network* [ %net, %if.then61 ]
  call void @replace_weaker_arc(%struct.network* %omega_node177, %struct.arc* %omega_node178, %struct.node* %omega_node179, %struct.node* %omega_node180, i64 30, i64 %sigma_node151)
  br label %if.end62

if.end62:                                         ; preds = %if.else.if.end62_crit_edge, %if.then61.split
  br label %if.end63

if.end63:                                         ; preds = %if.end62, %if.then56.split
  %new_arcs.2 = phi i64 [ %inc57, %if.then56.split ], [ %sigma_node146, %if.end62 ]
  br label %if.end64

if.end64:                                         ; preds = %if.end46.if.end64_crit_edge, %if.end63
  %new_arcs.3 = phi i64 [ %new_arcs.2, %if.end63 ], [ %new_arcs.1, %if.end46.if.end64_crit_edge ]
  %arc_tmp65 = getelementptr inbounds %struct.node* %253, i32 0, i32 9
  %322 = ptrtoint %struct.arc** %arc_tmp65 to i64
  %323 = lshr i64 %322, 3
  %324 = or i64 %323, 17592186044416
  %325 = inttoptr i64 %324 to i8*
  %326 = load i8* %325
  %327 = icmp ne i8 %326, 0
  br i1 %327, label %328, label %329

; <label>:328                                     ; preds = %if.end64
  call void @__asan_report_load8(i64 %322)
  call void asm sideeffect "", ""()
  unreachable

; <label>:329                                     ; preds = %if.end64
  %330 = load %struct.arc** %arc_tmp65, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %sigma_node137 = phi %struct.arc* [ %arcin.0, %while.cond ]
  br label %for.inc66

for.inc66:                                        ; preds = %while.end, %if.then29
  %new_arcs.4 = phi i64 [ %new_arcs.0, %if.then29 ], [ %new_arcs.1, %while.end ]
  %inc67 = add nsw i64 %sigma_node127, 1
  %add.ptr68 = getelementptr inbounds %struct.arc* %arcout.1, i64 3
  br label %for.cond16

for.end69:                                        ; preds = %for.cond16
  %sigma_node131 = phi i64 [ %phi_node130, %for.cond16 ]
  %sigma_node128 = phi i64 [ %i.1, %for.cond16 ]
  %tobool70 = icmp ne i64 %new_arcs.0, 0
  br i1 %tobool70, label %if.then71, label %for.end69.if.end109_crit_edge

for.end69.if.end109_crit_edge:                    ; preds = %for.end69
  %sigma_node154 = phi i64 [ %new_arcs.0, %for.end69 ]
  br label %if.end109

if.then71:                                        ; preds = %for.end69
  %sigma_node153 = phi i64 [ %new_arcs.0, %for.end69 ]
  %stop_arcs72 = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %331 = ptrtoint %struct.arc** %stop_arcs72 to i64
  %332 = lshr i64 %331, 3
  %333 = or i64 %332, 17592186044416
  %334 = inttoptr i64 %333 to i8*
  %335 = load i8* %334
  %336 = icmp ne i8 %335, 0
  br i1 %336, label %337, label %338

; <label>:337                                     ; preds = %if.then71
  call void @__asan_report_load8(i64 %331)
  call void asm sideeffect "", ""()
  unreachable

; <label>:338                                     ; preds = %if.then71
  %339 = load %struct.arc** %stop_arcs72, align 8
  %stop_arcs73 = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %340 = ptrtoint %struct.arc** %stop_arcs73 to i64
  %341 = lshr i64 %340, 3
  %342 = or i64 %341, 17592186044416
  %343 = inttoptr i64 %342 to i8*
  %344 = load i8* %343
  %345 = icmp ne i8 %344, 0
  br i1 %345, label %346, label %347

; <label>:346                                     ; preds = %338
  call void @__asan_report_load8(i64 %340)
  call void asm sideeffect "", ""()
  unreachable

; <label>:347                                     ; preds = %338
  %348 = load %struct.arc** %stop_arcs73, align 8
  %add.ptr74 = getelementptr inbounds %struct.arc* %348, i64 %sigma_node153
  store %struct.arc* %add.ptr74, %struct.arc** %stop_arcs73, align 8
  %stop_arcs75 = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %349 = ptrtoint %struct.arc** %stop_arcs75 to i64
  %350 = lshr i64 %349, 3
  %351 = or i64 %350, 17592186044416
  %352 = inttoptr i64 %351 to i8*
  %353 = load i8* %352
  %354 = icmp ne i8 %353, 0
  br i1 %354, label %355, label %356

; <label>:355                                     ; preds = %347
  call void @__asan_report_load8(i64 %349)
  call void asm sideeffect "", ""()
  unreachable

; <label>:356                                     ; preds = %347
  %357 = load %struct.arc** %stop_arcs75, align 8
  %358 = bitcast %struct.arc* %357 to i8*
  %359 = bitcast i8* %358 to %struct.arc*
  %tobool76 = icmp ne i64 %resized.1, 0
  br i1 %tobool76, label %if.then77, label %if.else86

if.then77:                                        ; preds = %356
  %sigma_node155 = phi i64 [ %resized.1, %356 ]
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc84, %if.then77
  %phi_node163 = phi i8* [ %sigma_node162, %for.inc84 ], [ %358, %if.then77 ]
  %phi_node160 = phi %struct.arc* [ %sigma_node159, %for.inc84 ], [ %359, %if.then77 ]
  %arcnew.0 = phi %struct.arc* [ %339, %if.then77 ], [ %incdec.ptr, %for.inc84 ]
  %cmp79 = icmp ne %struct.arc* %arcnew.0, %phi_node160
  br i1 %cmp79, label %for.body81, label %for.end85

for.body81:                                       ; preds = %for.cond78
  %sigma_node162 = phi i8* [ %phi_node163, %for.cond78 ]
  %sigma_node159 = phi %struct.arc* [ %phi_node160, %for.cond78 ]
  %sigma_node157 = phi %struct.arc* [ %arcnew.0, %for.cond78 ]
  %flow82 = getelementptr inbounds %struct.arc* %sigma_node157, i32 0, i32 6
  %360 = ptrtoint i64* %flow82 to i64
  %361 = lshr i64 %360, 3
  %362 = or i64 %361, 17592186044416
  %363 = inttoptr i64 %362 to i8*
  %364 = load i8* %363
  %365 = icmp ne i8 %364, 0
  br i1 %365, label %366, label %367

; <label>:366                                     ; preds = %for.body81
  call void @__asan_report_store8(i64 %360)
  call void asm sideeffect "", ""()
  unreachable

; <label>:367                                     ; preds = %for.body81
  store i64 0, i64* %flow82, align 8
  %ident83 = getelementptr inbounds %struct.arc* %sigma_node157, i32 0, i32 3
  %368 = ptrtoint i32* %ident83 to i64
  %369 = lshr i64 %368, 3
  %370 = or i64 %369, 17592186044416
  %371 = inttoptr i64 %370 to i8*
  %372 = load i8* %371
  %373 = icmp ne i8 %372, 0
  br i1 %373, label %374, label %380

; <label>:374                                     ; preds = %367
  %375 = and i64 %368, 7
  %376 = add i64 %375, 3
  %377 = trunc i64 %376 to i8
  %378 = icmp sge i8 %377, %372
  br i1 %378, label %379, label %380

; <label>:379                                     ; preds = %374
  call void @__asan_report_store4(i64 %368)
  call void asm sideeffect "", ""()
  unreachable

; <label>:380                                     ; preds = %374, %367
  store i32 1, i32* %ident83, align 4
  br label %for.inc84

for.inc84:                                        ; preds = %380
  %incdec.ptr = getelementptr inbounds %struct.arc* %sigma_node157, i32 1
  br label %for.cond78

for.end85:                                        ; preds = %for.cond78
  %sigma_node164 = phi i8* [ %phi_node163, %for.cond78 ]
  %sigma_node161 = phi %struct.arc* [ %phi_node160, %for.cond78 ]
  %sigma_node158 = phi %struct.arc* [ %arcnew.0, %for.cond78 ]
  br label %if.end103

if.else86:                                        ; preds = %356
  %sigma_node156 = phi i64 [ %resized.1, %356 ]
  br label %for.cond87

for.cond87:                                       ; preds = %for.inc100, %if.else86
  %phi_node171 = phi i8* [ %sigma_node170, %for.inc100 ], [ %358, %if.else86 ]
  %phi_node168 = phi %struct.arc* [ %sigma_node167, %for.inc100 ], [ %359, %if.else86 ]
  %arcnew.1 = phi %struct.arc* [ %339, %if.else86 ], [ %incdec.ptr101, %for.inc100 ]
  %cmp88 = icmp ne %struct.arc* %arcnew.1, %phi_node168
  br i1 %cmp88, label %for.body90, label %for.end102

for.body90:                                       ; preds = %for.cond87
  %sigma_node170 = phi i8* [ %phi_node171, %for.cond87 ]
  %sigma_node167 = phi %struct.arc* [ %phi_node168, %for.cond87 ]
  %sigma_node165 = phi %struct.arc* [ %arcnew.1, %for.cond87 ]
  %flow91 = getelementptr inbounds %struct.arc* %sigma_node165, i32 0, i32 6
  %381 = ptrtoint i64* %flow91 to i64
  %382 = lshr i64 %381, 3
  %383 = or i64 %382, 17592186044416
  %384 = inttoptr i64 %383 to i8*
  %385 = load i8* %384
  %386 = icmp ne i8 %385, 0
  br i1 %386, label %387, label %388

; <label>:387                                     ; preds = %for.body90
  call void @__asan_report_store8(i64 %381)
  call void asm sideeffect "", ""()
  unreachable

; <label>:388                                     ; preds = %for.body90
  store i64 0, i64* %flow91, align 8
  %ident92 = getelementptr inbounds %struct.arc* %sigma_node165, i32 0, i32 3
  %389 = ptrtoint i32* %ident92 to i64
  %390 = lshr i64 %389, 3
  %391 = or i64 %390, 17592186044416
  %392 = inttoptr i64 %391 to i8*
  %393 = load i8* %392
  %394 = icmp ne i8 %393, 0
  br i1 %394, label %395, label %401

; <label>:395                                     ; preds = %388
  %396 = and i64 %389, 7
  %397 = add i64 %396, 3
  %398 = trunc i64 %397 to i8
  %399 = icmp sge i8 %398, %393
  br i1 %399, label %400, label %401

; <label>:400                                     ; preds = %395
  call void @__asan_report_store4(i64 %389)
  call void asm sideeffect "", ""()
  unreachable

; <label>:401                                     ; preds = %395, %388
  store i32 1, i32* %ident92, align 4
  %tail93 = getelementptr inbounds %struct.arc* %sigma_node165, i32 0, i32 1
  %402 = ptrtoint %struct.node** %tail93 to i64
  %403 = lshr i64 %402, 3
  %404 = or i64 %403, 17592186044416
  %405 = inttoptr i64 %404 to i8*
  %406 = load i8* %405
  %407 = icmp ne i8 %406, 0
  br i1 %407, label %408, label %409

; <label>:408                                     ; preds = %401
  call void @__asan_report_load8(i64 %402)
  call void asm sideeffect "", ""()
  unreachable

; <label>:409                                     ; preds = %401
  %410 = load %struct.node** %tail93, align 8
  %firstout94 = getelementptr inbounds %struct.node* %410, i32 0, i32 7
  %411 = ptrtoint %struct.arc** %firstout94 to i64
  %412 = lshr i64 %411, 3
  %413 = or i64 %412, 17592186044416
  %414 = inttoptr i64 %413 to i8*
  %415 = load i8* %414
  %416 = icmp ne i8 %415, 0
  br i1 %416, label %417, label %418

; <label>:417                                     ; preds = %409
  call void @__asan_report_load8(i64 %411)
  call void asm sideeffect "", ""()
  unreachable

; <label>:418                                     ; preds = %409
  %419 = load %struct.arc** %firstout94, align 8
  %nextout = getelementptr inbounds %struct.arc* %sigma_node165, i32 0, i32 4
  %420 = ptrtoint %struct.arc** %nextout to i64
  %421 = lshr i64 %420, 3
  %422 = or i64 %421, 17592186044416
  %423 = inttoptr i64 %422 to i8*
  %424 = load i8* %423
  %425 = icmp ne i8 %424, 0
  br i1 %425, label %426, label %427

; <label>:426                                     ; preds = %418
  call void @__asan_report_store8(i64 %420)
  call void asm sideeffect "", ""()
  unreachable

; <label>:427                                     ; preds = %418
  store %struct.arc* %419, %struct.arc** %nextout, align 8
  %tail95 = getelementptr inbounds %struct.arc* %sigma_node165, i32 0, i32 1
  %428 = ptrtoint %struct.node** %tail95 to i64
  %429 = lshr i64 %428, 3
  %430 = or i64 %429, 17592186044416
  %431 = inttoptr i64 %430 to i8*
  %432 = load i8* %431
  %433 = icmp ne i8 %432, 0
  br i1 %433, label %434, label %435

; <label>:434                                     ; preds = %427
  call void @__asan_report_load8(i64 %428)
  call void asm sideeffect "", ""()
  unreachable

; <label>:435                                     ; preds = %427
  %436 = load %struct.node** %tail95, align 8
  %firstout96 = getelementptr inbounds %struct.node* %436, i32 0, i32 7
  %437 = ptrtoint %struct.arc** %firstout96 to i64
  %438 = lshr i64 %437, 3
  %439 = or i64 %438, 17592186044416
  %440 = inttoptr i64 %439 to i8*
  %441 = load i8* %440
  %442 = icmp ne i8 %441, 0
  br i1 %442, label %443, label %444

; <label>:443                                     ; preds = %435
  call void @__asan_report_store8(i64 %437)
  call void asm sideeffect "", ""()
  unreachable

; <label>:444                                     ; preds = %435
  store %struct.arc* %sigma_node165, %struct.arc** %firstout96, align 8
  %head97 = getelementptr inbounds %struct.arc* %sigma_node165, i32 0, i32 2
  %445 = ptrtoint %struct.node** %head97 to i64
  %446 = lshr i64 %445, 3
  %447 = or i64 %446, 17592186044416
  %448 = inttoptr i64 %447 to i8*
  %449 = load i8* %448
  %450 = icmp ne i8 %449, 0
  br i1 %450, label %451, label %452

; <label>:451                                     ; preds = %444
  call void @__asan_report_load8(i64 %445)
  call void asm sideeffect "", ""()
  unreachable

; <label>:452                                     ; preds = %444
  %453 = load %struct.node** %head97, align 8
  %firstin = getelementptr inbounds %struct.node* %453, i32 0, i32 8
  %454 = ptrtoint %struct.arc** %firstin to i64
  %455 = lshr i64 %454, 3
  %456 = or i64 %455, 17592186044416
  %457 = inttoptr i64 %456 to i8*
  %458 = load i8* %457
  %459 = icmp ne i8 %458, 0
  br i1 %459, label %460, label %461

; <label>:460                                     ; preds = %452
  call void @__asan_report_load8(i64 %454)
  call void asm sideeffect "", ""()
  unreachable

; <label>:461                                     ; preds = %452
  %462 = load %struct.arc** %firstin, align 8
  %nextin = getelementptr inbounds %struct.arc* %sigma_node165, i32 0, i32 5
  %463 = ptrtoint %struct.arc** %nextin to i64
  %464 = lshr i64 %463, 3
  %465 = or i64 %464, 17592186044416
  %466 = inttoptr i64 %465 to i8*
  %467 = load i8* %466
  %468 = icmp ne i8 %467, 0
  br i1 %468, label %469, label %470

; <label>:469                                     ; preds = %461
  call void @__asan_report_store8(i64 %463)
  call void asm sideeffect "", ""()
  unreachable

; <label>:470                                     ; preds = %461
  store %struct.arc* %462, %struct.arc** %nextin, align 8
  %head98 = getelementptr inbounds %struct.arc* %sigma_node165, i32 0, i32 2
  %471 = ptrtoint %struct.node** %head98 to i64
  %472 = lshr i64 %471, 3
  %473 = or i64 %472, 17592186044416
  %474 = inttoptr i64 %473 to i8*
  %475 = load i8* %474
  %476 = icmp ne i8 %475, 0
  br i1 %476, label %477, label %478

; <label>:477                                     ; preds = %470
  call void @__asan_report_load8(i64 %471)
  call void asm sideeffect "", ""()
  unreachable

; <label>:478                                     ; preds = %470
  %479 = load %struct.node** %head98, align 8
  %firstin99 = getelementptr inbounds %struct.node* %479, i32 0, i32 8
  %480 = ptrtoint %struct.arc** %firstin99 to i64
  %481 = lshr i64 %480, 3
  %482 = or i64 %481, 17592186044416
  %483 = inttoptr i64 %482 to i8*
  %484 = load i8* %483
  %485 = icmp ne i8 %484, 0
  br i1 %485, label %486, label %487

; <label>:486                                     ; preds = %478
  call void @__asan_report_store8(i64 %480)
  call void asm sideeffect "", ""()
  unreachable

; <label>:487                                     ; preds = %478
  store %struct.arc* %sigma_node165, %struct.arc** %firstin99, align 8
  br label %for.inc100

for.inc100:                                       ; preds = %487
  %incdec.ptr101 = getelementptr inbounds %struct.arc* %sigma_node165, i32 1
  br label %for.cond87

for.end102:                                       ; preds = %for.cond87
  %sigma_node172 = phi i8* [ %phi_node171, %for.cond87 ]
  %sigma_node169 = phi %struct.arc* [ %phi_node168, %for.cond87 ]
  %sigma_node166 = phi %struct.arc* [ %arcnew.1, %for.cond87 ]
  br label %if.end103

if.end103:                                        ; preds = %for.end102, %for.end85
  %m104 = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %488 = ptrtoint i64* %m104 to i64
  %489 = lshr i64 %488, 3
  %490 = or i64 %489, 17592186044416
  %491 = inttoptr i64 %490 to i8*
  %492 = load i8* %491
  %493 = icmp ne i8 %492, 0
  br i1 %493, label %494, label %495

; <label>:494                                     ; preds = %if.end103
  call void @__asan_report_load8(i64 %488)
  call void asm sideeffect "", ""()
  unreachable

; <label>:495                                     ; preds = %if.end103
  %496 = load i64* %m104, align 8
  %add105 = add nsw i64 %496, %sigma_node153
  store i64 %add105, i64* %m104, align 8
  %m_impl = getelementptr inbounds %struct.network* %net, i32 0, i32 7
  %497 = ptrtoint i64* %m_impl to i64
  %498 = lshr i64 %497, 3
  %499 = or i64 %498, 17592186044416
  %500 = inttoptr i64 %499 to i8*
  %501 = load i8* %500
  %502 = icmp ne i8 %501, 0
  br i1 %502, label %503, label %504

; <label>:503                                     ; preds = %495
  call void @__asan_report_load8(i64 %497)
  call void asm sideeffect "", ""()
  unreachable

; <label>:504                                     ; preds = %495
  %505 = load i64* %m_impl, align 8
  %add106 = add nsw i64 %505, %sigma_node153
  store i64 %add106, i64* %m_impl, align 8
  %max_residual_new_m107 = getelementptr inbounds %struct.network* %net, i32 0, i32 8
  %506 = ptrtoint i64* %max_residual_new_m107 to i64
  %507 = lshr i64 %506, 3
  %508 = or i64 %507, 17592186044416
  %509 = inttoptr i64 %508 to i8*
  %510 = load i8* %509
  %511 = icmp ne i8 %510, 0
  br i1 %511, label %512, label %513

; <label>:512                                     ; preds = %504
  call void @__asan_report_load8(i64 %506)
  call void asm sideeffect "", ""()
  unreachable

; <label>:513                                     ; preds = %504
  %514 = load i64* %max_residual_new_m107, align 8
  %sub108 = sub nsw i64 %514, %sigma_node153
  store i64 %sub108, i64* %max_residual_new_m107, align 8
  br label %if.end109

if.end109:                                        ; preds = %for.end69.if.end109_crit_edge, %513
  br label %return

return:                                           ; preds = %if.end109, %if.then10
  %retval.0 = phi i64 [ -1, %if.then10 ], [ %new_arcs.0, %if.end109 ]
  ret i64 %retval.0
}

declare void @refresh_neighbour_lists(%struct.network*)

define i64 @suspend_impl(%struct.network* %net, i64 %threshold, i64 %all) address_safety nounwind {
entry:
  %tobool = icmp ne i64 %all, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %sigma_node = phi i64 [ %all, %entry ]
  %m_impl = getelementptr inbounds %struct.network* %net, i32 0, i32 7
  %0 = ptrtoint i64* %m_impl to i64
  %1 = lshr i64 %0, 3
  %2 = or i64 %1, 17592186044416
  %3 = inttoptr i64 %2 to i8*
  %4 = load i8* %3
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %if.then
  call void @__asan_report_load8(i64 %0)
  call void asm sideeffect "", ""()
  unreachable

; <label>:7                                       ; preds = %if.then
  %8 = load i64* %m_impl, align 8
  br label %if.end25

if.else:                                          ; preds = %entry
  %sigma_node35 = phi i64 [ %all, %entry ]
  %stop_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %9 = ptrtoint %struct.arc** %stop_arcs to i64
  %10 = lshr i64 %9, 3
  %11 = or i64 %10, 17592186044416
  %12 = inttoptr i64 %11 to i8*
  %13 = load i8* %12
  %14 = icmp ne i8 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %if.else
  call void @__asan_report_load8(i64 %9)
  call void asm sideeffect "", ""()
  unreachable

; <label>:16                                      ; preds = %if.else
  %17 = load %struct.arc** %stop_arcs, align 8
  %18 = bitcast %struct.arc* %17 to i8*
  %m = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %19 = ptrtoint i64* %m to i64
  %20 = lshr i64 %19, 3
  %21 = or i64 %20, 17592186044416
  %22 = inttoptr i64 %21 to i8*
  %23 = load i8* %22
  %24 = icmp ne i8 %23, 0
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %16
  call void @__asan_report_load8(i64 %19)
  call void asm sideeffect "", ""()
  unreachable

; <label>:26                                      ; preds = %16
  %27 = load i64* %m, align 8
  %m_impl1 = getelementptr inbounds %struct.network* %net, i32 0, i32 7
  %28 = ptrtoint i64* %m_impl1 to i64
  %29 = lshr i64 %28, 3
  %30 = or i64 %29, 17592186044416
  %31 = inttoptr i64 %30 to i8*
  %32 = load i8* %31
  %33 = icmp ne i8 %32, 0
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %26
  call void @__asan_report_load8(i64 %28)
  call void asm sideeffect "", ""()
  unreachable

; <label>:35                                      ; preds = %26
  %36 = load i64* %m_impl1, align 8
  %sub = sub nsw i64 %27, %36
  %arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %37 = ptrtoint %struct.arc** %arcs to i64
  %38 = lshr i64 %37, 3
  %39 = or i64 %38, 17592186044416
  %40 = inttoptr i64 %39 to i8*
  %41 = load i8* %40
  %42 = icmp ne i8 %41, 0
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %35
  call void @__asan_report_load8(i64 %37)
  call void asm sideeffect "", ""()
  unreachable

; <label>:44                                      ; preds = %35
  %45 = load %struct.arc** %arcs, align 8
  %arrayidx = getelementptr inbounds %struct.arc* %45, i64 %sub
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %44
  %phi_node = phi i8* [ %sigma_node40, %for.inc ], [ %18, %44 ]
  %susp.0 = phi i64 [ 0, %44 ], [ %susp.1, %for.inc ]
  %new_arc.0 = phi %struct.arc* [ %arrayidx, %44 ], [ %new_arc.1, %for.inc ]
  %arc.0 = phi %struct.arc* [ %arrayidx, %44 ], [ %incdec.ptr24, %for.inc ]
  %46 = bitcast i8* %phi_node to %struct.arc*
  %cmp = icmp ult %struct.arc* %arc.0, %46
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node40 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node38 = phi %struct.arc* [ %46, %for.cond ]
  %sigma_node36 = phi %struct.arc* [ %arc.0, %for.cond ]
  %ident = getelementptr inbounds %struct.arc* %sigma_node36, i32 0, i32 3
  %47 = ptrtoint i32* %ident to i64
  %48 = lshr i64 %47, 3
  %49 = or i64 %48, 17592186044416
  %50 = inttoptr i64 %49 to i8*
  %51 = load i8* %50
  %52 = icmp ne i8 %51, 0
  br i1 %52, label %53, label %59

; <label>:53                                      ; preds = %for.body
  %54 = and i64 %47, 7
  %55 = add i64 %54, 3
  %56 = trunc i64 %55 to i8
  %57 = icmp sge i8 %56, %51
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %53
  call void @__asan_report_load4(i64 %47)
  call void asm sideeffect "", ""()
  unreachable

; <label>:59                                      ; preds = %53, %for.body
  %60 = load i32* %ident, align 4
  %cmp2 = icmp eq i32 %60, 1
  br i1 %cmp2, label %if.then3, label %if.else6

if.then3:                                         ; preds = %59
  %sigma_node42 = phi i32 [ %60, %59 ]
  %cost = getelementptr inbounds %struct.arc* %sigma_node36, i32 0, i32 0
  %61 = ptrtoint i64* %cost to i64
  %62 = lshr i64 %61, 3
  %63 = or i64 %62, 17592186044416
  %64 = inttoptr i64 %63 to i8*
  %65 = load i8* %64
  %66 = icmp ne i8 %65, 0
  br i1 %66, label %67, label %68

; <label>:67                                      ; preds = %if.then3
  call void @__asan_report_load8(i64 %61)
  call void asm sideeffect "", ""()
  unreachable

; <label>:68                                      ; preds = %if.then3
  %69 = load i64* %cost, align 8
  %tail = getelementptr inbounds %struct.arc* %sigma_node36, i32 0, i32 1
  %70 = ptrtoint %struct.node** %tail to i64
  %71 = lshr i64 %70, 3
  %72 = or i64 %71, 17592186044416
  %73 = inttoptr i64 %72 to i8*
  %74 = load i8* %73
  %75 = icmp ne i8 %74, 0
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %68
  call void @__asan_report_load8(i64 %70)
  call void asm sideeffect "", ""()
  unreachable

; <label>:77                                      ; preds = %68
  %78 = load %struct.node** %tail, align 8
  %potential = getelementptr inbounds %struct.node* %78, i32 0, i32 0
  %79 = ptrtoint i64* %potential to i64
  %80 = lshr i64 %79, 3
  %81 = or i64 %80, 17592186044416
  %82 = inttoptr i64 %81 to i8*
  %83 = load i8* %82
  %84 = icmp ne i8 %83, 0
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %77
  call void @__asan_report_load8(i64 %79)
  call void asm sideeffect "", ""()
  unreachable

; <label>:86                                      ; preds = %77
  %87 = load i64* %potential, align 8
  %sub4 = sub nsw i64 %69, %87
  %head = getelementptr inbounds %struct.arc* %sigma_node36, i32 0, i32 2
  %88 = ptrtoint %struct.node** %head to i64
  %89 = lshr i64 %88, 3
  %90 = or i64 %89, 17592186044416
  %91 = inttoptr i64 %90 to i8*
  %92 = load i8* %91
  %93 = icmp ne i8 %92, 0
  br i1 %93, label %94, label %95

; <label>:94                                      ; preds = %86
  call void @__asan_report_load8(i64 %88)
  call void asm sideeffect "", ""()
  unreachable

; <label>:95                                      ; preds = %86
  %96 = load %struct.node** %head, align 8
  %potential5 = getelementptr inbounds %struct.node* %96, i32 0, i32 0
  %97 = ptrtoint i64* %potential5 to i64
  %98 = lshr i64 %97, 3
  %99 = or i64 %98, 17592186044416
  %100 = inttoptr i64 %99 to i8*
  %101 = load i8* %100
  %102 = icmp ne i8 %101, 0
  br i1 %102, label %103, label %104

; <label>:103                                     ; preds = %95
  call void @__asan_report_load8(i64 %97)
  call void asm sideeffect "", ""()
  unreachable

; <label>:104                                     ; preds = %95
  %105 = load i64* %potential5, align 8
  %add = add nsw i64 %sub4, %105
  br label %if.end19

if.else6:                                         ; preds = %59
  %sigma_node43 = phi i32 [ %60, %59 ]
  %ident7 = getelementptr inbounds %struct.arc* %sigma_node36, i32 0, i32 3
  %106 = ptrtoint i32* %ident7 to i64
  %107 = lshr i64 %106, 3
  %108 = or i64 %107, 17592186044416
  %109 = inttoptr i64 %108 to i8*
  %110 = load i8* %109
  %111 = icmp ne i8 %110, 0
  br i1 %111, label %112, label %118

; <label>:112                                     ; preds = %if.else6
  %113 = and i64 %106, 7
  %114 = add i64 %113, 3
  %115 = trunc i64 %114 to i8
  %116 = icmp sge i8 %115, %110
  br i1 %116, label %117, label %118

; <label>:117                                     ; preds = %112
  call void @__asan_report_load4(i64 %106)
  call void asm sideeffect "", ""()
  unreachable

; <label>:118                                     ; preds = %112, %if.else6
  %119 = load i32* %ident7, align 4
  %cmp8 = icmp eq i32 %119, 0
  br i1 %cmp8, label %if.then9, label %if.else6.if.end18_crit_edge

if.else6.if.end18_crit_edge:                      ; preds = %118
  %sigma_node45 = phi i32 [ %119, %118 ]
  br label %if.end18

if.then9:                                         ; preds = %118
  %sigma_node44 = phi i32 [ %119, %118 ]
  %tail10 = getelementptr inbounds %struct.arc* %sigma_node36, i32 0, i32 1
  %120 = ptrtoint %struct.node** %tail10 to i64
  %121 = lshr i64 %120, 3
  %122 = or i64 %121, 17592186044416
  %123 = inttoptr i64 %122 to i8*
  %124 = load i8* %123
  %125 = icmp ne i8 %124, 0
  br i1 %125, label %126, label %127

; <label>:126                                     ; preds = %if.then9
  call void @__asan_report_load8(i64 %120)
  call void asm sideeffect "", ""()
  unreachable

; <label>:127                                     ; preds = %if.then9
  %128 = load %struct.node** %tail10, align 8
  %basic_arc = getelementptr inbounds %struct.node* %128, i32 0, i32 6
  %129 = ptrtoint %struct.arc** %basic_arc to i64
  %130 = lshr i64 %129, 3
  %131 = or i64 %130, 17592186044416
  %132 = inttoptr i64 %131 to i8*
  %133 = load i8* %132
  %134 = icmp ne i8 %133, 0
  br i1 %134, label %135, label %136

; <label>:135                                     ; preds = %127
  call void @__asan_report_load8(i64 %129)
  call void asm sideeffect "", ""()
  unreachable

; <label>:136                                     ; preds = %127
  %137 = load %struct.arc** %basic_arc, align 8
  %cmp11 = icmp eq %struct.arc* %137, %sigma_node36
  br i1 %cmp11, label %if.then12, label %if.else15

if.then12:                                        ; preds = %136
  %sigma_node48 = phi %struct.arc* [ %sigma_node36, %136 ]
  %sigma_node46 = phi %struct.arc* [ %137, %136 ]
  %tail13 = getelementptr inbounds %struct.arc* %sigma_node48, i32 0, i32 1
  %138 = ptrtoint %struct.node** %tail13 to i64
  %139 = lshr i64 %138, 3
  %140 = or i64 %139, 17592186044416
  %141 = inttoptr i64 %140 to i8*
  %142 = load i8* %141
  %143 = icmp ne i8 %142, 0
  br i1 %143, label %144, label %145

; <label>:144                                     ; preds = %if.then12
  call void @__asan_report_load8(i64 %138)
  call void asm sideeffect "", ""()
  unreachable

; <label>:145                                     ; preds = %if.then12
  %146 = load %struct.node** %tail13, align 8
  %basic_arc14 = getelementptr inbounds %struct.node* %146, i32 0, i32 6
  %147 = ptrtoint %struct.arc** %basic_arc14 to i64
  %148 = lshr i64 %147, 3
  %149 = or i64 %148, 17592186044416
  %150 = inttoptr i64 %149 to i8*
  %151 = load i8* %150
  %152 = icmp ne i8 %151, 0
  br i1 %152, label %153, label %154

; <label>:153                                     ; preds = %145
  call void @__asan_report_store8(i64 %147)
  call void asm sideeffect "", ""()
  unreachable

; <label>:154                                     ; preds = %145
  store %struct.arc* %new_arc.0, %struct.arc** %basic_arc14, align 8
  br label %if.end

if.else15:                                        ; preds = %136
  %sigma_node49 = phi %struct.arc* [ %sigma_node36, %136 ]
  %sigma_node47 = phi %struct.arc* [ %137, %136 ]
  %head16 = getelementptr inbounds %struct.arc* %sigma_node49, i32 0, i32 2
  %155 = ptrtoint %struct.node** %head16 to i64
  %156 = lshr i64 %155, 3
  %157 = or i64 %156, 17592186044416
  %158 = inttoptr i64 %157 to i8*
  %159 = load i8* %158
  %160 = icmp ne i8 %159, 0
  br i1 %160, label %161, label %162

; <label>:161                                     ; preds = %if.else15
  call void @__asan_report_load8(i64 %155)
  call void asm sideeffect "", ""()
  unreachable

; <label>:162                                     ; preds = %if.else15
  %163 = load %struct.node** %head16, align 8
  %basic_arc17 = getelementptr inbounds %struct.node* %163, i32 0, i32 6
  %164 = ptrtoint %struct.arc** %basic_arc17 to i64
  %165 = lshr i64 %164, 3
  %166 = or i64 %165, 17592186044416
  %167 = inttoptr i64 %166 to i8*
  %168 = load i8* %167
  %169 = icmp ne i8 %168, 0
  br i1 %169, label %170, label %171

; <label>:170                                     ; preds = %162
  call void @__asan_report_store8(i64 %164)
  call void asm sideeffect "", ""()
  unreachable

; <label>:171                                     ; preds = %162
  store %struct.arc* %new_arc.0, %struct.arc** %basic_arc17, align 8
  br label %if.end

if.end:                                           ; preds = %171, %154
  br label %if.end18

if.end18:                                         ; preds = %if.else6.if.end18_crit_edge, %if.end
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %104
  %red_cost.0 = phi i64 [ %add, %104 ], [ -2, %if.end18 ]
  %cmp20 = icmp sgt i64 %red_cost.0, %threshold
  br i1 %cmp20, label %if.then21, label %if.else22

if.then21:                                        ; preds = %if.end19
  %sigma_node52 = phi i64 [ %threshold, %if.end19 ]
  %sigma_node50 = phi i64 [ %red_cost.0, %if.end19 ]
  %inc = add nsw i64 %susp.0, 1
  br label %if.end23

if.else22:                                        ; preds = %if.end19
  %sigma_node53 = phi i64 [ %threshold, %if.end19 ]
  %sigma_node51 = phi i64 [ %red_cost.0, %if.end19 ]
  %172 = bitcast %struct.arc* %new_arc.0 to i8*
  %173 = bitcast %struct.arc* %sigma_node36 to i8*
  br label %if.else22.split

if.else22.split:                                  ; preds = %if.else22
  %omega_node57 = phi i8* [ %173, %if.else22 ]
  %omega_node = phi i8* [ %172, %if.else22 ]
  %174 = ptrtoint i8* %omega_node to i64
  %175 = lshr i64 %174, 3
  %176 = or i64 %175, 17592186044416
  %177 = inttoptr i64 %176 to i8*
  %178 = load i8* %177
  %179 = icmp ne i8 %178, 0
  br i1 %179, label %180, label %185

; <label>:180                                     ; preds = %if.else22.split
  %181 = and i64 %174, 7
  %182 = trunc i64 %181 to i8
  %183 = icmp sge i8 %182, %178
  br i1 %183, label %184, label %185

; <label>:184                                     ; preds = %180
  call void @__asan_report_store1(i64 %174)
  call void asm sideeffect "", ""()
  unreachable

; <label>:185                                     ; preds = %180, %if.else22.split
  %186 = ptrtoint i8* %omega_node to i64
  %187 = add i64 %186, 63
  %188 = lshr i64 %187, 3
  %189 = or i64 %188, 17592186044416
  %190 = inttoptr i64 %189 to i8*
  %191 = load i8* %190
  %192 = icmp ne i8 %191, 0
  br i1 %192, label %193, label %198

; <label>:193                                     ; preds = %185
  %194 = and i64 %187, 7
  %195 = trunc i64 %194 to i8
  %196 = icmp sge i8 %195, %191
  br i1 %196, label %197, label %198

; <label>:197                                     ; preds = %193
  call void @__asan_report_store1(i64 %187)
  call void asm sideeffect "", ""()
  unreachable

; <label>:198                                     ; preds = %193, %185
  %199 = ptrtoint i8* %omega_node57 to i64
  %200 = lshr i64 %199, 3
  %201 = or i64 %200, 17592186044416
  %202 = inttoptr i64 %201 to i8*
  %203 = load i8* %202
  %204 = icmp ne i8 %203, 0
  br i1 %204, label %205, label %210

; <label>:205                                     ; preds = %198
  %206 = and i64 %199, 7
  %207 = trunc i64 %206 to i8
  %208 = icmp sge i8 %207, %203
  br i1 %208, label %209, label %210

; <label>:209                                     ; preds = %205
  call void @__asan_report_load1(i64 %199)
  call void asm sideeffect "", ""()
  unreachable

; <label>:210                                     ; preds = %205, %198
  %211 = ptrtoint i8* %omega_node57 to i64
  %212 = add i64 %211, 63
  %213 = lshr i64 %212, 3
  %214 = or i64 %213, 17592186044416
  %215 = inttoptr i64 %214 to i8*
  %216 = load i8* %215
  %217 = icmp ne i8 %216, 0
  br i1 %217, label %218, label %223

; <label>:218                                     ; preds = %210
  %219 = and i64 %212, 7
  %220 = trunc i64 %219 to i8
  %221 = icmp sge i8 %220, %216
  br i1 %221, label %222, label %223

; <label>:222                                     ; preds = %218
  call void @__asan_report_load1(i64 %212)
  call void asm sideeffect "", ""()
  unreachable

; <label>:223                                     ; preds = %218, %210
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %omega_node, i8* %omega_node57, i64 64, i32 8, i1 false)
  %incdec.ptr = getelementptr inbounds %struct.arc* %new_arc.0, i32 1
  br label %if.end23

if.end23:                                         ; preds = %223, %if.then21
  %susp.1 = phi i64 [ %inc, %if.then21 ], [ %susp.0, %223 ]
  %new_arc.1 = phi %struct.arc* [ %new_arc.0, %if.then21 ], [ %incdec.ptr, %223 ]
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %incdec.ptr24 = getelementptr inbounds %struct.arc* %sigma_node36, i32 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node41 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node39 = phi %struct.arc* [ %46, %for.cond ]
  %sigma_node37 = phi %struct.arc* [ %arc.0, %for.cond ]
  br label %if.end25

if.end25:                                         ; preds = %for.end, %7
  %susp.2 = phi i64 [ %8, %7 ], [ %susp.0, %for.end ]
  %tobool26 = icmp ne i64 %susp.2, 0
  br i1 %tobool26, label %if.then27, label %if.end25.if.end34_crit_edge

if.end25.if.end34_crit_edge:                      ; preds = %if.end25
  %sigma_node56 = phi i64 [ %susp.2, %if.end25 ]
  br label %if.end34

if.then27:                                        ; preds = %if.end25
  %sigma_node54 = phi i64 [ %susp.2, %if.end25 ]
  %m28 = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %224 = ptrtoint i64* %m28 to i64
  %225 = lshr i64 %224, 3
  %226 = or i64 %225, 17592186044416
  %227 = inttoptr i64 %226 to i8*
  %228 = load i8* %227
  %229 = icmp ne i8 %228, 0
  br i1 %229, label %230, label %231

; <label>:230                                     ; preds = %if.then27
  call void @__asan_report_load8(i64 %224)
  call void asm sideeffect "", ""()
  unreachable

; <label>:231                                     ; preds = %if.then27
  %232 = load i64* %m28, align 8
  %sub29 = sub nsw i64 %232, %sigma_node54
  store i64 %sub29, i64* %m28, align 8
  %m_impl30 = getelementptr inbounds %struct.network* %net, i32 0, i32 7
  %233 = ptrtoint i64* %m_impl30 to i64
  %234 = lshr i64 %233, 3
  %235 = or i64 %234, 17592186044416
  %236 = inttoptr i64 %235 to i8*
  %237 = load i8* %236
  %238 = icmp ne i8 %237, 0
  br i1 %238, label %239, label %240

; <label>:239                                     ; preds = %231
  call void @__asan_report_load8(i64 %233)
  call void asm sideeffect "", ""()
  unreachable

; <label>:240                                     ; preds = %231
  %241 = load i64* %m_impl30, align 8
  %sub31 = sub nsw i64 %241, %sigma_node54
  store i64 %sub31, i64* %m_impl30, align 8
  %stop_arcs32 = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %242 = ptrtoint %struct.arc** %stop_arcs32 to i64
  %243 = lshr i64 %242, 3
  %244 = or i64 %243, 17592186044416
  %245 = inttoptr i64 %244 to i8*
  %246 = load i8* %245
  %247 = icmp ne i8 %246, 0
  br i1 %247, label %248, label %249

; <label>:248                                     ; preds = %240
  call void @__asan_report_load8(i64 %242)
  call void asm sideeffect "", ""()
  unreachable

; <label>:249                                     ; preds = %240
  %250 = load %struct.arc** %stop_arcs32, align 8
  %idx.neg = sub i64 0, %sigma_node54
  %add.ptr = getelementptr inbounds %struct.arc* %250, i64 %idx.neg
  store %struct.arc* %add.ptr, %struct.arc** %stop_arcs32, align 8
  %max_residual_new_m = getelementptr inbounds %struct.network* %net, i32 0, i32 8
  %251 = ptrtoint i64* %max_residual_new_m to i64
  %252 = lshr i64 %251, 3
  %253 = or i64 %252, 17592186044416
  %254 = inttoptr i64 %253 to i8*
  %255 = load i8* %254
  %256 = icmp ne i8 %255, 0
  br i1 %256, label %257, label %258

; <label>:257                                     ; preds = %249
  call void @__asan_report_load8(i64 %251)
  call void asm sideeffect "", ""()
  unreachable

; <label>:258                                     ; preds = %249
  %259 = load i64* %max_residual_new_m, align 8
  %add33 = add nsw i64 %259, %sigma_node54
  store i64 %add33, i64* %max_residual_new_m, align 8
  br label %if.then27.split

if.then27.split:                                  ; preds = %258
  %omega_node58 = phi %struct.network* [ %net, %258 ]
  call void @refresh_neighbour_lists(%struct.network* %omega_node58)
  br label %if.end34

if.end34:                                         ; preds = %if.end25.if.end34_crit_edge, %if.then27.split
  %phi_node55 = phi i64 [ %sigma_node54, %if.then27.split ], [ %sigma_node56, %if.end25.if.end34_crit_edge ]
  ret i64 %phi_node55
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal void @asan.module_ctor() {
  call void @__asan_init()
  %1 = load volatile i64* @__asan_mapping_offset
  %2 = load volatile i64* @__asan_mapping_scale
  call void @__asan_register_globals(i64 ptrtoint ([4 x { i64, i64, i64, i64, i64 }]* @0 to i64), i64 4)
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
  call void @__asan_unregister_globals(i64 ptrtoint ([4 x { i64, i64, i64, i64, i64 }]* @0 to i64), i64 4)
  ret void
}

!0 = metadata !{i32 94}
!1 = metadata !{}
!2 = metadata !{i32 86}
!3 = metadata !{i32 78}
!4 = metadata !{i32 42}
!5 = metadata !{i32 50}
!6 = metadata !{i32 30}
!7 = metadata !{i32 22}
!8 = metadata !{i32 14}
