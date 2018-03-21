; ModuleID = 'treeup.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }

@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]

define void @update_tree(i64 %cycle_ori, i64 %new_orientation, i64 %delta, i64 %new_flow, %struct.node* %iplus, %struct.node* %jplus, %struct.node* %iminus, %struct.node* %jminus, %struct.node* %w, %struct.arc* %bea, i64 %sigma, i64 %feas_tol) address_safety nounwind {
entry:
  %tail = getelementptr inbounds %struct.arc* %bea, i32 0, i32 1
  %0 = ptrtoint %struct.node** %tail to i64
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
  %8 = load %struct.node** %tail, align 8
  %cmp = icmp eq %struct.node* %8, %jplus
  br i1 %cmp, label %land.lhs.true, label %entry.lor.lhs.false_crit_edge

entry.lor.lhs.false_crit_edge:                    ; preds = %7
  %sigma_node131 = phi %struct.node* [ %jplus, %7 ]
  %sigma_node129 = phi %struct.node* [ %8, %7 ]
  br label %lor.lhs.false

land.lhs.true:                                    ; preds = %7
  %sigma_node130 = phi %struct.node* [ %jplus, %7 ]
  %sigma_node = phi %struct.node* [ %8, %7 ]
  %cmp1 = icmp slt i64 %sigma, 0
  br i1 %cmp1, label %land.lhs.true.if.then_crit_edge, label %land.lhs.true.lor.lhs.false_crit_edge

land.lhs.true.lor.lhs.false_crit_edge:            ; preds = %land.lhs.true
  %sigma_node133 = phi i64 [ %sigma, %land.lhs.true ]
  br label %lor.lhs.false

land.lhs.true.if.then_crit_edge:                  ; preds = %land.lhs.true
  %sigma_node132 = phi i64 [ %sigma, %land.lhs.true ]
  br label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true.lor.lhs.false_crit_edge, %entry.lor.lhs.false_crit_edge
  %tail2 = getelementptr inbounds %struct.arc* %bea, i32 0, i32 1
  %9 = ptrtoint %struct.node** %tail2 to i64
  %10 = lshr i64 %9, 3
  %11 = or i64 %10, 17592186044416
  %12 = inttoptr i64 %11 to i8*
  %13 = load i8* %12
  %14 = icmp ne i8 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %lor.lhs.false
  call void @__asan_report_load8(i64 %9)
  call void asm sideeffect "", ""()
  unreachable

; <label>:16                                      ; preds = %lor.lhs.false
  %17 = load %struct.node** %tail2, align 8
  %cmp3 = icmp eq %struct.node* %17, %iplus
  br i1 %cmp3, label %land.lhs.true4, label %lor.lhs.false.if.else_crit_edge

lor.lhs.false.if.else_crit_edge:                  ; preds = %16
  %sigma_node139 = phi %struct.node* [ %iplus, %16 ]
  %sigma_node137 = phi %struct.node* [ %17, %16 ]
  br label %if.else

land.lhs.true4:                                   ; preds = %16
  %sigma_node138 = phi %struct.node* [ %iplus, %16 ]
  %sigma_node136 = phi %struct.node* [ %17, %16 ]
  %cmp5 = icmp sgt i64 %sigma, 0
  br i1 %cmp5, label %land.lhs.true4.if.then_crit_edge, label %land.lhs.true4.if.else_crit_edge

land.lhs.true4.if.else_crit_edge:                 ; preds = %land.lhs.true4
  %sigma_node141 = phi i64 [ %sigma, %land.lhs.true4 ]
  br label %if.else

land.lhs.true4.if.then_crit_edge:                 ; preds = %land.lhs.true4
  %sigma_node140 = phi i64 [ %sigma, %land.lhs.true4 ]
  br label %if.then

if.then:                                          ; preds = %land.lhs.true4.if.then_crit_edge, %land.lhs.true.if.then_crit_edge
  %phi_node = phi i64 [ %sigma_node132, %land.lhs.true.if.then_crit_edge ], [ %sigma_node140, %land.lhs.true4.if.then_crit_edge ]
  %cmp6 = icmp sge i64 %phi_node, 0
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %sigma_node134 = phi i64 [ %phi_node, %if.then ]
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %sigma_node135 = phi i64 [ %phi_node, %if.then ]
  %sub = sub nsw i64 0, %sigma_node135
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sigma_node134, %cond.true ], [ %sub, %cond.false ]
  br label %if.end

if.else:                                          ; preds = %land.lhs.true4.if.else_crit_edge, %lor.lhs.false.if.else_crit_edge
  %phi_node142 = phi i64 [ %sigma_node141, %land.lhs.true4.if.else_crit_edge ], [ %sigma, %lor.lhs.false.if.else_crit_edge ]
  %cmp7 = icmp sge i64 %phi_node142, 0
  br i1 %cmp7, label %cond.true8, label %cond.false9

cond.true8:                                       ; preds = %if.else
  %sigma_node143 = phi i64 [ %phi_node142, %if.else ]
  br label %cond.end11

cond.false9:                                      ; preds = %if.else
  %sigma_node144 = phi i64 [ %phi_node142, %if.else ]
  %sub10 = sub nsw i64 0, %sigma_node144
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false9, %cond.true8
  %cond12 = phi i64 [ %sigma_node143, %cond.true8 ], [ %sub10, %cond.false9 ]
  %sub13 = sub nsw i64 0, %cond12
  br label %if.end

if.end:                                           ; preds = %cond.end11, %cond.end
  %sigma.addr.0 = phi i64 [ %cond, %cond.end ], [ %sub13, %cond.end11 ]
  %potential = getelementptr inbounds %struct.node* %iminus, i32 0, i32 0
  %18 = ptrtoint i64* %potential to i64
  %19 = lshr i64 %18, 3
  %20 = or i64 %19, 17592186044416
  %21 = inttoptr i64 %20 to i8*
  %22 = load i8* %21
  %23 = icmp ne i8 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %if.end
  call void @__asan_report_load8(i64 %18)
  call void asm sideeffect "", ""()
  unreachable

; <label>:25                                      ; preds = %if.end
  %26 = load i64* %potential, align 8
  %add = add nsw i64 %26, %sigma.addr.0
  store i64 %add, i64* %potential, align 8
  br label %RECURSION

