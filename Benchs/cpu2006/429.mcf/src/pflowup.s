; ModuleID = 'pflowup.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }

@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]

define void @primal_update_flow(%struct.node* %iplus, %struct.node* %jplus, %struct.node* %w) address_safety nounwind {
entry:
  br label %for.cond

for.cond:                                         ; preds = %37, %entry
  %phi_node = phi %struct.node* [ %sigma_node16, %37 ], [ %w, %entry ]
  %iplus.addr.0 = phi %struct.node* [ %iplus, %entry ], [ %38, %37 ]
  %cmp = icmp ne %struct.node* %iplus.addr.0, %phi_node
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node16 = phi %struct.node* [ %phi_node, %for.cond ]
  %sigma_node = phi %struct.node* [ %iplus.addr.0, %for.cond ]
  %orientation = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 1
  %0 = ptrtoint i32* %orientation to i64
  %1 = lshr i64 %0, 3
  %2 = or i64 %1, 17592186044416
  %3 = inttoptr i64 %2 to i8*
  %4 = load i8* %3
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %for.body
  %7 = and i64 %0, 7
  %8 = add i64 %7, 3
  %9 = trunc i64 %8 to i8
  %10 = icmp sge i8 %9, %4
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %6
  call void @__asan_report_load4(i64 %0)
  call void asm sideeffect "", ""()
  unreachable

; <label>:12                                      ; preds = %6, %for.body
  %13 = load i32* %orientation, align 4
  %tobool = icmp ne i32 %13, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %12
  %sigma_node18 = phi i32 [ %13, %12 ]
  %flow = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 10
  %14 = ptrtoint i64* %flow to i64
  %15 = lshr i64 %14, 3
  %16 = or i64 %15, 17592186044416
  %17 = inttoptr i64 %16 to i8*
  %18 = load i8* %17
  %19 = icmp ne i8 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %if.then
  call void @__asan_report_store8(i64 %14)
  call void asm sideeffect "", ""()
  unreachable

; <label>:21                                      ; preds = %if.then
  store i64 0, i64* %flow, align 8
  br label %if.end

if.else:                                          ; preds = %12
  %sigma_node19 = phi i32 [ %13, %12 ]
  %flow1 = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 10
  %22 = ptrtoint i64* %flow1 to i64
  %23 = lshr i64 %22, 3
  %24 = or i64 %23, 17592186044416
  %25 = inttoptr i64 %24 to i8*
  %26 = load i8* %25
  %27 = icmp ne i8 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %if.else
  call void @__asan_report_store8(i64 %22)
  call void asm sideeffect "", ""()
  unreachable

; <label>:29                                      ; preds = %if.else
  store i64 1, i64* %flow1, align 8
  br label %if.end

if.end:                                           ; preds = %29, %21
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %pred = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 3
  %30 = ptrtoint %struct.node** %pred to i64
  %31 = lshr i64 %30, 3
  %32 = or i64 %31, 17592186044416
  %33 = inttoptr i64 %32 to i8*
  %34 = load i8* %33
  %35 = icmp ne i8 %34, 0
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %for.inc
  call void @__asan_report_load8(i64 %30)
  call void asm sideeffect "", ""()
  unreachable

; <label>:37                                      ; preds = %for.inc
  %38 = load %struct.node** %pred, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node17 = phi %struct.node* [ %phi_node, %for.cond ]
  %sigma_node15 = phi %struct.node* [ %iplus.addr.0, %for.cond ]
  br label %for.cond2

for.cond2:                                        ; preds = %76, %for.end
  %phi_node23 = phi %struct.node* [ %sigma_node22, %76 ], [ %sigma_node17, %for.end ]
  %jplus.addr.0 = phi %struct.node* [ %jplus, %for.end ], [ %77, %76 ]
  %cmp3 = icmp ne %struct.node* %jplus.addr.0, %phi_node23
  br i1 %cmp3, label %for.body4, label %for.end14

for.body4:                                        ; preds = %for.cond2
  %sigma_node22 = phi %struct.node* [ %phi_node23, %for.cond2 ]
  %sigma_node20 = phi %struct.node* [ %jplus.addr.0, %for.cond2 ]
  %orientation5 = getelementptr inbounds %struct.node* %sigma_node20, i32 0, i32 1
  %39 = ptrtoint i32* %orientation5 to i64
  %40 = lshr i64 %39, 3
  %41 = or i64 %40, 17592186044416
  %42 = inttoptr i64 %41 to i8*
  %43 = load i8* %42
  %44 = icmp ne i8 %43, 0
  br i1 %44, label %45, label %51

; <label>:45                                      ; preds = %for.body4
  %46 = and i64 %39, 7
  %47 = add i64 %46, 3
  %48 = trunc i64 %47 to i8
  %49 = icmp sge i8 %48, %43
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %45
  call void @__asan_report_load4(i64 %39)
  call void asm sideeffect "", ""()
  unreachable

; <label>:51                                      ; preds = %45, %for.body4
  %52 = load i32* %orientation5, align 4
  %tobool6 = icmp ne i32 %52, 0
  br i1 %tobool6, label %if.then7, label %if.else9

if.then7:                                         ; preds = %51
  %sigma_node25 = phi i32 [ %52, %51 ]
  %flow8 = getelementptr inbounds %struct.node* %sigma_node20, i32 0, i32 10
  %53 = ptrtoint i64* %flow8 to i64
  %54 = lshr i64 %53, 3
  %55 = or i64 %54, 17592186044416
  %56 = inttoptr i64 %55 to i8*
  %57 = load i8* %56
  %58 = icmp ne i8 %57, 0
  br i1 %58, label %59, label %60

; <label>:59                                      ; preds = %if.then7
  call void @__asan_report_store8(i64 %53)
  call void asm sideeffect "", ""()
  unreachable

; <label>:60                                      ; preds = %if.then7
  store i64 1, i64* %flow8, align 8
  br label %if.end11

if.else9:                                         ; preds = %51
  %sigma_node26 = phi i32 [ %52, %51 ]
  %flow10 = getelementptr inbounds %struct.node* %sigma_node20, i32 0, i32 10
  %61 = ptrtoint i64* %flow10 to i64
  %62 = lshr i64 %61, 3
  %63 = or i64 %62, 17592186044416
  %64 = inttoptr i64 %63 to i8*
  %65 = load i8* %64
  %66 = icmp ne i8 %65, 0
  br i1 %66, label %67, label %68

; <label>:67                                      ; preds = %if.else9
  call void @__asan_report_store8(i64 %61)
  call void asm sideeffect "", ""()
  unreachable

; <label>:68                                      ; preds = %if.else9
  store i64 0, i64* %flow10, align 8
  br label %if.end11

if.end11:                                         ; preds = %68, %60
  br label %for.inc12

for.inc12:                                        ; preds = %if.end11
  %pred13 = getelementptr inbounds %struct.node* %sigma_node20, i32 0, i32 3
  %69 = ptrtoint %struct.node** %pred13 to i64
  %70 = lshr i64 %69, 3
  %71 = or i64 %70, 17592186044416
  %72 = inttoptr i64 %71 to i8*
  %73 = load i8* %72
  %74 = icmp ne i8 %73, 0
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %for.inc12
  call void @__asan_report_load8(i64 %69)
  call void asm sideeffect "", ""()
  unreachable

; <label>:76                                      ; preds = %for.inc12
  %77 = load %struct.node** %pred13, align 8
  br label %for.cond2

for.end14:                                        ; preds = %for.cond2
  %sigma_node24 = phi %struct.node* [ %phi_node23, %for.cond2 ]
  %sigma_node21 = phi %struct.node* [ %jplus.addr.0, %for.cond2 ]
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