RECURSION:                                        ; preds = %43, %25
  %father.0 = phi %struct.node* [ %iminus, %25 ], [ %temp.0, %43 ]
  %child = getelementptr inbounds %struct.node* %father.0, i32 0, i32 2
  %27 = ptrtoint %struct.node** %child to i64
  %28 = lshr i64 %27, 3
  %29 = or i64 %28, 17592186044416
  %30 = inttoptr i64 %29 to i8*
  %31 = load i8* %30
  %32 = icmp ne i8 %31, 0
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %RECURSION
  call void @__asan_report_load8(i64 %27)
  call void asm sideeffect "", ""()
  unreachable

; <label>:34                                      ; preds = %RECURSION
  %35 = load %struct.node** %child, align 8
  %tobool = icmp ne %struct.node* %35, null
  br i1 %tobool, label %if.then14, label %if.end17

if.then14:                                        ; preds = %34
  %sigma_node145 = phi %struct.node* [ %35, %34 ]
  br label %ITERATION

ITERATION:                                        ; preds = %if.then22, %if.then14
  %temp.0 = phi %struct.node* [ %sigma_node145, %if.then14 ], [ %sigma_node152, %if.then22 ]
  %potential15 = getelementptr inbounds %struct.node* %temp.0, i32 0, i32 0
  %36 = ptrtoint i64* %potential15 to i64
  %37 = lshr i64 %36, 3
  %38 = or i64 %37, 17592186044416
  %39 = inttoptr i64 %38 to i8*
  %40 = load i8* %39
  %41 = icmp ne i8 %40, 0
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %ITERATION
  call void @__asan_report_load8(i64 %36)
  call void asm sideeffect "", ""()
  unreachable

; <label>:43                                      ; preds = %ITERATION
  %44 = load i64* %potential15, align 8
  %add16 = add nsw i64 %44, %sigma.addr.0
  store i64 %add16, i64* %potential15, align 8
  br label %RECURSION

if.end17:                                         ; preds = %34
  %sigma_node146 = phi %struct.node* [ %35, %34 ]
  br label %TEST

TEST:                                             ; preds = %61, %if.end17
  %phi_node151 = phi %struct.node* [ %sigma_node150, %61 ], [ %iminus, %if.end17 ]
  %father.1 = phi %struct.node* [ %father.0, %if.end17 ], [ %62, %61 ]
  %cmp18 = icmp eq %struct.node* %father.1, %phi_node151
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %TEST
  %sigma_node149 = phi %struct.node* [ %phi_node151, %TEST ]
  %sigma_node147 = phi %struct.node* [ %father.1, %TEST ]
  br label %CONTINUE

if.end20:                                         ; preds = %TEST
  %sigma_node150 = phi %struct.node* [ %phi_node151, %TEST ]
  %sigma_node148 = phi %struct.node* [ %father.1, %TEST ]
  %sibling = getelementptr inbounds %struct.node* %sigma_node148, i32 0, i32 4
  %45 = ptrtoint %struct.node** %sibling to i64
  %46 = lshr i64 %45, 3
  %47 = or i64 %46, 17592186044416
  %48 = inttoptr i64 %47 to i8*
  %49 = load i8* %48
  %50 = icmp ne i8 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %if.end20
  call void @__asan_report_load8(i64 %45)
  call void asm sideeffect "", ""()
  unreachable

; <label>:52                                      ; preds = %if.end20
  %53 = load %struct.node** %sibling, align 8
  %tobool21 = icmp ne %struct.node* %53, null
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %52
  %sigma_node152 = phi %struct.node* [ %53, %52 ]
  br label %ITERATION

if.end23:                                         ; preds = %52
  %sigma_node153 = phi %struct.node* [ %53, %52 ]
  %pred = getelementptr inbounds %struct.node* %sigma_node148, i32 0, i32 3
  %54 = ptrtoint %struct.node** %pred to i64
  %55 = lshr i64 %54, 3
  %56 = or i64 %55, 17592186044416
  %57 = inttoptr i64 %56 to i8*
  %58 = load i8* %57
  %59 = icmp ne i8 %58, 0
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %if.end23
  call void @__asan_report_load8(i64 %54)
  call void asm sideeffect "", ""()
  unreachable

; <label>:61                                      ; preds = %if.end23
  %62 = load %struct.node** %pred, align 8
  br label %TEST

CONTINUE:                                         ; preds = %if.then19
  %pred24 = getelementptr inbounds %struct.node* %iplus, i32 0, i32 3
  %63 = ptrtoint %struct.node** %pred24 to i64
  %64 = lshr i64 %63, 3
  %65 = or i64 %64, 17592186044416
  %66 = inttoptr i64 %65 to i8*
  %67 = load i8* %66
  %68 = icmp ne i8 %67, 0
  br i1 %68, label %69, label %70

; <label>:69                                      ; preds = %CONTINUE
  call void @__asan_report_load8(i64 %63)
  call void asm sideeffect "", ""()
  unreachable

; <label>:70                                      ; preds = %CONTINUE
  %71 = load %struct.node** %pred24, align 8
  %depth = getelementptr inbounds %struct.node* %sigma_node149, i32 0, i32 11
  %72 = ptrtoint i64* %depth to i64
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
  %80 = load i64* %depth, align 8
  br label %while.cond

while.cond:                                       ; preds = %329, %79
  %phi_node157 = phi %struct.node* [ %sigma_node156, %329 ], [ %jminus, %79 ]
  %new_basic_arc.0 = phi %struct.arc* [ %bea, %79 ], [ %275, %329 ]
  %father.2 = phi %struct.node* [ %71, %79 ], [ %330, %329 ]
  %temp.1 = phi %struct.node* [ %iplus, %79 ], [ %father.2, %329 ]
  %new_pred.0 = phi %struct.node* [ %jplus, %79 ], [ %sigma_node154, %329 ]
  %new_flow.addr.0 = phi i64 [ %new_flow, %79 ], [ %flow_temp.0, %329 ]
  %new_depth.0 = phi i64 [ %80, %79 ], [ %sub68, %329 ]
  %new_orientation.addr.0 = phi i64 [ %new_orientation, %79 ], [ %conv, %329 ]
  %cmp25 = icmp ne %struct.node* %temp.1, %phi_node157
  br i1 %cmp25, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %sigma_node156 = phi %struct.node* [ %phi_node157, %while.cond ]
  %sigma_node154 = phi %struct.node* [ %temp.1, %while.cond ]
  %sibling26 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 4
  %81 = ptrtoint %struct.node** %sibling26 to i64
  %82 = lshr i64 %81, 3
  %83 = or i64 %82, 17592186044416
  %84 = inttoptr i64 %83 to i8*
  %85 = load i8* %84
  %86 = icmp ne i8 %85, 0
  br i1 %86, label %87, label %88

; <label>:87                                      ; preds = %while.body
  call void @__asan_report_load8(i64 %81)
  call void asm sideeffect "", ""()
  unreachable

; <label>:88                                      ; preds = %while.body
  %89 = load %struct.node** %sibling26, align 8
  %tobool27 = icmp ne %struct.node* %89, null
  br i1 %tobool27, label %if.then28, label %while.body.if.end31_crit_edge

while.body.if.end31_crit_edge:                    ; preds = %88
  %sigma_node160 = phi %struct.node* [ %89, %88 ]
  br label %if.end31

if.then28:                                        ; preds = %88
  %sigma_node159 = phi %struct.node* [ %89, %88 ]
  %sibling_prev = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 5
  %90 = ptrtoint %struct.node** %sibling_prev to i64
  %91 = lshr i64 %90, 3
  %92 = or i64 %91, 17592186044416
  %93 = inttoptr i64 %92 to i8*
  %94 = load i8* %93
  %95 = icmp ne i8 %94, 0
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %if.then28
  call void @__asan_report_load8(i64 %90)
  call void asm sideeffect "", ""()
  unreachable

; <label>:97                                      ; preds = %if.then28
  %98 = load %struct.node** %sibling_prev, align 8
  %sibling29 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 4
  %99 = ptrtoint %struct.node** %sibling29 to i64
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
  %107 = load %struct.node** %sibling29, align 8
  %sibling_prev30 = getelementptr inbounds %struct.node* %107, i32 0, i32 5
  %108 = ptrtoint %struct.node** %sibling_prev30 to i64
  %109 = lshr i64 %108, 3
  %110 = or i64 %109, 17592186044416
  %111 = inttoptr i64 %110 to i8*
  %112 = load i8* %111
  %113 = icmp ne i8 %112, 0
  br i1 %113, label %114, label %115

; <label>:114                                     ; preds = %106
  call void @__asan_report_store8(i64 %108)
  call void asm sideeffect "", ""()
  unreachable

; <label>:115                                     ; preds = %106
  store %struct.node* %98, %struct.node** %sibling_prev30, align 8
  br label %if.end31

if.end31:                                         ; preds = %while.body.if.end31_crit_edge, %115
  %sibling_prev32 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 5
  %116 = ptrtoint %struct.node** %sibling_prev32 to i64
  %117 = lshr i64 %116, 3
  %118 = or i64 %117, 17592186044416
  %119 = inttoptr i64 %118 to i8*
  %120 = load i8* %119
  %121 = icmp ne i8 %120, 0
  br i1 %121, label %122, label %123

; <label>:122                                     ; preds = %if.end31
  call void @__asan_report_load8(i64 %116)
  call void asm sideeffect "", ""()
  unreachable

; <label>:123                                     ; preds = %if.end31
  %124 = load %struct.node** %sibling_prev32, align 8
  %tobool33 = icmp ne %struct.node* %124, null
  br i1 %tobool33, label %if.then34, label %if.else38

if.then34:                                        ; preds = %123
  %sigma_node161 = phi %struct.node* [ %124, %123 ]
  %sibling35 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 4
  %125 = ptrtoint %struct.node** %sibling35 to i64
  %126 = lshr i64 %125, 3
  %127 = or i64 %126, 17592186044416
  %128 = inttoptr i64 %127 to i8*
  %129 = load i8* %128
  %130 = icmp ne i8 %129, 0
  br i1 %130, label %131, label %132

; <label>:131                                     ; preds = %if.then34
  call void @__asan_report_load8(i64 %125)
  call void asm sideeffect "", ""()
  unreachable

; <label>:132                                     ; preds = %if.then34
  %133 = load %struct.node** %sibling35, align 8
  %sibling_prev36 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 5
  %134 = ptrtoint %struct.node** %sibling_prev36 to i64
  %135 = lshr i64 %134, 3
  %136 = or i64 %135, 17592186044416
  %137 = inttoptr i64 %136 to i8*
  %138 = load i8* %137
  %139 = icmp ne i8 %138, 0
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %132
  call void @__asan_report_load8(i64 %134)
  call void asm sideeffect "", ""()
  unreachable

; <label>:141                                     ; preds = %132
  %142 = load %struct.node** %sibling_prev36, align 8
  %sibling37 = getelementptr inbounds %struct.node* %142, i32 0, i32 4
  %143 = ptrtoint %struct.node** %sibling37 to i64
  %144 = lshr i64 %143, 3
  %145 = or i64 %144, 17592186044416
  %146 = inttoptr i64 %145 to i8*
  %147 = load i8* %146
  %148 = icmp ne i8 %147, 0
  br i1 %148, label %149, label %150

; <label>:149                                     ; preds = %141
  call void @__asan_report_store8(i64 %143)
  call void asm sideeffect "", ""()
  unreachable

; <label>:150                                     ; preds = %141
  store %struct.node* %133, %struct.node** %sibling37, align 8
  br label %if.end41

if.else38:                                        ; preds = %123
  %sigma_node162 = phi %struct.node* [ %124, %123 ]
  %sibling39 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 4
  %151 = ptrtoint %struct.node** %sibling39 to i64
  %152 = lshr i64 %151, 3
  %153 = or i64 %152, 17592186044416
  %154 = inttoptr i64 %153 to i8*
  %155 = load i8* %154
  %156 = icmp ne i8 %155, 0
  br i1 %156, label %157, label %158

; <label>:157                                     ; preds = %if.else38
  call void @__asan_report_load8(i64 %151)
  call void asm sideeffect "", ""()
  unreachable

; <label>:158                                     ; preds = %if.else38
  %159 = load %struct.node** %sibling39, align 8
  %child40 = getelementptr inbounds %struct.node* %father.2, i32 0, i32 2
  %160 = ptrtoint %struct.node** %child40 to i64
  %161 = lshr i64 %160, 3
  %162 = or i64 %161, 17592186044416
  %163 = inttoptr i64 %162 to i8*
  %164 = load i8* %163
  %165 = icmp ne i8 %164, 0
  br i1 %165, label %166, label %167

; <label>:166                                     ; preds = %158
  call void @__asan_report_store8(i64 %160)
  call void asm sideeffect "", ""()
  unreachable

; <label>:167                                     ; preds = %158
  store %struct.node* %159, %struct.node** %child40, align 8
  br label %if.end41

if.end41:                                         ; preds = %167, %150
  %pred42 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 3
  %168 = ptrtoint %struct.node** %pred42 to i64
  %169 = lshr i64 %168, 3
  %170 = or i64 %169, 17592186044416
  %171 = inttoptr i64 %170 to i8*
  %172 = load i8* %171
  %173 = icmp ne i8 %172, 0
  br i1 %173, label %174, label %175

; <label>:174                                     ; preds = %if.end41
  call void @__asan_report_store8(i64 %168)
  call void asm sideeffect "", ""()
  unreachable

; <label>:175                                     ; preds = %if.end41
  store %struct.node* %new_pred.0, %struct.node** %pred42, align 8
  %child43 = getelementptr inbounds %struct.node* %new_pred.0, i32 0, i32 2
  %176 = ptrtoint %struct.node** %child43 to i64
  %177 = lshr i64 %176, 3
  %178 = or i64 %177, 17592186044416
  %179 = inttoptr i64 %178 to i8*
  %180 = load i8* %179
  %181 = icmp ne i8 %180, 0
  br i1 %181, label %182, label %183

; <label>:182                                     ; preds = %175
  call void @__asan_report_load8(i64 %176)
  call void asm sideeffect "", ""()
  unreachable

; <label>:183                                     ; preds = %175
  %184 = load %struct.node** %child43, align 8
  %sibling44 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 4
  %185 = ptrtoint %struct.node** %sibling44 to i64
  %186 = lshr i64 %185, 3
  %187 = or i64 %186, 17592186044416
  %188 = inttoptr i64 %187 to i8*
  %189 = load i8* %188
  %190 = icmp ne i8 %189, 0
  br i1 %190, label %191, label %192

; <label>:191                                     ; preds = %183
  call void @__asan_report_store8(i64 %185)
  call void asm sideeffect "", ""()
  unreachable

; <label>:192                                     ; preds = %183
  store %struct.node* %184, %struct.node** %sibling44, align 8
  %sibling45 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 4
  %193 = ptrtoint %struct.node** %sibling45 to i64
  %194 = lshr i64 %193, 3
  %195 = or i64 %194, 17592186044416
  %196 = inttoptr i64 %195 to i8*
  %197 = load i8* %196
  %198 = icmp ne i8 %197, 0
  br i1 %198, label %199, label %200

; <label>:199                                     ; preds = %192
  call void @__asan_report_load8(i64 %193)
  call void asm sideeffect "", ""()
  unreachable

; <label>:200                                     ; preds = %192
  %201 = load %struct.node** %sibling45, align 8
  %tobool46 = icmp ne %struct.node* %201, null
  br i1 %tobool46, label %if.then47, label %if.end41.if.end50_crit_edge

if.end41.if.end50_crit_edge:                      ; preds = %200
  %sigma_node164 = phi %struct.node* [ %201, %200 ]
  br label %if.end50

if.then47:                                        ; preds = %200
  %sigma_node163 = phi %struct.node* [ %201, %200 ]
  %sibling48 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 4
  %202 = ptrtoint %struct.node** %sibling48 to i64
  %203 = lshr i64 %202, 3
  %204 = or i64 %203, 17592186044416
  %205 = inttoptr i64 %204 to i8*
  %206 = load i8* %205
  %207 = icmp ne i8 %206, 0
  br i1 %207, label %208, label %209

; <label>:208                                     ; preds = %if.then47
  call void @__asan_report_load8(i64 %202)
  call void asm sideeffect "", ""()
  unreachable

; <label>:209                                     ; preds = %if.then47
  %210 = load %struct.node** %sibling48, align 8
  %sibling_prev49 = getelementptr inbounds %struct.node* %210, i32 0, i32 5
  %211 = ptrtoint %struct.node** %sibling_prev49 to i64
  %212 = lshr i64 %211, 3
  %213 = or i64 %212, 17592186044416
  %214 = inttoptr i64 %213 to i8*
  %215 = load i8* %214
  %216 = icmp ne i8 %215, 0
  br i1 %216, label %217, label %218

; <label>:217                                     ; preds = %209
  call void @__asan_report_store8(i64 %211)
  call void asm sideeffect "", ""()
  unreachable

; <label>:218                                     ; preds = %209
  store %struct.node* %sigma_node154, %struct.node** %sibling_prev49, align 8
  br label %if.end50

if.end50:                                         ; preds = %if.end41.if.end50_crit_edge, %218
  %child51 = getelementptr inbounds %struct.node* %new_pred.0, i32 0, i32 2
  %219 = ptrtoint %struct.node** %child51 to i64
  %220 = lshr i64 %219, 3
  %221 = or i64 %220, 17592186044416
  %222 = inttoptr i64 %221 to i8*
  %223 = load i8* %222
  %224 = icmp ne i8 %223, 0
  br i1 %224, label %225, label %226

; <label>:225                                     ; preds = %if.end50
  call void @__asan_report_store8(i64 %219)
  call void asm sideeffect "", ""()
  unreachable

; <label>:226                                     ; preds = %if.end50
  store %struct.node* %sigma_node154, %struct.node** %child51, align 8
  %sibling_prev52 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 5
  %227 = ptrtoint %struct.node** %sibling_prev52 to i64
  %228 = lshr i64 %227, 3
  %229 = or i64 %228, 17592186044416
  %230 = inttoptr i64 %229 to i8*
  %231 = load i8* %230
  %232 = icmp ne i8 %231, 0
  br i1 %232, label %233, label %234

; <label>:233                                     ; preds = %226
  call void @__asan_report_store8(i64 %227)
  call void asm sideeffect "", ""()
  unreachable

; <label>:234                                     ; preds = %226
  store %struct.node* null, %struct.node** %sibling_prev52, align 8
  %orientation = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 1
  %235 = ptrtoint i32* %orientation to i64
  %236 = lshr i64 %235, 3
  %237 = or i64 %236, 17592186044416
  %238 = inttoptr i64 %237 to i8*
  %239 = load i8* %238
  %240 = icmp ne i8 %239, 0
  br i1 %240, label %241, label %247

; <label>:241                                     ; preds = %234
  %242 = and i64 %235, 7
  %243 = add i64 %242, 3
  %244 = trunc i64 %243 to i8
  %245 = icmp sge i8 %244, %239
  br i1 %245, label %246, label %247

; <label>:246                                     ; preds = %241
  call void @__asan_report_load4(i64 %235)
  call void asm sideeffect "", ""()
  unreachable

; <label>:247                                     ; preds = %241, %234
  %248 = load i32* %orientation, align 4
  %tobool53 = icmp ne i32 %248, 0
  %lnot = xor i1 %tobool53, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %cmp54 = icmp eq i64 %conv, %cycle_ori
  br i1 %cmp54, label %if.then56, label %if.else58

if.then56:                                        ; preds = %247
  %sigma_node169 = phi i64 [ %cycle_ori, %247 ]
  %sigma_node167 = phi i32 [ %lnot.ext, %247 ]
  %sigma_node165 = phi i64 [ %conv, %247 ]
  %flow = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 10
  %249 = ptrtoint i64* %flow to i64
  %250 = lshr i64 %249, 3
  %251 = or i64 %250, 17592186044416
  %252 = inttoptr i64 %251 to i8*
  %253 = load i8* %252
  %254 = icmp ne i8 %253, 0
  br i1 %254, label %255, label %256

; <label>:255                                     ; preds = %if.then56
  call void @__asan_report_load8(i64 %249)
  call void asm sideeffect "", ""()
  unreachable

; <label>:256                                     ; preds = %if.then56
  %257 = load i64* %flow, align 8
  %add57 = add nsw i64 %257, %delta
  br label %if.end61

if.else58:                                        ; preds = %247
  %sigma_node170 = phi i64 [ %cycle_ori, %247 ]
  %sigma_node168 = phi i32 [ %lnot.ext, %247 ]
  %sigma_node166 = phi i64 [ %conv, %247 ]
  %flow59 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 10
  %258 = ptrtoint i64* %flow59 to i64
  %259 = lshr i64 %258, 3
  %260 = or i64 %259, 17592186044416
  %261 = inttoptr i64 %260 to i8*
  %262 = load i8* %261
  %263 = icmp ne i8 %262, 0
  br i1 %263, label %264, label %265

; <label>:264                                     ; preds = %if.else58
  call void @__asan_report_load8(i64 %258)
  call void asm sideeffect "", ""()
  unreachable

; <label>:265                                     ; preds = %if.else58
  %266 = load i64* %flow59, align 8
  %sub60 = sub nsw i64 %266, %delta
  br label %if.end61

if.end61:                                         ; preds = %265, %256
  %flow_temp.0 = phi i64 [ %add57, %256 ], [ %sub60, %265 ]
  %basic_arc = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 6
  %267 = ptrtoint %struct.arc** %basic_arc to i64
  %268 = lshr i64 %267, 3
  %269 = or i64 %268, 17592186044416
  %270 = inttoptr i64 %269 to i8*
  %271 = load i8* %270
  %272 = icmp ne i8 %271, 0
  br i1 %272, label %273, label %274

; <label>:273                                     ; preds = %if.end61
  call void @__asan_report_load8(i64 %267)
  call void asm sideeffect "", ""()
  unreachable

; <label>:274                                     ; preds = %if.end61
  %275 = load %struct.arc** %basic_arc, align 8
  %depth62 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 11
  %276 = ptrtoint i64* %depth62 to i64
  %277 = lshr i64 %276, 3
  %278 = or i64 %277, 17592186044416
  %279 = inttoptr i64 %278 to i8*
  %280 = load i8* %279
  %281 = icmp ne i8 %280, 0
  br i1 %281, label %282, label %283

; <label>:282                                     ; preds = %274
  call void @__asan_report_load8(i64 %276)
  call void asm sideeffect "", ""()
  unreachable

; <label>:283                                     ; preds = %274
  %284 = load i64* %depth62, align 8
  %conv63 = trunc i64 %new_orientation.addr.0 to i32
  %orientation64 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 1
  %285 = ptrtoint i32* %orientation64 to i64
  %286 = lshr i64 %285, 3
  %287 = or i64 %286, 17592186044416
  %288 = inttoptr i64 %287 to i8*
  %289 = load i8* %288
  %290 = icmp ne i8 %289, 0
  br i1 %290, label %291, label %297

; <label>:291                                     ; preds = %283
  %292 = and i64 %285, 7
  %293 = add i64 %292, 3
  %294 = trunc i64 %293 to i8
  %295 = icmp sge i8 %294, %289
  br i1 %295, label %296, label %297

; <label>:296                                     ; preds = %291
  call void @__asan_report_store4(i64 %285)
  call void asm sideeffect "", ""()
  unreachable

; <label>:297                                     ; preds = %291, %283
  store i32 %conv63, i32* %orientation64, align 4
  %flow65 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 10
  %298 = ptrtoint i64* %flow65 to i64
  %299 = lshr i64 %298, 3
  %300 = or i64 %299, 17592186044416
  %301 = inttoptr i64 %300 to i8*
  %302 = load i8* %301
  %303 = icmp ne i8 %302, 0
  br i1 %303, label %304, label %305

; <label>:304                                     ; preds = %297
  call void @__asan_report_store8(i64 %298)
  call void asm sideeffect "", ""()
  unreachable

; <label>:305                                     ; preds = %297
  store i64 %new_flow.addr.0, i64* %flow65, align 8
  %basic_arc66 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 6
  %306 = ptrtoint %struct.arc** %basic_arc66 to i64
  %307 = lshr i64 %306, 3
  %308 = or i64 %307, 17592186044416
  %309 = inttoptr i64 %308 to i8*
  %310 = load i8* %309
  %311 = icmp ne i8 %310, 0
  br i1 %311, label %312, label %313

; <label>:312                                     ; preds = %305
  call void @__asan_report_store8(i64 %306)
  call void asm sideeffect "", ""()
  unreachable

; <label>:313                                     ; preds = %305
  store %struct.arc* %new_basic_arc.0, %struct.arc** %basic_arc66, align 8
  %depth67 = getelementptr inbounds %struct.node* %sigma_node154, i32 0, i32 11
  %314 = ptrtoint i64* %depth67 to i64
  %315 = lshr i64 %314, 3
  %316 = or i64 %315, 17592186044416
  %317 = inttoptr i64 %316 to i8*
  %318 = load i8* %317
  %319 = icmp ne i8 %318, 0
  br i1 %319, label %320, label %321

; <label>:320                                     ; preds = %313
  call void @__asan_report_store8(i64 %314)
  call void asm sideeffect "", ""()
  unreachable

; <label>:321                                     ; preds = %313
  store i64 %new_depth.0, i64* %depth67, align 8
  %sub68 = sub nsw i64 %80, %284
  %pred69 = getelementptr inbounds %struct.node* %father.2, i32 0, i32 3
  %322 = ptrtoint %struct.node** %pred69 to i64
  %323 = lshr i64 %322, 3
  %324 = or i64 %323, 17592186044416
  %325 = inttoptr i64 %324 to i8*
  %326 = load i8* %325
  %327 = icmp ne i8 %326, 0
  br i1 %327, label %328, label %329

; <label>:328                                     ; preds = %321
  call void @__asan_report_load8(i64 %322)
  call void asm sideeffect "", ""()
  unreachable

; <label>:329                                     ; preds = %321
  %330 = load %struct.node** %pred69, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %sigma_node158 = phi %struct.node* [ %phi_node157, %while.cond ]
  %sigma_node155 = phi %struct.node* [ %temp.1, %while.cond ]
  %cmp70 = icmp sgt i64 %delta, %feas_tol
  br i1 %cmp70, label %if.then72, label %if.else109

if.then72:                                        ; preds = %while.end
  %sigma_node173 = phi i64 [ %feas_tol, %while.end ]
  %sigma_node171 = phi i64 [ %delta, %while.end ]
  br label %for.cond

for.cond:                                         ; preds = %379, %if.then72
  %phi_node178 = phi %struct.node* [ %sigma_node177, %379 ], [ %w, %if.then72 ]
  %temp.2 = phi %struct.node* [ %sigma_node158, %if.then72 ], [ %380, %379 ]
  %cmp73 = icmp ne %struct.node* %temp.2, %phi_node178
  br i1 %cmp73, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node177 = phi %struct.node* [ %phi_node178, %for.cond ]
  %sigma_node175 = phi %struct.node* [ %temp.2, %for.cond ]
  %depth75 = getelementptr inbounds %struct.node* %sigma_node175, i32 0, i32 11
  %331 = ptrtoint i64* %depth75 to i64
  %332 = lshr i64 %331, 3
  %333 = or i64 %332, 17592186044416
  %334 = inttoptr i64 %333 to i8*
  %335 = load i8* %334
  %336 = icmp ne i8 %335, 0
  br i1 %336, label %337, label %338

; <label>:337                                     ; preds = %for.body
  call void @__asan_report_load8(i64 %331)
  call void asm sideeffect "", ""()
  unreachable

; <label>:338                                     ; preds = %for.body
  %339 = load i64* %depth75, align 8
  %sub76 = sub nsw i64 %339, %80
  store i64 %sub76, i64* %depth75, align 8
  %orientation77 = getelementptr inbounds %struct.node* %sigma_node175, i32 0, i32 1
  %340 = ptrtoint i32* %orientation77 to i64
  %341 = lshr i64 %340, 3
  %342 = or i64 %341, 17592186044416
  %343 = inttoptr i64 %342 to i8*
  %344 = load i8* %343
  %345 = icmp ne i8 %344, 0
  br i1 %345, label %346, label %352

; <label>:346                                     ; preds = %338
  %347 = and i64 %340, 7
  %348 = add i64 %347, 3
  %349 = trunc i64 %348 to i8
  %350 = icmp sge i8 %349, %344
  br i1 %350, label %351, label %352

; <label>:351                                     ; preds = %346
  call void @__asan_report_load4(i64 %340)
  call void asm sideeffect "", ""()
  unreachable

; <label>:352                                     ; preds = %346, %338
  %353 = load i32* %orientation77, align 4
  %conv78 = sext i32 %353 to i64
  %cmp79 = icmp ne i64 %conv78, %cycle_ori
  br i1 %cmp79, label %if.then81, label %if.else84

if.then81:                                        ; preds = %352
  %sigma_node184 = phi i64 [ %cycle_ori, %352 ]
  %sigma_node182 = phi i32 [ %353, %352 ]
  %sigma_node180 = phi i64 [ %conv78, %352 ]
  %flow82 = getelementptr inbounds %struct.node* %sigma_node175, i32 0, i32 10
  %354 = ptrtoint i64* %flow82 to i64
  %355 = lshr i64 %354, 3
  %356 = or i64 %355, 17592186044416
  %357 = inttoptr i64 %356 to i8*
  %358 = load i8* %357
  %359 = icmp ne i8 %358, 0
  br i1 %359, label %360, label %361

; <label>:360                                     ; preds = %if.then81
  call void @__asan_report_load8(i64 %354)
  call void asm sideeffect "", ""()
  unreachable

; <label>:361                                     ; preds = %if.then81
  %362 = load i64* %flow82, align 8
  %add83 = add nsw i64 %362, %sigma_node171
  store i64 %add83, i64* %flow82, align 8
  br label %if.end87

if.else84:                                        ; preds = %352
  %sigma_node185 = phi i64 [ %cycle_ori, %352 ]
  %sigma_node183 = phi i32 [ %353, %352 ]
  %sigma_node181 = phi i64 [ %conv78, %352 ]
  %flow85 = getelementptr inbounds %struct.node* %sigma_node175, i32 0, i32 10
  %363 = ptrtoint i64* %flow85 to i64
  %364 = lshr i64 %363, 3
  %365 = or i64 %364, 17592186044416
  %366 = inttoptr i64 %365 to i8*
  %367 = load i8* %366
  %368 = icmp ne i8 %367, 0
  br i1 %368, label %369, label %370

; <label>:369                                     ; preds = %if.else84
  call void @__asan_report_load8(i64 %363)
  call void asm sideeffect "", ""()
  unreachable

; <label>:370                                     ; preds = %if.else84
  %371 = load i64* %flow85, align 8
  %sub86 = sub nsw i64 %371, %sigma_node171
  store i64 %sub86, i64* %flow85, align 8
  br label %if.end87

if.end87:                                         ; preds = %370, %361
  br label %for.inc

for.inc:                                          ; preds = %if.end87
  %pred88 = getelementptr inbounds %struct.node* %sigma_node175, i32 0, i32 3
  %372 = ptrtoint %struct.node** %pred88 to i64
  %373 = lshr i64 %372, 3
  %374 = or i64 %373, 17592186044416
  %375 = inttoptr i64 %374 to i8*
  %376 = load i8* %375
  %377 = icmp ne i8 %376, 0
  br i1 %377, label %378, label %379

; <label>:378                                     ; preds = %for.inc
  call void @__asan_report_load8(i64 %372)
  call void asm sideeffect "", ""()
  unreachable

; <label>:379                                     ; preds = %for.inc
  %380 = load %struct.node** %pred88, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node179 = phi %struct.node* [ %phi_node178, %for.cond ]
  %sigma_node176 = phi %struct.node* [ %temp.2, %for.cond ]
  br label %for.cond89

for.cond89:                                       ; preds = %429, %for.end
  %phi_node189 = phi %struct.node* [ %sigma_node188, %429 ], [ %sigma_node179, %for.end ]
  %temp.3 = phi %struct.node* [ %jplus, %for.end ], [ %430, %429 ]
  %cmp90 = icmp ne %struct.node* %temp.3, %phi_node189
  br i1 %cmp90, label %for.body92, label %for.end108

for.body92:                                       ; preds = %for.cond89
  %sigma_node188 = phi %struct.node* [ %phi_node189, %for.cond89 ]
  %sigma_node186 = phi %struct.node* [ %temp.3, %for.cond89 ]
  %depth93 = getelementptr inbounds %struct.node* %sigma_node186, i32 0, i32 11
  %381 = ptrtoint i64* %depth93 to i64
  %382 = lshr i64 %381, 3
  %383 = or i64 %382, 17592186044416
  %384 = inttoptr i64 %383 to i8*
  %385 = load i8* %384
  %386 = icmp ne i8 %385, 0
  br i1 %386, label %387, label %388

; <label>:387                                     ; preds = %for.body92
  call void @__asan_report_load8(i64 %381)
  call void asm sideeffect "", ""()
  unreachable

; <label>:388                                     ; preds = %for.body92
  %389 = load i64* %depth93, align 8
  %add94 = add nsw i64 %389, %80
  store i64 %add94, i64* %depth93, align 8
  %orientation95 = getelementptr inbounds %struct.node* %sigma_node186, i32 0, i32 1
  %390 = ptrtoint i32* %orientation95 to i64
  %391 = lshr i64 %390, 3
  %392 = or i64 %391, 17592186044416
  %393 = inttoptr i64 %392 to i8*
  %394 = load i8* %393
  %395 = icmp ne i8 %394, 0
  br i1 %395, label %396, label %402

; <label>:396                                     ; preds = %388
  %397 = and i64 %390, 7
  %398 = add i64 %397, 3
  %399 = trunc i64 %398 to i8
  %400 = icmp sge i8 %399, %394
  br i1 %400, label %401, label %402

; <label>:401                                     ; preds = %396
  call void @__asan_report_load4(i64 %390)
  call void asm sideeffect "", ""()
  unreachable

; <label>:402                                     ; preds = %396, %388
  %403 = load i32* %orientation95, align 4
  %conv96 = sext i32 %403 to i64
  %cmp97 = icmp eq i64 %conv96, %cycle_ori
  br i1 %cmp97, label %if.then99, label %if.else102

if.then99:                                        ; preds = %402
  %sigma_node195 = phi i64 [ %cycle_ori, %402 ]
  %sigma_node193 = phi i32 [ %403, %402 ]
  %sigma_node191 = phi i64 [ %conv96, %402 ]
  %flow100 = getelementptr inbounds %struct.node* %sigma_node186, i32 0, i32 10
  %404 = ptrtoint i64* %flow100 to i64
  %405 = lshr i64 %404, 3
  %406 = or i64 %405, 17592186044416
  %407 = inttoptr i64 %406 to i8*
  %408 = load i8* %407
  %409 = icmp ne i8 %408, 0
  br i1 %409, label %410, label %411

; <label>:410                                     ; preds = %if.then99
  call void @__asan_report_load8(i64 %404)
  call void asm sideeffect "", ""()
  unreachable

; <label>:411                                     ; preds = %if.then99
  %412 = load i64* %flow100, align 8
  %add101 = add nsw i64 %412, %sigma_node171
  store i64 %add101, i64* %flow100, align 8
  br label %if.end105

if.else102:                                       ; preds = %402
  %sigma_node196 = phi i64 [ %cycle_ori, %402 ]
  %sigma_node194 = phi i32 [ %403, %402 ]
  %sigma_node192 = phi i64 [ %conv96, %402 ]
  %flow103 = getelementptr inbounds %struct.node* %sigma_node186, i32 0, i32 10
  %413 = ptrtoint i64* %flow103 to i64
  %414 = lshr i64 %413, 3
  %415 = or i64 %414, 17592186044416
  %416 = inttoptr i64 %415 to i8*
  %417 = load i8* %416
  %418 = icmp ne i8 %417, 0
  br i1 %418, label %419, label %420

; <label>:419                                     ; preds = %if.else102
  call void @__asan_report_load8(i64 %413)
  call void asm sideeffect "", ""()
  unreachable

; <label>:420                                     ; preds = %if.else102
  %421 = load i64* %flow103, align 8
  %sub104 = sub nsw i64 %421, %sigma_node171
  store i64 %sub104, i64* %flow103, align 8
  br label %if.end105

if.end105:                                        ; preds = %420, %411
  br label %for.inc106

for.inc106:                                       ; preds = %if.end105
  %pred107 = getelementptr inbounds %struct.node* %sigma_node186, i32 0, i32 3
  %422 = ptrtoint %struct.node** %pred107 to i64
  %423 = lshr i64 %422, 3
  %424 = or i64 %423, 17592186044416
  %425 = inttoptr i64 %424 to i8*
  %426 = load i8* %425
  %427 = icmp ne i8 %426, 0
  br i1 %427, label %428, label %429

; <label>:428                                     ; preds = %for.inc106
  call void @__asan_report_load8(i64 %422)
  call void asm sideeffect "", ""()
  unreachable

; <label>:429                                     ; preds = %for.inc106
  %430 = load %struct.node** %pred107, align 8
  br label %for.cond89

for.end108:                                       ; preds = %for.cond89
  %sigma_node190 = phi %struct.node* [ %phi_node189, %for.cond89 ]
  %sigma_node187 = phi %struct.node* [ %temp.3, %for.cond89 ]
  br label %if.end128

if.else109:                                       ; preds = %while.end
  %sigma_node174 = phi i64 [ %feas_tol, %while.end ]
  %sigma_node172 = phi i64 [ %delta, %while.end ]
  br label %for.cond110

for.cond110:                                      ; preds = %447, %if.else109
  %phi_node200 = phi %struct.node* [ %sigma_node199, %447 ], [ %w, %if.else109 ]
  %temp.4 = phi %struct.node* [ %sigma_node158, %if.else109 ], [ %448, %447 ]
  %cmp111 = icmp ne %struct.node* %temp.4, %phi_node200
  br i1 %cmp111, label %for.body113, label %for.end118

for.body113:                                      ; preds = %for.cond110
  %sigma_node199 = phi %struct.node* [ %phi_node200, %for.cond110 ]
  %sigma_node197 = phi %struct.node* [ %temp.4, %for.cond110 ]
  %depth114 = getelementptr inbounds %struct.node* %sigma_node197, i32 0, i32 11
  %431 = ptrtoint i64* %depth114 to i64
  %432 = lshr i64 %431, 3
  %433 = or i64 %432, 17592186044416
  %434 = inttoptr i64 %433 to i8*
  %435 = load i8* %434
  %436 = icmp ne i8 %435, 0
  br i1 %436, label %437, label %438

; <label>:437                                     ; preds = %for.body113
  call void @__asan_report_load8(i64 %431)
  call void asm sideeffect "", ""()
  unreachable

; <label>:438                                     ; preds = %for.body113
  %439 = load i64* %depth114, align 8
  %sub115 = sub nsw i64 %439, %80
  store i64 %sub115, i64* %depth114, align 8
  br label %for.inc116

for.inc116:                                       ; preds = %438
  %pred117 = getelementptr inbounds %struct.node* %sigma_node197, i32 0, i32 3
  %440 = ptrtoint %struct.node** %pred117 to i64
  %441 = lshr i64 %440, 3
  %442 = or i64 %441, 17592186044416
  %443 = inttoptr i64 %442 to i8*
  %444 = load i8* %443
  %445 = icmp ne i8 %444, 0
  br i1 %445, label %446, label %447

; <label>:446                                     ; preds = %for.inc116
  call void @__asan_report_load8(i64 %440)
  call void asm sideeffect "", ""()
  unreachable

; <label>:447                                     ; preds = %for.inc116
  %448 = load %struct.node** %pred117, align 8
  br label %for.cond110

for.end118:                                       ; preds = %for.cond110
  %sigma_node201 = phi %struct.node* [ %phi_node200, %for.cond110 ]
  %sigma_node198 = phi %struct.node* [ %temp.4, %for.cond110 ]
  br label %for.cond119

for.cond119:                                      ; preds = %465, %for.end118
  %phi_node205 = phi %struct.node* [ %sigma_node204, %465 ], [ %sigma_node201, %for.end118 ]
  %temp.5 = phi %struct.node* [ %jplus, %for.end118 ], [ %466, %465 ]
  %cmp120 = icmp ne %struct.node* %temp.5, %phi_node205
  br i1 %cmp120, label %for.body122, label %for.end127

for.body122:                                      ; preds = %for.cond119
  %sigma_node204 = phi %struct.node* [ %phi_node205, %for.cond119 ]
  %sigma_node202 = phi %struct.node* [ %temp.5, %for.cond119 ]
  %depth123 = getelementptr inbounds %struct.node* %sigma_node202, i32 0, i32 11
  %449 = ptrtoint i64* %depth123 to i64
  %450 = lshr i64 %449, 3
  %451 = or i64 %450, 17592186044416
  %452 = inttoptr i64 %451 to i8*
  %453 = load i8* %452
  %454 = icmp ne i8 %453, 0
  br i1 %454, label %455, label %456

; <label>:455                                     ; preds = %for.body122
  call void @__asan_report_load8(i64 %449)
  call void asm sideeffect "", ""()
  unreachable

; <label>:456                                     ; preds = %for.body122
  %457 = load i64* %depth123, align 8
  %add124 = add nsw i64 %457, %80
  store i64 %add124, i64* %depth123, align 8
  br label %for.inc125

for.inc125:                                       ; preds = %456
  %pred126 = getelementptr inbounds %struct.node* %sigma_node202, i32 0, i32 3
  %458 = ptrtoint %struct.node** %pred126 to i64
  %459 = lshr i64 %458, 3
  %460 = or i64 %459, 17592186044416
  %461 = inttoptr i64 %460 to i8*
  %462 = load i8* %461
  %463 = icmp ne i8 %462, 0
  br i1 %463, label %464, label %465

; <label>:464                                     ; preds = %for.inc125
  call void @__asan_report_load8(i64 %458)
  call void asm sideeffect "", ""()
  unreachable

; <label>:465                                     ; preds = %for.inc125
  %466 = load %struct.node** %pred126, align 8
  br label %for.cond119

for.end127:                                       ; preds = %for.cond119
  %sigma_node206 = phi %struct.node* [ %phi_node205, %for.cond119 ]
  %sigma_node203 = phi %struct.node* [ %temp.5, %for.cond119 ]
  br label %if.end128

if.end128:                                        ; preds = %for.end127, %for.end108
  ret void
}

define internal void @asan.module_ctor() {
  call void @__asan_init()
  %1 = load volatile i64* @__asan_mapping_offset
  %2 = load volatile i64* @__asan_mapping_scale
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
