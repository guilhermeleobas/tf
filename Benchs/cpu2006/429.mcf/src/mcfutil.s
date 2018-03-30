; ModuleID = 'mcfutil.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.network = type { [200 x i8], [200 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double, i64, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i64 }
%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }

@.str = private unnamed_addr constant { [25 x i8], [39 x i8] } { [25 x i8] c"PRIMAL NETWORK SIMPLEX: \00", [39 x i8] zeroinitializer }, align 32
@.str1 = private unnamed_addr constant { [49 x i8], [47 x i8] } { [49 x i8] c"artificial arc with nonzero flow, node %d (%ld)\0A\00", [47 x i8] zeroinitializer }, align 32
@.str2 = private unnamed_addr constant { [31 x i8], [33 x i8] } { [31 x i8] c"basis primal infeasible (%ld)\0A\00", [33 x i8] zeroinitializer }, align 32
@stderr = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant { [23 x i8], [41 x i8] } { [23 x i8] c"DUAL NETWORK SIMPLEX: \00", [41 x i8] zeroinitializer }, align 32
@.str4 = private unnamed_addr constant { [23 x i8], [41 x i8] } { [23 x i8] c"basis dual infeasible\0A\00", [41 x i8] zeroinitializer }, align 32
@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]
@__asan_gen_ = private constant [17 x i8] c".str (mcfutil.c)\00"
@__asan_gen_5 = private constant [18 x i8] c".str1 (mcfutil.c)\00"
@__asan_gen_6 = private constant [18 x i8] c".str2 (mcfutil.c)\00"
@__asan_gen_7 = private constant [18 x i8] c".str3 (mcfutil.c)\00"
@__asan_gen_8 = private constant [18 x i8] c".str4 (mcfutil.c)\00"
@0 = private global [5 x { i64, i64, i64, i64, i64 }] [{ i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [25 x i8], [39 x i8] }* @.str to i64), i64 25, i64 64, i64 ptrtoint ([17 x i8]* @__asan_gen_ to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [49 x i8], [47 x i8] }* @.str1 to i64), i64 49, i64 96, i64 ptrtoint ([18 x i8]* @__asan_gen_5 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [31 x i8], [33 x i8] }* @.str2 to i64), i64 31, i64 64, i64 ptrtoint ([18 x i8]* @__asan_gen_6 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [23 x i8], [41 x i8] }* @.str3 to i64), i64 23, i64 64, i64 ptrtoint ([18 x i8]* @__asan_gen_7 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [23 x i8], [41 x i8] }* @.str4 to i64), i64 23, i64 64, i64 ptrtoint ([18 x i8]* @__asan_gen_8 to i64), i64 0 }]
@llvm.global_dtors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_dtor }]

define void @refresh_neighbour_lists(%struct.network* %net) address_safety nounwind {
entry:
  %nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %0 = ptrtoint %struct.node** %nodes to i64
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
  %8 = load %struct.node** %nodes, align 8
  %stop_nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 22
  %9 = ptrtoint %struct.node** %stop_nodes to i64
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
  %17 = load %struct.node** %stop_nodes, align 8
  %18 = bitcast %struct.node* %17 to i8*
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %16
  %phi_node = phi i8* [ %sigma_node16, %for.inc ], [ %18, %16 ]
  %node.0 = phi %struct.node* [ %8, %16 ], [ %incdec.ptr, %for.inc ]
  %19 = bitcast i8* %phi_node to %struct.node*
  %cmp = icmp ult %struct.node* %node.0, %19
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node16 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node14 = phi %struct.node* [ %19, %for.cond ]
  %sigma_node = phi %struct.node* [ %node.0, %for.cond ]
  %firstin = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 8
  %20 = ptrtoint %struct.arc** %firstin to i64
  %21 = lshr i64 %20, 3
  %22 = or i64 %21, 17592186044416
  %23 = inttoptr i64 %22 to i8*
  %24 = load i8* %23
  %25 = icmp ne i8 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %for.body
  call void @__asan_report_store8(i64 %20)
  call void asm sideeffect "", ""()
  unreachable

; <label>:27                                      ; preds = %for.body
  store %struct.arc* null, %struct.arc** %firstin, align 8
  %firstout = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 7
  %28 = ptrtoint %struct.arc** %firstout to i64
  %29 = lshr i64 %28, 3
  %30 = or i64 %29, 17592186044416
  %31 = inttoptr i64 %30 to i8*
  %32 = load i8* %31
  %33 = icmp ne i8 %32, 0
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %27
  call void @__asan_report_store8(i64 %28)
  call void asm sideeffect "", ""()
  unreachable

; <label>:35                                      ; preds = %27
  store %struct.arc* null, %struct.arc** %firstout, align 8
  br label %for.inc

for.inc:                                          ; preds = %35
  %incdec.ptr = getelementptr inbounds %struct.node* %sigma_node, i32 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node17 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node15 = phi %struct.node* [ %19, %for.cond ]
  %sigma_node13 = phi %struct.node* [ %node.0, %for.cond ]
  %arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %36 = ptrtoint %struct.arc** %arcs to i64
  %37 = lshr i64 %36, 3
  %38 = or i64 %37, 17592186044416
  %39 = inttoptr i64 %38 to i8*
  %40 = load i8* %39
  %41 = icmp ne i8 %40, 0
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %for.end
  call void @__asan_report_load8(i64 %36)
  call void asm sideeffect "", ""()
  unreachable

; <label>:43                                      ; preds = %for.end
  %44 = load %struct.arc** %arcs, align 8
  %stop_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %45 = ptrtoint %struct.arc** %stop_arcs to i64
  %46 = lshr i64 %45, 3
  %47 = or i64 %46, 17592186044416
  %48 = inttoptr i64 %47 to i8*
  %49 = load i8* %48
  %50 = icmp ne i8 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %43
  call void @__asan_report_load8(i64 %45)
  call void asm sideeffect "", ""()
  unreachable

; <label>:52                                      ; preds = %43
  %53 = load %struct.arc** %stop_arcs, align 8
  %54 = bitcast %struct.arc* %53 to i8*
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc10, %52
  %phi_node23 = phi i8* [ %sigma_node22, %for.inc10 ], [ %54, %52 ]
  %arc.0 = phi %struct.arc* [ %44, %52 ], [ %incdec.ptr11, %for.inc10 ]
  %55 = bitcast i8* %phi_node23 to %struct.arc*
  %cmp2 = icmp ult %struct.arc* %arc.0, %55
  br i1 %cmp2, label %for.body3, label %for.end12

for.body3:                                        ; preds = %for.cond1
  %sigma_node22 = phi i8* [ %phi_node23, %for.cond1 ]
  %sigma_node20 = phi %struct.arc* [ %55, %for.cond1 ]
  %sigma_node18 = phi %struct.arc* [ %arc.0, %for.cond1 ]
  %tail = getelementptr inbounds %struct.arc* %sigma_node18, i32 0, i32 1
  %56 = ptrtoint %struct.node** %tail to i64
  %57 = lshr i64 %56, 3
  %58 = or i64 %57, 17592186044416
  %59 = inttoptr i64 %58 to i8*
  %60 = load i8* %59
  %61 = icmp ne i8 %60, 0
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %for.body3
  call void @__asan_report_load8(i64 %56)
  call void asm sideeffect "", ""()
  unreachable

; <label>:63                                      ; preds = %for.body3
  %64 = load %struct.node** %tail, align 8
  %firstout4 = getelementptr inbounds %struct.node* %64, i32 0, i32 7
  %65 = ptrtoint %struct.arc** %firstout4 to i64
  %66 = lshr i64 %65, 3
  %67 = or i64 %66, 17592186044416
  %68 = inttoptr i64 %67 to i8*
  %69 = load i8* %68
  %70 = icmp ne i8 %69, 0
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %63
  call void @__asan_report_load8(i64 %65)
  call void asm sideeffect "", ""()
  unreachable

; <label>:72                                      ; preds = %63
  %73 = load %struct.arc** %firstout4, align 8
  %nextout = getelementptr inbounds %struct.arc* %sigma_node18, i32 0, i32 4
  %74 = ptrtoint %struct.arc** %nextout to i64
  %75 = lshr i64 %74, 3
  %76 = or i64 %75, 17592186044416
  %77 = inttoptr i64 %76 to i8*
  %78 = load i8* %77
  %79 = icmp ne i8 %78, 0
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %72
  call void @__asan_report_store8(i64 %74)
  call void asm sideeffect "", ""()
  unreachable

; <label>:81                                      ; preds = %72
  store %struct.arc* %73, %struct.arc** %nextout, align 8
  %tail5 = getelementptr inbounds %struct.arc* %sigma_node18, i32 0, i32 1
  %82 = ptrtoint %struct.node** %tail5 to i64
  %83 = lshr i64 %82, 3
  %84 = or i64 %83, 17592186044416
  %85 = inttoptr i64 %84 to i8*
  %86 = load i8* %85
  %87 = icmp ne i8 %86, 0
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %81
  call void @__asan_report_load8(i64 %82)
  call void asm sideeffect "", ""()
  unreachable

; <label>:89                                      ; preds = %81
  %90 = load %struct.node** %tail5, align 8
  %firstout6 = getelementptr inbounds %struct.node* %90, i32 0, i32 7
  %91 = ptrtoint %struct.arc** %firstout6 to i64
  %92 = lshr i64 %91, 3
  %93 = or i64 %92, 17592186044416
  %94 = inttoptr i64 %93 to i8*
  %95 = load i8* %94
  %96 = icmp ne i8 %95, 0
  br i1 %96, label %97, label %98

; <label>:97                                      ; preds = %89
  call void @__asan_report_store8(i64 %91)
  call void asm sideeffect "", ""()
  unreachable

; <label>:98                                      ; preds = %89
  store %struct.arc* %sigma_node18, %struct.arc** %firstout6, align 8
  %head = getelementptr inbounds %struct.arc* %sigma_node18, i32 0, i32 2
  %99 = ptrtoint %struct.node** %head to i64
  %100 = lshr i64 %99, 3
  %101 = or i64 %100, 17592186044416
  %102 = inttoptr i64 %101 to i8*
  %103 = load i8* %102
  %104 = icmp ne i8 %103, 0
  br i1 %104, label %105, label %106

; <label>:105                                     ; preds = %98
  call void @__asan_report_load8(i64 %99)
  call void asm sideeffect "", ""()
  unreachable

; <label>:106                                     ; preds = %98
  %107 = load %struct.node** %head, align 8
  %firstin7 = getelementptr inbounds %struct.node* %107, i32 0, i32 8
  %108 = ptrtoint %struct.arc** %firstin7 to i64
  %109 = lshr i64 %108, 3
  %110 = or i64 %109, 17592186044416
  %111 = inttoptr i64 %110 to i8*
  %112 = load i8* %111
  %113 = icmp ne i8 %112, 0
  br i1 %113, label %114, label %115

; <label>:114                                     ; preds = %106
  call void @__asan_report_load8(i64 %108)
  call void asm sideeffect "", ""()
  unreachable

; <label>:115                                     ; preds = %106
  %116 = load %struct.arc** %firstin7, align 8
  %nextin = getelementptr inbounds %struct.arc* %sigma_node18, i32 0, i32 5
  %117 = ptrtoint %struct.arc** %nextin to i64
  %118 = lshr i64 %117, 3
  %119 = or i64 %118, 17592186044416
  %120 = inttoptr i64 %119 to i8*
  %121 = load i8* %120
  %122 = icmp ne i8 %121, 0
  br i1 %122, label %123, label %124

; <label>:123                                     ; preds = %115
  call void @__asan_report_store8(i64 %117)
  call void asm sideeffect "", ""()
  unreachable

; <label>:124                                     ; preds = %115
  store %struct.arc* %116, %struct.arc** %nextin, align 8
  %head8 = getelementptr inbounds %struct.arc* %sigma_node18, i32 0, i32 2
  %125 = ptrtoint %struct.node** %head8 to i64
  %126 = lshr i64 %125, 3
  %127 = or i64 %126, 17592186044416
  %128 = inttoptr i64 %127 to i8*
  %129 = load i8* %128
  %130 = icmp ne i8 %129, 0
  br i1 %130, label %131, label %132

; <label>:131                                     ; preds = %124
  call void @__asan_report_load8(i64 %125)
  call void asm sideeffect "", ""()
  unreachable

; <label>:132                                     ; preds = %124
  %133 = load %struct.node** %head8, align 8
  %firstin9 = getelementptr inbounds %struct.node* %133, i32 0, i32 8
  %134 = ptrtoint %struct.arc** %firstin9 to i64
  %135 = lshr i64 %134, 3
  %136 = or i64 %135, 17592186044416
  %137 = inttoptr i64 %136 to i8*
  %138 = load i8* %137
  %139 = icmp ne i8 %138, 0
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %132
  call void @__asan_report_store8(i64 %134)
  call void asm sideeffect "", ""()
  unreachable

; <label>:141                                     ; preds = %132
  store %struct.arc* %sigma_node18, %struct.arc** %firstin9, align 8
  br label %for.inc10

for.inc10:                                        ; preds = %141
  %incdec.ptr11 = getelementptr inbounds %struct.arc* %sigma_node18, i32 1
  br label %for.cond1

for.end12:                                        ; preds = %for.cond1
  %sigma_node24 = phi i8* [ %phi_node23, %for.cond1 ]
  %sigma_node21 = phi %struct.arc* [ %55, %for.cond1 ]
  %sigma_node19 = phi %struct.arc* [ %arc.0, %for.cond1 ]
  ret void
}

define i64 @refresh_potential(%struct.network* %net) address_safety nounwind {
entry:
  %nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %0 = ptrtoint %struct.node** %nodes to i64
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
  %8 = load %struct.node** %nodes, align 8
  %potential = getelementptr inbounds %struct.node* %8, i32 0, i32 0
  %9 = ptrtoint i64* %potential to i64
  %10 = lshr i64 %9, 3
  %11 = or i64 %10, 17592186044416
  %12 = inttoptr i64 %11 to i8*
  %13 = load i8* %12
  %14 = icmp ne i8 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %7
  call void @__asan_report_store8(i64 %9)
  call void asm sideeffect "", ""()
  unreachable

; <label>:16                                      ; preds = %7
  store i64 -100000000, i64* %potential, align 8
  %child = getelementptr inbounds %struct.node* %8, i32 0, i32 2
  %17 = ptrtoint %struct.node** %child to i64
  %18 = lshr i64 %17, 3
  %19 = or i64 %18, 17592186044416
  %20 = inttoptr i64 %19 to i8*
  %21 = load i8* %20
  %22 = icmp ne i8 %21, 0
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %16
  call void @__asan_report_load8(i64 %17)
  call void asm sideeffect "", ""()
  unreachable

; <label>:24                                      ; preds = %16
  %25 = load %struct.node** %child, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.end23, %24
  %phi_node = phi %struct.node* [ %sigma_node26, %while.end23 ], [ %8, %24 ]
  %tmp.0 = phi %struct.node* [ %25, %24 ], [ %tmp.3, %while.end23 ]
  %node.0 = phi %struct.node* [ %25, %24 ], [ %node.3, %while.end23 ]
  %checksum.0 = phi i64 [ 0, %24 ], [ %checksum.1, %while.end23 ]
  %cmp = icmp ne %struct.node* %node.0, %phi_node
  br i1 %cmp, label %while.body, label %while.end24

while.body:                                       ; preds = %while.cond
  %sigma_node26 = phi %struct.node* [ %phi_node, %while.cond ]
  %sigma_node = phi %struct.node* [ %node.0, %while.cond ]
  br label %while.cond3

while.cond3:                                      ; preds = %135, %while.body
  %tmp.1 = phi %struct.node* [ %tmp.0, %while.body ], [ %sigma_node28, %135 ]
  %node.1 = phi %struct.node* [ %sigma_node, %while.body ], [ %136, %135 ]
  %checksum.1 = phi i64 [ %checksum.0, %while.body ], [ %checksum.2, %135 ]
  %tobool = icmp ne %struct.node* %node.1, null
  br i1 %tobool, label %while.body4, label %while.end

while.body4:                                      ; preds = %while.cond3
  %sigma_node28 = phi %struct.node* [ %node.1, %while.cond3 ]
  %orientation = getelementptr inbounds %struct.node* %sigma_node28, i32 0, i32 1
  %26 = ptrtoint i32* %orientation to i64
  %27 = lshr i64 %26, 3
  %28 = or i64 %27, 17592186044416
  %29 = inttoptr i64 %28 to i8*
  %30 = load i8* %29
  %31 = icmp ne i8 %30, 0
  br i1 %31, label %32, label %38

; <label>:32                                      ; preds = %while.body4
  %33 = and i64 %26, 7
  %34 = add i64 %33, 3
  %35 = trunc i64 %34 to i8
  %36 = icmp sge i8 %35, %30
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %32
  call void @__asan_report_load4(i64 %26)
  call void asm sideeffect "", ""()
  unreachable

; <label>:38                                      ; preds = %32, %while.body4
  %39 = load i32* %orientation, align 4
  %cmp5 = icmp eq i32 %39, 1
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %38
  %sigma_node30 = phi i32 [ %39, %38 ]
  %basic_arc = getelementptr inbounds %struct.node* %sigma_node28, i32 0, i32 6
  %40 = ptrtoint %struct.arc** %basic_arc to i64
  %41 = lshr i64 %40, 3
  %42 = or i64 %41, 17592186044416
  %43 = inttoptr i64 %42 to i8*
  %44 = load i8* %43
  %45 = icmp ne i8 %44, 0
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %if.then
  call void @__asan_report_load8(i64 %40)
  call void asm sideeffect "", ""()
  unreachable

; <label>:47                                      ; preds = %if.then
  %48 = load %struct.arc** %basic_arc, align 8
  %cost = getelementptr inbounds %struct.arc* %48, i32 0, i32 0
  %49 = ptrtoint i64* %cost to i64
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
  %57 = load i64* %cost, align 8
  %pred = getelementptr inbounds %struct.node* %sigma_node28, i32 0, i32 3
  %58 = ptrtoint %struct.node** %pred to i64
  %59 = lshr i64 %58, 3
  %60 = or i64 %59, 17592186044416
  %61 = inttoptr i64 %60 to i8*
  %62 = load i8* %61
  %63 = icmp ne i8 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %56
  call void @__asan_report_load8(i64 %58)
  call void asm sideeffect "", ""()
  unreachable

; <label>:65                                      ; preds = %56
  %66 = load %struct.node** %pred, align 8
  %potential6 = getelementptr inbounds %struct.node* %66, i32 0, i32 0
  %67 = ptrtoint i64* %potential6 to i64
  %68 = lshr i64 %67, 3
  %69 = or i64 %68, 17592186044416
  %70 = inttoptr i64 %69 to i8*
  %71 = load i8* %70
  %72 = icmp ne i8 %71, 0
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %65
  call void @__asan_report_load8(i64 %67)
  call void asm sideeffect "", ""()
  unreachable

; <label>:74                                      ; preds = %65
  %75 = load i64* %potential6, align 8
  %add = add nsw i64 %57, %75
  %potential7 = getelementptr inbounds %struct.node* %sigma_node28, i32 0, i32 0
  %76 = ptrtoint i64* %potential7 to i64
  %77 = lshr i64 %76, 3
  %78 = or i64 %77, 17592186044416
  %79 = inttoptr i64 %78 to i8*
  %80 = load i8* %79
  %81 = icmp ne i8 %80, 0
  br i1 %81, label %82, label %83

; <label>:82                                      ; preds = %74
  call void @__asan_report_store8(i64 %76)
  call void asm sideeffect "", ""()
  unreachable

; <label>:83                                      ; preds = %74
  store i64 %add, i64* %potential7, align 8
  br label %if.end

if.else:                                          ; preds = %38
  %sigma_node31 = phi i32 [ %39, %38 ]
  %pred8 = getelementptr inbounds %struct.node* %sigma_node28, i32 0, i32 3
  %84 = ptrtoint %struct.node** %pred8 to i64
  %85 = lshr i64 %84, 3
  %86 = or i64 %85, 17592186044416
  %87 = inttoptr i64 %86 to i8*
  %88 = load i8* %87
  %89 = icmp ne i8 %88, 0
  br i1 %89, label %90, label %91

; <label>:90                                      ; preds = %if.else
  call void @__asan_report_load8(i64 %84)
  call void asm sideeffect "", ""()
  unreachable

; <label>:91                                      ; preds = %if.else
  %92 = load %struct.node** %pred8, align 8
  %potential9 = getelementptr inbounds %struct.node* %92, i32 0, i32 0
  %93 = ptrtoint i64* %potential9 to i64
  %94 = lshr i64 %93, 3
  %95 = or i64 %94, 17592186044416
  %96 = inttoptr i64 %95 to i8*
  %97 = load i8* %96
  %98 = icmp ne i8 %97, 0
  br i1 %98, label %99, label %100

; <label>:99                                      ; preds = %91
  call void @__asan_report_load8(i64 %93)
  call void asm sideeffect "", ""()
  unreachable

; <label>:100                                     ; preds = %91
  %101 = load i64* %potential9, align 8
  %basic_arc10 = getelementptr inbounds %struct.node* %sigma_node28, i32 0, i32 6
  %102 = ptrtoint %struct.arc** %basic_arc10 to i64
  %103 = lshr i64 %102, 3
  %104 = or i64 %103, 17592186044416
  %105 = inttoptr i64 %104 to i8*
  %106 = load i8* %105
  %107 = icmp ne i8 %106, 0
  br i1 %107, label %108, label %109

; <label>:108                                     ; preds = %100
  call void @__asan_report_load8(i64 %102)
  call void asm sideeffect "", ""()
  unreachable

; <label>:109                                     ; preds = %100
  %110 = load %struct.arc** %basic_arc10, align 8
  %cost11 = getelementptr inbounds %struct.arc* %110, i32 0, i32 0
  %111 = ptrtoint i64* %cost11 to i64
  %112 = lshr i64 %111, 3
  %113 = or i64 %112, 17592186044416
  %114 = inttoptr i64 %113 to i8*
  %115 = load i8* %114
  %116 = icmp ne i8 %115, 0
  br i1 %116, label %117, label %118

; <label>:117                                     ; preds = %109
  call void @__asan_report_load8(i64 %111)
  call void asm sideeffect "", ""()
  unreachable

; <label>:118                                     ; preds = %109
  %119 = load i64* %cost11, align 8
  %sub = sub nsw i64 %101, %119
  %potential12 = getelementptr inbounds %struct.node* %sigma_node28, i32 0, i32 0
  %120 = ptrtoint i64* %potential12 to i64
  %121 = lshr i64 %120, 3
  %122 = or i64 %121, 17592186044416
  %123 = inttoptr i64 %122 to i8*
  %124 = load i8* %123
  %125 = icmp ne i8 %124, 0
  br i1 %125, label %126, label %127

; <label>:126                                     ; preds = %118
  call void @__asan_report_store8(i64 %120)
  call void asm sideeffect "", ""()
  unreachable

; <label>:127                                     ; preds = %118
  store i64 %sub, i64* %potential12, align 8
  %inc = add nsw i64 %checksum.1, 1
  br label %if.end

if.end:                                           ; preds = %127, %83
  %checksum.2 = phi i64 [ %checksum.1, %83 ], [ %inc, %127 ]
  %child13 = getelementptr inbounds %struct.node* %sigma_node28, i32 0, i32 2
  %128 = ptrtoint %struct.node** %child13 to i64
  %129 = lshr i64 %128, 3
  %130 = or i64 %129, 17592186044416
  %131 = inttoptr i64 %130 to i8*
  %132 = load i8* %131
  %133 = icmp ne i8 %132, 0
  br i1 %133, label %134, label %135

; <label>:134                                     ; preds = %if.end
  call void @__asan_report_load8(i64 %128)
  call void asm sideeffect "", ""()
  unreachable

; <label>:135                                     ; preds = %if.end
  %136 = load %struct.node** %child13, align 8
  br label %while.cond3

while.end:                                        ; preds = %while.cond3
  %sigma_node29 = phi %struct.node* [ %node.1, %while.cond3 ]
  br label %while.cond14

while.cond14:                                     ; preds = %if.end22, %while.end
  %tmp.2 = phi %struct.node* [ %tmp.1, %while.end ], [ %sigma_node35, %if.end22 ]
  %node.2 = phi %struct.node* [ %tmp.1, %while.end ], [ %163, %if.end22 ]
  %pred15 = getelementptr inbounds %struct.node* %node.2, i32 0, i32 3
  %137 = ptrtoint %struct.node** %pred15 to i64
  %138 = lshr i64 %137, 3
  %139 = or i64 %138, 17592186044416
  %140 = inttoptr i64 %139 to i8*
  %141 = load i8* %140
  %142 = icmp ne i8 %141, 0
  br i1 %142, label %143, label %144

; <label>:143                                     ; preds = %while.cond14
  call void @__asan_report_load8(i64 %137)
  call void asm sideeffect "", ""()
  unreachable

; <label>:144                                     ; preds = %while.cond14
  %145 = load %struct.node** %pred15, align 8
  %tobool16 = icmp ne %struct.node* %145, null
  br i1 %tobool16, label %while.body17, label %while.cond14.while.end23_crit_edge

while.cond14.while.end23_crit_edge:               ; preds = %144
  %sigma_node33 = phi %struct.node* [ %145, %144 ]
  br label %while.end23

while.body17:                                     ; preds = %144
  %sigma_node32 = phi %struct.node* [ %145, %144 ]
  %sibling = getelementptr inbounds %struct.node* %node.2, i32 0, i32 4
  %146 = ptrtoint %struct.node** %sibling to i64
  %147 = lshr i64 %146, 3
  %148 = or i64 %147, 17592186044416
  %149 = inttoptr i64 %148 to i8*
  %150 = load i8* %149
  %151 = icmp ne i8 %150, 0
  br i1 %151, label %152, label %153

; <label>:152                                     ; preds = %while.body17
  call void @__asan_report_load8(i64 %146)
  call void asm sideeffect "", ""()
  unreachable

; <label>:153                                     ; preds = %while.body17
  %154 = load %struct.node** %sibling, align 8
  %tobool18 = icmp ne %struct.node* %154, null
  br i1 %tobool18, label %if.then19, label %if.else20

if.then19:                                        ; preds = %153
  %sigma_node34 = phi %struct.node* [ %154, %153 ]
  br label %while.end23

if.else20:                                        ; preds = %153
  %sigma_node35 = phi %struct.node* [ %154, %153 ]
  %pred21 = getelementptr inbounds %struct.node* %node.2, i32 0, i32 3
  %155 = ptrtoint %struct.node** %pred21 to i64
  %156 = lshr i64 %155, 3
  %157 = or i64 %156, 17592186044416
  %158 = inttoptr i64 %157 to i8*
  %159 = load i8* %158
  %160 = icmp ne i8 %159, 0
  br i1 %160, label %161, label %162

; <label>:161                                     ; preds = %if.else20
  call void @__asan_report_load8(i64 %155)
  call void asm sideeffect "", ""()
  unreachable

; <label>:162                                     ; preds = %if.else20
  %163 = load %struct.node** %pred21, align 8
  br label %if.end22

if.end22:                                         ; preds = %162
  br label %while.cond14

while.end23:                                      ; preds = %while.cond14.while.end23_crit_edge, %if.then19
  %tmp.3 = phi %struct.node* [ %sigma_node34, %if.then19 ], [ %tmp.2, %while.cond14.while.end23_crit_edge ]
  %node.3 = phi %struct.node* [ %sigma_node34, %if.then19 ], [ %node.2, %while.cond14.while.end23_crit_edge ]
  br label %while.cond

while.end24:                                      ; preds = %while.cond
  %sigma_node27 = phi %struct.node* [ %phi_node, %while.cond ]
  %sigma_node25 = phi %struct.node* [ %node.0, %while.cond ]
  ret i64 %checksum.0
}

define double @flow_cost(%struct.network* %net) address_safety nounwind {
entry:
  %stop_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %0 = ptrtoint %struct.arc** %stop_arcs to i64
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
  %8 = load %struct.arc** %stop_arcs, align 8
  %9 = bitcast %struct.arc* %8 to i8*
  %arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %10 = ptrtoint %struct.arc** %arcs to i64
  %11 = lshr i64 %10, 3
  %12 = or i64 %11, 17592186044416
  %13 = inttoptr i64 %12 to i8*
  %14 = load i8* %13
  %15 = icmp ne i8 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %7
  call void @__asan_report_load8(i64 %10)
  call void asm sideeffect "", ""()
  unreachable

; <label>:17                                      ; preds = %7
  %18 = load %struct.arc** %arcs, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %17
  %phi_node = phi i8* [ %sigma_node43, %for.inc ], [ %9, %17 ]
  %arc.0 = phi %struct.arc* [ %18, %17 ], [ %incdec.ptr, %for.inc ]
  %19 = bitcast i8* %phi_node to %struct.arc*
  %cmp = icmp ne %struct.arc* %arc.0, %19
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node43 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node41 = phi %struct.arc* [ %19, %for.cond ]
  %sigma_node = phi %struct.arc* [ %arc.0, %for.cond ]
  %ident = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 3
  %20 = ptrtoint i32* %ident to i64
  %21 = lshr i64 %20, 3
  %22 = or i64 %21, 17592186044416
  %23 = inttoptr i64 %22 to i8*
  %24 = load i8* %23
  %25 = icmp ne i8 %24, 0
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %for.body
  %27 = and i64 %20, 7
  %28 = add i64 %27, 3
  %29 = trunc i64 %28 to i8
  %30 = icmp sge i8 %29, %24
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %26
  call void @__asan_report_load4(i64 %20)
  call void asm sideeffect "", ""()
  unreachable

; <label>:32                                      ; preds = %26, %for.body
  %33 = load i32* %ident, align 4
  %cmp1 = icmp eq i32 %33, 2
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %32
  %sigma_node45 = phi i32 [ %33, %32 ]
  %flow = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 6
  %34 = ptrtoint i64* %flow to i64
  %35 = lshr i64 %34, 3
  %36 = or i64 %35, 17592186044416
  %37 = inttoptr i64 %36 to i8*
  %38 = load i8* %37
  %39 = icmp ne i8 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %if.then
  call void @__asan_report_store8(i64 %34)
  call void asm sideeffect "", ""()
  unreachable

; <label>:41                                      ; preds = %if.then
  store i64 1, i64* %flow, align 8
  br label %if.end

if.else:                                          ; preds = %32
  %sigma_node46 = phi i32 [ %33, %32 ]
  %flow2 = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 6
  %42 = ptrtoint i64* %flow2 to i64
  %43 = lshr i64 %42, 3
  %44 = or i64 %43, 17592186044416
  %45 = inttoptr i64 %44 to i8*
  %46 = load i8* %45
  %47 = icmp ne i8 %46, 0
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %if.else
  call void @__asan_report_store8(i64 %42)
  call void asm sideeffect "", ""()
  unreachable

; <label>:49                                      ; preds = %if.else
  store i64 0, i64* %flow2, align 8
  br label %if.end

if.end:                                           ; preds = %49, %41
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %incdec.ptr = getelementptr inbounds %struct.arc* %sigma_node, i32 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node44 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node42 = phi %struct.arc* [ %19, %for.cond ]
  %sigma_node40 = phi %struct.arc* [ %arc.0, %for.cond ]
  %stop_nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 22
  %50 = ptrtoint %struct.node** %stop_nodes to i64
  %51 = lshr i64 %50, 3
  %52 = or i64 %51, 17592186044416
  %53 = inttoptr i64 %52 to i8*
  %54 = load i8* %53
  %55 = icmp ne i8 %54, 0
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %for.end
  call void @__asan_report_load8(i64 %50)
  call void asm sideeffect "", ""()
  unreachable

; <label>:57                                      ; preds = %for.end
  %58 = load %struct.node** %stop_nodes, align 8
  %59 = bitcast %struct.node* %58 to i8*
  %nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %60 = ptrtoint %struct.node** %nodes to i64
  %61 = lshr i64 %60, 3
  %62 = or i64 %61, 17592186044416
  %63 = inttoptr i64 %62 to i8*
  %64 = load i8* %63
  %65 = icmp ne i8 %64, 0
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %57
  call void @__asan_report_load8(i64 %60)
  call void asm sideeffect "", ""()
  unreachable

; <label>:67                                      ; preds = %57
  %68 = load %struct.node** %nodes, align 8
  %incdec.ptr3 = getelementptr inbounds %struct.node* %68, i32 1
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc9, %67
  %phi_node52 = phi i8* [ %sigma_node51, %for.inc9 ], [ %59, %67 ]
  %node.0 = phi %struct.node* [ %incdec.ptr3, %67 ], [ %incdec.ptr10, %for.inc9 ]
  %69 = bitcast i8* %phi_node52 to %struct.node*
  %cmp5 = icmp ne %struct.node* %node.0, %69
  br i1 %cmp5, label %for.body6, label %for.end11

for.body6:                                        ; preds = %for.cond4
  %sigma_node51 = phi i8* [ %phi_node52, %for.cond4 ]
  %sigma_node49 = phi %struct.node* [ %69, %for.cond4 ]
  %sigma_node47 = phi %struct.node* [ %node.0, %for.cond4 ]
  %flow7 = getelementptr inbounds %struct.node* %sigma_node47, i32 0, i32 10
  %70 = ptrtoint i64* %flow7 to i64
  %71 = lshr i64 %70, 3
  %72 = or i64 %71, 17592186044416
  %73 = inttoptr i64 %72 to i8*
  %74 = load i8* %73
  %75 = icmp ne i8 %74, 0
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %for.body6
  call void @__asan_report_load8(i64 %70)
  call void asm sideeffect "", ""()
  unreachable

; <label>:77                                      ; preds = %for.body6
  %78 = load i64* %flow7, align 8
  %basic_arc = getelementptr inbounds %struct.node* %sigma_node47, i32 0, i32 6
  %79 = ptrtoint %struct.arc** %basic_arc to i64
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
  %87 = load %struct.arc** %basic_arc, align 8
  %flow8 = getelementptr inbounds %struct.arc* %87, i32 0, i32 6
  %88 = ptrtoint i64* %flow8 to i64
  %89 = lshr i64 %88, 3
  %90 = or i64 %89, 17592186044416
  %91 = inttoptr i64 %90 to i8*
  %92 = load i8* %91
  %93 = icmp ne i8 %92, 0
  br i1 %93, label %94, label %95

; <label>:94                                      ; preds = %86
  call void @__asan_report_store8(i64 %88)
  call void asm sideeffect "", ""()
  unreachable

; <label>:95                                      ; preds = %86
  store i64 %78, i64* %flow8, align 8
  br label %for.inc9

for.inc9:                                         ; preds = %95
  %incdec.ptr10 = getelementptr inbounds %struct.node* %sigma_node47, i32 1
  br label %for.cond4

for.end11:                                        ; preds = %for.cond4
  %sigma_node53 = phi i8* [ %phi_node52, %for.cond4 ]
  %sigma_node50 = phi %struct.node* [ %69, %for.cond4 ]
  %sigma_node48 = phi %struct.node* [ %node.0, %for.cond4 ]
  %stop_arcs12 = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %96 = ptrtoint %struct.arc** %stop_arcs12 to i64
  %97 = lshr i64 %96, 3
  %98 = or i64 %97, 17592186044416
  %99 = inttoptr i64 %98 to i8*
  %100 = load i8* %99
  %101 = icmp ne i8 %100, 0
  br i1 %101, label %102, label %103

; <label>:102                                     ; preds = %for.end11
  call void @__asan_report_load8(i64 %96)
  call void asm sideeffect "", ""()
  unreachable

; <label>:103                                     ; preds = %for.end11
  %104 = load %struct.arc** %stop_arcs12, align 8
  %105 = bitcast %struct.arc* %104 to i8*
  %arcs13 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %106 = ptrtoint %struct.arc** %arcs13 to i64
  %107 = lshr i64 %106, 3
  %108 = or i64 %107, 17592186044416
  %109 = inttoptr i64 %108 to i8*
  %110 = load i8* %109
  %111 = icmp ne i8 %110, 0
  br i1 %111, label %112, label %113

; <label>:112                                     ; preds = %103
  call void @__asan_report_load8(i64 %106)
  call void asm sideeffect "", ""()
  unreachable

; <label>:113                                     ; preds = %103
  %114 = load %struct.arc** %arcs13, align 8
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc33, %113
  %phi_node59 = phi i8* [ %sigma_node58, %for.inc33 ], [ %105, %113 ]
  %fleet.0 = phi i64 [ 0, %113 ], [ %fleet.3, %for.inc33 ]
  %arc.1 = phi %struct.arc* [ %114, %113 ], [ %incdec.ptr34, %for.inc33 ]
  %operational_cost.0 = phi i64 [ 0, %113 ], [ %operational_cost.3, %for.inc33 ]
  %115 = bitcast i8* %phi_node59 to %struct.arc*
  %cmp15 = icmp ne %struct.arc* %arc.1, %115
  br i1 %cmp15, label %for.body16, label %for.end35

for.body16:                                       ; preds = %for.cond14
  %sigma_node58 = phi i8* [ %phi_node59, %for.cond14 ]
  %sigma_node56 = phi %struct.arc* [ %115, %for.cond14 ]
  %sigma_node54 = phi %struct.arc* [ %arc.1, %for.cond14 ]
  %flow17 = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 6
  %116 = ptrtoint i64* %flow17 to i64
  %117 = lshr i64 %116, 3
  %118 = or i64 %117, 17592186044416
  %119 = inttoptr i64 %118 to i8*
  %120 = load i8* %119
  %121 = icmp ne i8 %120, 0
  br i1 %121, label %122, label %123

; <label>:122                                     ; preds = %for.body16
  call void @__asan_report_load8(i64 %116)
  call void asm sideeffect "", ""()
  unreachable

; <label>:123                                     ; preds = %for.body16
  %124 = load i64* %flow17, align 8
  %tobool = icmp ne i64 %124, 0
  br i1 %tobool, label %if.then18, label %for.body16.if.end32_crit_edge

for.body16.if.end32_crit_edge:                    ; preds = %123
  %sigma_node62 = phi i64 [ %124, %123 ]
  br label %if.end32

if.then18:                                        ; preds = %123
  %sigma_node61 = phi i64 [ %124, %123 ]
  %tail = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 1
  %125 = ptrtoint %struct.node** %tail to i64
  %126 = lshr i64 %125, 3
  %127 = or i64 %126, 17592186044416
  %128 = inttoptr i64 %127 to i8*
  %129 = load i8* %128
  %130 = icmp ne i8 %129, 0
  br i1 %130, label %131, label %132

; <label>:131                                     ; preds = %if.then18
  call void @__asan_report_load8(i64 %125)
  call void asm sideeffect "", ""()
  unreachable

; <label>:132                                     ; preds = %if.then18
  %133 = load %struct.node** %tail, align 8
  %number = getelementptr inbounds %struct.node* %133, i32 0, i32 12
  %134 = ptrtoint i32* %number to i64
  %135 = lshr i64 %134, 3
  %136 = or i64 %135, 17592186044416
  %137 = inttoptr i64 %136 to i8*
  %138 = load i8* %137
  %139 = icmp ne i8 %138, 0
  br i1 %139, label %140, label %146

; <label>:140                                     ; preds = %132
  %141 = and i64 %134, 7
  %142 = add i64 %141, 3
  %143 = trunc i64 %142 to i8
  %144 = icmp sge i8 %143, %138
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %140
  call void @__asan_report_load4(i64 %134)
  call void asm sideeffect "", ""()
  unreachable

; <label>:146                                     ; preds = %140, %132
  %147 = load i32* %number, align 4
  %cmp19 = icmp slt i32 %147, 0
  br i1 %cmp19, label %land.lhs.true, label %if.then18.if.then22_crit_edge

if.then18.if.then22_crit_edge:                    ; preds = %146
  %sigma_node64 = phi i32 [ %147, %146 ]
  br label %if.then22

land.lhs.true:                                    ; preds = %146
  %sigma_node63 = phi i32 [ %147, %146 ]
  %head = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 2
  %148 = ptrtoint %struct.node** %head to i64
  %149 = lshr i64 %148, 3
  %150 = or i64 %149, 17592186044416
  %151 = inttoptr i64 %150 to i8*
  %152 = load i8* %151
  %153 = icmp ne i8 %152, 0
  br i1 %153, label %154, label %155

; <label>:154                                     ; preds = %land.lhs.true
  call void @__asan_report_load8(i64 %148)
  call void asm sideeffect "", ""()
  unreachable

; <label>:155                                     ; preds = %land.lhs.true
  %156 = load %struct.node** %head, align 8
  %number20 = getelementptr inbounds %struct.node* %156, i32 0, i32 12
  %157 = ptrtoint i32* %number20 to i64
  %158 = lshr i64 %157, 3
  %159 = or i64 %158, 17592186044416
  %160 = inttoptr i64 %159 to i8*
  %161 = load i8* %160
  %162 = icmp ne i8 %161, 0
  br i1 %162, label %163, label %169

; <label>:163                                     ; preds = %155
  %164 = and i64 %157, 7
  %165 = add i64 %164, 3
  %166 = trunc i64 %165 to i8
  %167 = icmp sge i8 %166, %161
  br i1 %167, label %168, label %169

; <label>:168                                     ; preds = %163
  call void @__asan_report_load4(i64 %157)
  call void asm sideeffect "", ""()
  unreachable

; <label>:169                                     ; preds = %163, %155
  %170 = load i32* %number20, align 4
  %cmp21 = icmp sgt i32 %170, 0
  br i1 %cmp21, label %land.lhs.true.if.end31_crit_edge, label %land.lhs.true.if.then22_crit_edge

land.lhs.true.if.then22_crit_edge:                ; preds = %169
  %sigma_node66 = phi i32 [ %170, %169 ]
  br label %if.then22

land.lhs.true.if.end31_crit_edge:                 ; preds = %169
  %sigma_node65 = phi i32 [ %170, %169 ]
  br label %if.end31

if.then22:                                        ; preds = %land.lhs.true.if.then22_crit_edge, %if.then18.if.then22_crit_edge
  %tail23 = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 1
  %171 = ptrtoint %struct.node** %tail23 to i64
  %172 = lshr i64 %171, 3
  %173 = or i64 %172, 17592186044416
  %174 = inttoptr i64 %173 to i8*
  %175 = load i8* %174
  %176 = icmp ne i8 %175, 0
  br i1 %176, label %177, label %178

; <label>:177                                     ; preds = %if.then22
  call void @__asan_report_load8(i64 %171)
  call void asm sideeffect "", ""()
  unreachable

; <label>:178                                     ; preds = %if.then22
  %179 = load %struct.node** %tail23, align 8
  %number24 = getelementptr inbounds %struct.node* %179, i32 0, i32 12
  %180 = ptrtoint i32* %number24 to i64
  %181 = lshr i64 %180, 3
  %182 = or i64 %181, 17592186044416
  %183 = inttoptr i64 %182 to i8*
  %184 = load i8* %183
  %185 = icmp ne i8 %184, 0
  br i1 %185, label %186, label %192

; <label>:186                                     ; preds = %178
  %187 = and i64 %180, 7
  %188 = add i64 %187, 3
  %189 = trunc i64 %188 to i8
  %190 = icmp sge i8 %189, %184
  br i1 %190, label %191, label %192

; <label>:191                                     ; preds = %186
  call void @__asan_report_load4(i64 %180)
  call void asm sideeffect "", ""()
  unreachable

; <label>:192                                     ; preds = %186, %178
  %193 = load i32* %number24, align 4
  %tobool25 = icmp ne i32 %193, 0
  br i1 %tobool25, label %if.else27, label %if.then26

if.then26:                                        ; preds = %192
  %sigma_node68 = phi i32 [ %193, %192 ]
  %cost = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 0
  %194 = ptrtoint i64* %cost to i64
  %195 = lshr i64 %194, 3
  %196 = or i64 %195, 17592186044416
  %197 = inttoptr i64 %196 to i8*
  %198 = load i8* %197
  %199 = icmp ne i8 %198, 0
  br i1 %199, label %200, label %201

; <label>:200                                     ; preds = %if.then26
  call void @__asan_report_load8(i64 %194)
  call void asm sideeffect "", ""()
  unreachable

; <label>:201                                     ; preds = %if.then26
  %202 = load i64* %cost, align 8
  %bigM = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %203 = ptrtoint i64* %bigM to i64
  %204 = lshr i64 %203, 3
  %205 = or i64 %204, 17592186044416
  %206 = inttoptr i64 %205 to i8*
  %207 = load i8* %206
  %208 = icmp ne i8 %207, 0
  br i1 %208, label %209, label %210

; <label>:209                                     ; preds = %201
  call void @__asan_report_load8(i64 %203)
  call void asm sideeffect "", ""()
  unreachable

; <label>:210                                     ; preds = %201
  %211 = load i64* %bigM, align 8
  %sub = sub nsw i64 %202, %211
  %add = add nsw i64 %operational_cost.0, %sub
  %inc = add nsw i64 %fleet.0, 1
  br label %if.end30

if.else27:                                        ; preds = %192
  %sigma_node67 = phi i32 [ %193, %192 ]
  %cost28 = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 0
  %212 = ptrtoint i64* %cost28 to i64
  %213 = lshr i64 %212, 3
  %214 = or i64 %213, 17592186044416
  %215 = inttoptr i64 %214 to i8*
  %216 = load i8* %215
  %217 = icmp ne i8 %216, 0
  br i1 %217, label %218, label %219

; <label>:218                                     ; preds = %if.else27
  call void @__asan_report_load8(i64 %212)
  call void asm sideeffect "", ""()
  unreachable

; <label>:219                                     ; preds = %if.else27
  %220 = load i64* %cost28, align 8
  %add29 = add nsw i64 %operational_cost.0, %220
  br label %if.end30

if.end30:                                         ; preds = %219, %210
  %fleet.1 = phi i64 [ %fleet.0, %219 ], [ %inc, %210 ]
  %operational_cost.1 = phi i64 [ %add29, %219 ], [ %add, %210 ]
  br label %if.end31

if.end31:                                         ; preds = %land.lhs.true.if.end31_crit_edge, %if.end30
  %fleet.2 = phi i64 [ %fleet.0, %land.lhs.true.if.end31_crit_edge ], [ %fleet.1, %if.end30 ]
  %operational_cost.2 = phi i64 [ %operational_cost.0, %land.lhs.true.if.end31_crit_edge ], [ %operational_cost.1, %if.end30 ]
  br label %if.end32

if.end32:                                         ; preds = %for.body16.if.end32_crit_edge, %if.end31
  %fleet.3 = phi i64 [ %fleet.2, %if.end31 ], [ %fleet.0, %for.body16.if.end32_crit_edge ]
  %operational_cost.3 = phi i64 [ %operational_cost.2, %if.end31 ], [ %operational_cost.0, %for.body16.if.end32_crit_edge ]
  br label %for.inc33

for.inc33:                                        ; preds = %if.end32
  %incdec.ptr34 = getelementptr inbounds %struct.arc* %sigma_node54, i32 1
  br label %for.cond14

for.end35:                                        ; preds = %for.cond14
  %sigma_node60 = phi i8* [ %phi_node59, %for.cond14 ]
  %sigma_node57 = phi %struct.arc* [ %115, %for.cond14 ]
  %sigma_node55 = phi %struct.arc* [ %arc.1, %for.cond14 ]
  %conv = sitofp i64 %fleet.0 to double
  %bigM36 = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %221 = ptrtoint i64* %bigM36 to i64
  %222 = lshr i64 %221, 3
  %223 = or i64 %222, 17592186044416
  %224 = inttoptr i64 %223 to i8*
  %225 = load i8* %224
  %226 = icmp ne i8 %225, 0
  br i1 %226, label %227, label %228

; <label>:227                                     ; preds = %for.end35
  call void @__asan_report_load8(i64 %221)
  call void asm sideeffect "", ""()
  unreachable

; <label>:228                                     ; preds = %for.end35
  %229 = load i64* %bigM36, align 8
  %conv37 = sitofp i64 %229 to double
  %mul = fmul double %conv, %conv37
  %conv38 = sitofp i64 %operational_cost.0 to double
  %add39 = fadd double %mul, %conv38
  ret double %add39
}

define double @flow_org_cost(%struct.network* %net) address_safety nounwind {
entry:
  %stop_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %0 = ptrtoint %struct.arc** %stop_arcs to i64
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
  %8 = load %struct.arc** %stop_arcs, align 8
  %9 = bitcast %struct.arc* %8 to i8*
  %arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %10 = ptrtoint %struct.arc** %arcs to i64
  %11 = lshr i64 %10, 3
  %12 = or i64 %11, 17592186044416
  %13 = inttoptr i64 %12 to i8*
  %14 = load i8* %13
  %15 = icmp ne i8 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %7
  call void @__asan_report_load8(i64 %10)
  call void asm sideeffect "", ""()
  unreachable

; <label>:17                                      ; preds = %7
  %18 = load %struct.arc** %arcs, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %17
  %phi_node = phi i8* [ %sigma_node43, %for.inc ], [ %9, %17 ]
  %arc.0 = phi %struct.arc* [ %18, %17 ], [ %incdec.ptr, %for.inc ]
  %19 = bitcast i8* %phi_node to %struct.arc*
  %cmp = icmp ne %struct.arc* %arc.0, %19
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node43 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node41 = phi %struct.arc* [ %19, %for.cond ]
  %sigma_node = phi %struct.arc* [ %arc.0, %for.cond ]
  %ident = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 3
  %20 = ptrtoint i32* %ident to i64
  %21 = lshr i64 %20, 3
  %22 = or i64 %21, 17592186044416
  %23 = inttoptr i64 %22 to i8*
  %24 = load i8* %23
  %25 = icmp ne i8 %24, 0
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %for.body
  %27 = and i64 %20, 7
  %28 = add i64 %27, 3
  %29 = trunc i64 %28 to i8
  %30 = icmp sge i8 %29, %24
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %26
  call void @__asan_report_load4(i64 %20)
  call void asm sideeffect "", ""()
  unreachable

; <label>:32                                      ; preds = %26, %for.body
  %33 = load i32* %ident, align 4
  %cmp1 = icmp eq i32 %33, 2
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %32
  %sigma_node45 = phi i32 [ %33, %32 ]
  %flow = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 6
  %34 = ptrtoint i64* %flow to i64
  %35 = lshr i64 %34, 3
  %36 = or i64 %35, 17592186044416
  %37 = inttoptr i64 %36 to i8*
  %38 = load i8* %37
  %39 = icmp ne i8 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %if.then
  call void @__asan_report_store8(i64 %34)
  call void asm sideeffect "", ""()
  unreachable

; <label>:41                                      ; preds = %if.then
  store i64 1, i64* %flow, align 8
  br label %if.end

if.else:                                          ; preds = %32
  %sigma_node46 = phi i32 [ %33, %32 ]
  %flow2 = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 6
  %42 = ptrtoint i64* %flow2 to i64
  %43 = lshr i64 %42, 3
  %44 = or i64 %43, 17592186044416
  %45 = inttoptr i64 %44 to i8*
  %46 = load i8* %45
  %47 = icmp ne i8 %46, 0
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %if.else
  call void @__asan_report_store8(i64 %42)
  call void asm sideeffect "", ""()
  unreachable

; <label>:49                                      ; preds = %if.else
  store i64 0, i64* %flow2, align 8
  br label %if.end

if.end:                                           ; preds = %49, %41
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %incdec.ptr = getelementptr inbounds %struct.arc* %sigma_node, i32 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node44 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node42 = phi %struct.arc* [ %19, %for.cond ]
  %sigma_node40 = phi %struct.arc* [ %arc.0, %for.cond ]
  %stop_nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 22
  %50 = ptrtoint %struct.node** %stop_nodes to i64
  %51 = lshr i64 %50, 3
  %52 = or i64 %51, 17592186044416
  %53 = inttoptr i64 %52 to i8*
  %54 = load i8* %53
  %55 = icmp ne i8 %54, 0
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %for.end
  call void @__asan_report_load8(i64 %50)
  call void asm sideeffect "", ""()
  unreachable

; <label>:57                                      ; preds = %for.end
  %58 = load %struct.node** %stop_nodes, align 8
  %59 = bitcast %struct.node* %58 to i8*
  %nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %60 = ptrtoint %struct.node** %nodes to i64
  %61 = lshr i64 %60, 3
  %62 = or i64 %61, 17592186044416
  %63 = inttoptr i64 %62 to i8*
  %64 = load i8* %63
  %65 = icmp ne i8 %64, 0
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %57
  call void @__asan_report_load8(i64 %60)
  call void asm sideeffect "", ""()
  unreachable

; <label>:67                                      ; preds = %57
  %68 = load %struct.node** %nodes, align 8
  %incdec.ptr3 = getelementptr inbounds %struct.node* %68, i32 1
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc9, %67
  %phi_node52 = phi i8* [ %sigma_node51, %for.inc9 ], [ %59, %67 ]
  %node.0 = phi %struct.node* [ %incdec.ptr3, %67 ], [ %incdec.ptr10, %for.inc9 ]
  %69 = bitcast i8* %phi_node52 to %struct.node*
  %cmp5 = icmp ne %struct.node* %node.0, %69
  br i1 %cmp5, label %for.body6, label %for.end11

for.body6:                                        ; preds = %for.cond4
  %sigma_node51 = phi i8* [ %phi_node52, %for.cond4 ]
  %sigma_node49 = phi %struct.node* [ %69, %for.cond4 ]
  %sigma_node47 = phi %struct.node* [ %node.0, %for.cond4 ]
  %flow7 = getelementptr inbounds %struct.node* %sigma_node47, i32 0, i32 10
  %70 = ptrtoint i64* %flow7 to i64
  %71 = lshr i64 %70, 3
  %72 = or i64 %71, 17592186044416
  %73 = inttoptr i64 %72 to i8*
  %74 = load i8* %73
  %75 = icmp ne i8 %74, 0
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %for.body6
  call void @__asan_report_load8(i64 %70)
  call void asm sideeffect "", ""()
  unreachable

; <label>:77                                      ; preds = %for.body6
  %78 = load i64* %flow7, align 8
  %basic_arc = getelementptr inbounds %struct.node* %sigma_node47, i32 0, i32 6
  %79 = ptrtoint %struct.arc** %basic_arc to i64
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
  %87 = load %struct.arc** %basic_arc, align 8
  %flow8 = getelementptr inbounds %struct.arc* %87, i32 0, i32 6
  %88 = ptrtoint i64* %flow8 to i64
  %89 = lshr i64 %88, 3
  %90 = or i64 %89, 17592186044416
  %91 = inttoptr i64 %90 to i8*
  %92 = load i8* %91
  %93 = icmp ne i8 %92, 0
  br i1 %93, label %94, label %95

; <label>:94                                      ; preds = %86
  call void @__asan_report_store8(i64 %88)
  call void asm sideeffect "", ""()
  unreachable

; <label>:95                                      ; preds = %86
  store i64 %78, i64* %flow8, align 8
  br label %for.inc9

for.inc9:                                         ; preds = %95
  %incdec.ptr10 = getelementptr inbounds %struct.node* %sigma_node47, i32 1
  br label %for.cond4

for.end11:                                        ; preds = %for.cond4
  %sigma_node53 = phi i8* [ %phi_node52, %for.cond4 ]
  %sigma_node50 = phi %struct.node* [ %69, %for.cond4 ]
  %sigma_node48 = phi %struct.node* [ %node.0, %for.cond4 ]
  %stop_arcs12 = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %96 = ptrtoint %struct.arc** %stop_arcs12 to i64
  %97 = lshr i64 %96, 3
  %98 = or i64 %97, 17592186044416
  %99 = inttoptr i64 %98 to i8*
  %100 = load i8* %99
  %101 = icmp ne i8 %100, 0
  br i1 %101, label %102, label %103

; <label>:102                                     ; preds = %for.end11
  call void @__asan_report_load8(i64 %96)
  call void asm sideeffect "", ""()
  unreachable

; <label>:103                                     ; preds = %for.end11
  %104 = load %struct.arc** %stop_arcs12, align 8
  %105 = bitcast %struct.arc* %104 to i8*
  %arcs13 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %106 = ptrtoint %struct.arc** %arcs13 to i64
  %107 = lshr i64 %106, 3
  %108 = or i64 %107, 17592186044416
  %109 = inttoptr i64 %108 to i8*
  %110 = load i8* %109
  %111 = icmp ne i8 %110, 0
  br i1 %111, label %112, label %113

; <label>:112                                     ; preds = %103
  call void @__asan_report_load8(i64 %106)
  call void asm sideeffect "", ""()
  unreachable

; <label>:113                                     ; preds = %103
  %114 = load %struct.arc** %arcs13, align 8
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc33, %113
  %phi_node59 = phi i8* [ %sigma_node58, %for.inc33 ], [ %105, %113 ]
  %fleet.0 = phi i64 [ 0, %113 ], [ %fleet.3, %for.inc33 ]
  %arc.1 = phi %struct.arc* [ %114, %113 ], [ %incdec.ptr34, %for.inc33 ]
  %operational_cost.0 = phi i64 [ 0, %113 ], [ %operational_cost.3, %for.inc33 ]
  %115 = bitcast i8* %phi_node59 to %struct.arc*
  %cmp15 = icmp ne %struct.arc* %arc.1, %115
  br i1 %cmp15, label %for.body16, label %for.end35

for.body16:                                       ; preds = %for.cond14
  %sigma_node58 = phi i8* [ %phi_node59, %for.cond14 ]
  %sigma_node56 = phi %struct.arc* [ %115, %for.cond14 ]
  %sigma_node54 = phi %struct.arc* [ %arc.1, %for.cond14 ]
  %flow17 = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 6
  %116 = ptrtoint i64* %flow17 to i64
  %117 = lshr i64 %116, 3
  %118 = or i64 %117, 17592186044416
  %119 = inttoptr i64 %118 to i8*
  %120 = load i8* %119
  %121 = icmp ne i8 %120, 0
  br i1 %121, label %122, label %123

; <label>:122                                     ; preds = %for.body16
  call void @__asan_report_load8(i64 %116)
  call void asm sideeffect "", ""()
  unreachable

; <label>:123                                     ; preds = %for.body16
  %124 = load i64* %flow17, align 8
  %tobool = icmp ne i64 %124, 0
  br i1 %tobool, label %if.then18, label %for.body16.if.end32_crit_edge

for.body16.if.end32_crit_edge:                    ; preds = %123
  %sigma_node62 = phi i64 [ %124, %123 ]
  br label %if.end32

if.then18:                                        ; preds = %123
  %sigma_node61 = phi i64 [ %124, %123 ]
  %tail = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 1
  %125 = ptrtoint %struct.node** %tail to i64
  %126 = lshr i64 %125, 3
  %127 = or i64 %126, 17592186044416
  %128 = inttoptr i64 %127 to i8*
  %129 = load i8* %128
  %130 = icmp ne i8 %129, 0
  br i1 %130, label %131, label %132

; <label>:131                                     ; preds = %if.then18
  call void @__asan_report_load8(i64 %125)
  call void asm sideeffect "", ""()
  unreachable

; <label>:132                                     ; preds = %if.then18
  %133 = load %struct.node** %tail, align 8
  %number = getelementptr inbounds %struct.node* %133, i32 0, i32 12
  %134 = ptrtoint i32* %number to i64
  %135 = lshr i64 %134, 3
  %136 = or i64 %135, 17592186044416
  %137 = inttoptr i64 %136 to i8*
  %138 = load i8* %137
  %139 = icmp ne i8 %138, 0
  br i1 %139, label %140, label %146

; <label>:140                                     ; preds = %132
  %141 = and i64 %134, 7
  %142 = add i64 %141, 3
  %143 = trunc i64 %142 to i8
  %144 = icmp sge i8 %143, %138
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %140
  call void @__asan_report_load4(i64 %134)
  call void asm sideeffect "", ""()
  unreachable

; <label>:146                                     ; preds = %140, %132
  %147 = load i32* %number, align 4
  %cmp19 = icmp slt i32 %147, 0
  br i1 %cmp19, label %land.lhs.true, label %if.then18.if.then22_crit_edge

if.then18.if.then22_crit_edge:                    ; preds = %146
  %sigma_node64 = phi i32 [ %147, %146 ]
  br label %if.then22

land.lhs.true:                                    ; preds = %146
  %sigma_node63 = phi i32 [ %147, %146 ]
  %head = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 2
  %148 = ptrtoint %struct.node** %head to i64
  %149 = lshr i64 %148, 3
  %150 = or i64 %149, 17592186044416
  %151 = inttoptr i64 %150 to i8*
  %152 = load i8* %151
  %153 = icmp ne i8 %152, 0
  br i1 %153, label %154, label %155

; <label>:154                                     ; preds = %land.lhs.true
  call void @__asan_report_load8(i64 %148)
  call void asm sideeffect "", ""()
  unreachable

; <label>:155                                     ; preds = %land.lhs.true
  %156 = load %struct.node** %head, align 8
  %number20 = getelementptr inbounds %struct.node* %156, i32 0, i32 12
  %157 = ptrtoint i32* %number20 to i64
  %158 = lshr i64 %157, 3
  %159 = or i64 %158, 17592186044416
  %160 = inttoptr i64 %159 to i8*
  %161 = load i8* %160
  %162 = icmp ne i8 %161, 0
  br i1 %162, label %163, label %169

; <label>:163                                     ; preds = %155
  %164 = and i64 %157, 7
  %165 = add i64 %164, 3
  %166 = trunc i64 %165 to i8
  %167 = icmp sge i8 %166, %161
  br i1 %167, label %168, label %169

; <label>:168                                     ; preds = %163
  call void @__asan_report_load4(i64 %157)
  call void asm sideeffect "", ""()
  unreachable

; <label>:169                                     ; preds = %163, %155
  %170 = load i32* %number20, align 4
  %cmp21 = icmp sgt i32 %170, 0
  br i1 %cmp21, label %land.lhs.true.if.end31_crit_edge, label %land.lhs.true.if.then22_crit_edge

land.lhs.true.if.then22_crit_edge:                ; preds = %169
  %sigma_node66 = phi i32 [ %170, %169 ]
  br label %if.then22

land.lhs.true.if.end31_crit_edge:                 ; preds = %169
  %sigma_node65 = phi i32 [ %170, %169 ]
  br label %if.end31

if.then22:                                        ; preds = %land.lhs.true.if.then22_crit_edge, %if.then18.if.then22_crit_edge
  %tail23 = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 1
  %171 = ptrtoint %struct.node** %tail23 to i64
  %172 = lshr i64 %171, 3
  %173 = or i64 %172, 17592186044416
  %174 = inttoptr i64 %173 to i8*
  %175 = load i8* %174
  %176 = icmp ne i8 %175, 0
  br i1 %176, label %177, label %178

; <label>:177                                     ; preds = %if.then22
  call void @__asan_report_load8(i64 %171)
  call void asm sideeffect "", ""()
  unreachable

; <label>:178                                     ; preds = %if.then22
  %179 = load %struct.node** %tail23, align 8
  %number24 = getelementptr inbounds %struct.node* %179, i32 0, i32 12
  %180 = ptrtoint i32* %number24 to i64
  %181 = lshr i64 %180, 3
  %182 = or i64 %181, 17592186044416
  %183 = inttoptr i64 %182 to i8*
  %184 = load i8* %183
  %185 = icmp ne i8 %184, 0
  br i1 %185, label %186, label %192

; <label>:186                                     ; preds = %178
  %187 = and i64 %180, 7
  %188 = add i64 %187, 3
  %189 = trunc i64 %188 to i8
  %190 = icmp sge i8 %189, %184
  br i1 %190, label %191, label %192

; <label>:191                                     ; preds = %186
  call void @__asan_report_load4(i64 %180)
  call void asm sideeffect "", ""()
  unreachable

; <label>:192                                     ; preds = %186, %178
  %193 = load i32* %number24, align 4
  %tobool25 = icmp ne i32 %193, 0
  br i1 %tobool25, label %if.else27, label %if.then26

if.then26:                                        ; preds = %192
  %sigma_node68 = phi i32 [ %193, %192 ]
  %org_cost = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 7
  %194 = ptrtoint i64* %org_cost to i64
  %195 = lshr i64 %194, 3
  %196 = or i64 %195, 17592186044416
  %197 = inttoptr i64 %196 to i8*
  %198 = load i8* %197
  %199 = icmp ne i8 %198, 0
  br i1 %199, label %200, label %201

; <label>:200                                     ; preds = %if.then26
  call void @__asan_report_load8(i64 %194)
  call void asm sideeffect "", ""()
  unreachable

; <label>:201                                     ; preds = %if.then26
  %202 = load i64* %org_cost, align 8
  %bigM = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %203 = ptrtoint i64* %bigM to i64
  %204 = lshr i64 %203, 3
  %205 = or i64 %204, 17592186044416
  %206 = inttoptr i64 %205 to i8*
  %207 = load i8* %206
  %208 = icmp ne i8 %207, 0
  br i1 %208, label %209, label %210

; <label>:209                                     ; preds = %201
  call void @__asan_report_load8(i64 %203)
  call void asm sideeffect "", ""()
  unreachable

; <label>:210                                     ; preds = %201
  %211 = load i64* %bigM, align 8
  %sub = sub nsw i64 %202, %211
  %add = add nsw i64 %operational_cost.0, %sub
  %inc = add nsw i64 %fleet.0, 1
  br label %if.end30

if.else27:                                        ; preds = %192
  %sigma_node67 = phi i32 [ %193, %192 ]
  %org_cost28 = getelementptr inbounds %struct.arc* %sigma_node54, i32 0, i32 7
  %212 = ptrtoint i64* %org_cost28 to i64
  %213 = lshr i64 %212, 3
  %214 = or i64 %213, 17592186044416
  %215 = inttoptr i64 %214 to i8*
  %216 = load i8* %215
  %217 = icmp ne i8 %216, 0
  br i1 %217, label %218, label %219

; <label>:218                                     ; preds = %if.else27
  call void @__asan_report_load8(i64 %212)
  call void asm sideeffect "", ""()
  unreachable

; <label>:219                                     ; preds = %if.else27
  %220 = load i64* %org_cost28, align 8
  %add29 = add nsw i64 %operational_cost.0, %220
  br label %if.end30

if.end30:                                         ; preds = %219, %210
  %fleet.1 = phi i64 [ %fleet.0, %219 ], [ %inc, %210 ]
  %operational_cost.1 = phi i64 [ %add29, %219 ], [ %add, %210 ]
  br label %if.end31

if.end31:                                         ; preds = %land.lhs.true.if.end31_crit_edge, %if.end30
  %fleet.2 = phi i64 [ %fleet.0, %land.lhs.true.if.end31_crit_edge ], [ %fleet.1, %if.end30 ]
  %operational_cost.2 = phi i64 [ %operational_cost.0, %land.lhs.true.if.end31_crit_edge ], [ %operational_cost.1, %if.end30 ]
  br label %if.end32

if.end32:                                         ; preds = %for.body16.if.end32_crit_edge, %if.end31
  %fleet.3 = phi i64 [ %fleet.2, %if.end31 ], [ %fleet.0, %for.body16.if.end32_crit_edge ]
  %operational_cost.3 = phi i64 [ %operational_cost.2, %if.end31 ], [ %operational_cost.0, %for.body16.if.end32_crit_edge ]
  br label %for.inc33

for.inc33:                                        ; preds = %if.end32
  %incdec.ptr34 = getelementptr inbounds %struct.arc* %sigma_node54, i32 1
  br label %for.cond14

for.end35:                                        ; preds = %for.cond14
  %sigma_node60 = phi i8* [ %phi_node59, %for.cond14 ]
  %sigma_node57 = phi %struct.arc* [ %115, %for.cond14 ]
  %sigma_node55 = phi %struct.arc* [ %arc.1, %for.cond14 ]
  %conv = sitofp i64 %fleet.0 to double
  %bigM36 = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %221 = ptrtoint i64* %bigM36 to i64
  %222 = lshr i64 %221, 3
  %223 = or i64 %222, 17592186044416
  %224 = inttoptr i64 %223 to i8*
  %225 = load i8* %224
  %226 = icmp ne i8 %225, 0
  br i1 %226, label %227, label %228

; <label>:227                                     ; preds = %for.end35
  call void @__asan_report_load8(i64 %221)
  call void asm sideeffect "", ""()
  unreachable

; <label>:228                                     ; preds = %for.end35
  %229 = load i64* %bigM36, align 8
  %conv37 = sitofp i64 %229 to double
  %mul = fmul double %conv, %conv37
  %conv38 = sitofp i64 %operational_cost.0 to double
  %add39 = fadd double %mul, %conv38
  ret double %add39
}

define i64 @primal_feasible(%struct.network* %net) address_safety nounwind {
entry:
  %dummy_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 25
  %0 = ptrtoint %struct.arc** %dummy_arcs to i64
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
  %8 = load %struct.arc** %dummy_arcs, align 8
  %stop_dummy1 = getelementptr inbounds %struct.network* %net, i32 0, i32 26
  %9 = ptrtoint %struct.arc** %stop_dummy1 to i64
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
  %17 = load %struct.arc** %stop_dummy1, align 8
  %nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %18 = ptrtoint %struct.node** %nodes to i64
  %19 = lshr i64 %18, 3
  %20 = or i64 %19, 17592186044416
  %21 = inttoptr i64 %20 to i8*
  %22 = load i8* %21
  %23 = icmp ne i8 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %16
  call void @__asan_report_load8(i64 %18)
  call void asm sideeffect "", ""()
  unreachable

; <label>:25                                      ; preds = %16
  %26 = load %struct.node** %nodes, align 8
  %stop_nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 22
  %27 = ptrtoint %struct.node** %stop_nodes to i64
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
  %35 = load %struct.node** %stop_nodes, align 8
  %36 = bitcast %struct.node* %35 to i8*
  %incdec.ptr = getelementptr inbounds %struct.node* %26, i32 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %34
  %phi_node = phi i8* [ %sigma_node25, %for.inc ], [ %36, %34 ]
  %node.0 = phi %struct.node* [ %incdec.ptr, %34 ], [ %incdec.ptr20, %for.inc ]
  %37 = bitcast i8* %phi_node to %struct.node*
  %cmp = icmp ult %struct.node* %node.0, %37
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node25 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node23 = phi %struct.node* [ %37, %for.cond ]
  %sigma_node = phi %struct.node* [ %node.0, %for.cond ]
  %basic_arc = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 6
  %38 = ptrtoint %struct.arc** %basic_arc to i64
  %39 = lshr i64 %38, 3
  %40 = or i64 %39, 17592186044416
  %41 = inttoptr i64 %40 to i8*
  %42 = load i8* %41
  %43 = icmp ne i8 %42, 0
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %for.body
  call void @__asan_report_load8(i64 %38)
  call void asm sideeffect "", ""()
  unreachable

; <label>:45                                      ; preds = %for.body
  %46 = load %struct.arc** %basic_arc, align 8
  %flow2 = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 10
  %47 = ptrtoint i64* %flow2 to i64
  %48 = lshr i64 %47, 3
  %49 = or i64 %48, 17592186044416
  %50 = inttoptr i64 %49 to i8*
  %51 = load i8* %50
  %52 = icmp ne i8 %51, 0
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %45
  call void @__asan_report_load8(i64 %47)
  call void asm sideeffect "", ""()
  unreachable

; <label>:54                                      ; preds = %45
  %55 = load i64* %flow2, align 8
  %cmp3 = icmp uge %struct.arc* %46, %8
  br i1 %cmp3, label %land.lhs.true, label %for.body.if.else_crit_edge

for.body.if.else_crit_edge:                       ; preds = %54
  %sigma_node30 = phi %struct.arc* [ %8, %54 ]
  %sigma_node28 = phi %struct.arc* [ %46, %54 ]
  br label %if.else

land.lhs.true:                                    ; preds = %54
  %sigma_node29 = phi %struct.arc* [ %8, %54 ]
  %sigma_node27 = phi %struct.arc* [ %46, %54 ]
  %cmp4 = icmp ult %struct.arc* %sigma_node27, %17
  br i1 %cmp4, label %if.then, label %land.lhs.true.if.else_crit_edge

land.lhs.true.if.else_crit_edge:                  ; preds = %land.lhs.true
  %sigma_node34 = phi %struct.arc* [ %17, %land.lhs.true ]
  %sigma_node32 = phi %struct.arc* [ %sigma_node27, %land.lhs.true ]
  br label %if.else

if.then:                                          ; preds = %land.lhs.true
  %sigma_node33 = phi %struct.arc* [ %17, %land.lhs.true ]
  %sigma_node31 = phi %struct.arc* [ %sigma_node27, %land.lhs.true ]
  %cmp5 = icmp sge i64 %55, 0
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %sigma_node35 = phi i64 [ %55, %if.then ]
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %sigma_node37 = phi i64 [ %55, %if.then ]
  %sub = sub nsw i64 0, %sigma_node37
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %phi_node36 = phi i64 [ %sigma_node35, %cond.true ], [ %sigma_node37, %cond.false ]
  %cond = phi i64 [ %sigma_node35, %cond.true ], [ %sub, %cond.false ]
  %feas_tol = getelementptr inbounds %struct.network* %net, i32 0, i32 16
  %56 = ptrtoint i64* %feas_tol to i64
  %57 = lshr i64 %56, 3
  %58 = or i64 %57, 17592186044416
  %59 = inttoptr i64 %58 to i8*
  %60 = load i8* %59
  %61 = icmp ne i8 %60, 0
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %cond.end
  call void @__asan_report_load8(i64 %56)
  call void asm sideeffect "", ""()
  unreachable

; <label>:63                                      ; preds = %cond.end
  %64 = load i64* %feas_tol, align 8
  %cmp6 = icmp sgt i64 %cond, %64
  br i1 %cmp6, label %if.then7, label %cond.end.if.end_crit_edge

cond.end.if.end_crit_edge:                        ; preds = %63
  %sigma_node41 = phi i64 [ %64, %63 ]
  %sigma_node39 = phi i64 [ %cond, %63 ]
  br label %if.end

if.then7:                                         ; preds = %63
  %sigma_node40 = phi i64 [ %64, %63 ]
  %sigma_node38 = phi i64 [ %cond, %63 ]
  br label %if.then7.split

if.then7.split:                                   ; preds = %if.then7
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [25 x i8], [39 x i8] }* @.str, i32 0, i32 0, i32 0))
  %number = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 12
  %65 = ptrtoint i32* %number to i64
  %66 = lshr i64 %65, 3
  %67 = or i64 %66, 17592186044416
  %68 = inttoptr i64 %67 to i8*
  %69 = load i8* %68
  %70 = icmp ne i8 %69, 0
  br i1 %70, label %71, label %77

; <label>:71                                      ; preds = %if.then7.split
  %72 = and i64 %65, 7
  %73 = add i64 %72, 3
  %74 = trunc i64 %73 to i8
  %75 = icmp sge i8 %74, %69
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %71
  call void @__asan_report_load4(i64 %65)
  call void asm sideeffect "", ""()
  unreachable

; <label>:77                                      ; preds = %71, %if.then7.split
  %78 = load i32* %number, align 4
  br label %if.then7.split.split

if.then7.split.split:                             ; preds = %77
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [49 x i8], [47 x i8] }* @.str1, i32 0, i32 0, i32 0), i32 %78, i64 %phi_node36)
  br label %if.end

if.end:                                           ; preds = %cond.end.if.end_crit_edge, %if.then7.split.split
  br label %if.end19

if.else:                                          ; preds = %land.lhs.true.if.else_crit_edge, %for.body.if.else_crit_edge
  %feas_tol9 = getelementptr inbounds %struct.network* %net, i32 0, i32 16
  %79 = ptrtoint i64* %feas_tol9 to i64
  %80 = lshr i64 %79, 3
  %81 = or i64 %80, 17592186044416
  %82 = inttoptr i64 %81 to i8*
  %83 = load i8* %82
  %84 = icmp ne i8 %83, 0
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %if.else
  call void @__asan_report_load8(i64 %79)
  call void asm sideeffect "", ""()
  unreachable

; <label>:86                                      ; preds = %if.else
  %87 = load i64* %feas_tol9, align 8
  %sub10 = sub nsw i64 0, %87
  %cmp11 = icmp slt i64 %55, %sub10
  br i1 %cmp11, label %if.else.if.then15_crit_edge, label %lor.lhs.false

if.else.if.then15_crit_edge:                      ; preds = %86
  %sigma_node45 = phi i64 [ %sub10, %86 ]
  %sigma_node42 = phi i64 [ %55, %86 ]
  br label %if.then15

lor.lhs.false:                                    ; preds = %86
  %sigma_node46 = phi i64 [ %sub10, %86 ]
  %sigma_node44 = phi i64 [ %55, %86 ]
  %sub12 = sub nsw i64 %sigma_node44, 1
  %feas_tol13 = getelementptr inbounds %struct.network* %net, i32 0, i32 16
  %88 = ptrtoint i64* %feas_tol13 to i64
  %89 = lshr i64 %88, 3
  %90 = or i64 %89, 17592186044416
  %91 = inttoptr i64 %90 to i8*
  %92 = load i8* %91
  %93 = icmp ne i8 %92, 0
  br i1 %93, label %94, label %95

; <label>:94                                      ; preds = %lor.lhs.false
  call void @__asan_report_load8(i64 %88)
  call void asm sideeffect "", ""()
  unreachable

; <label>:95                                      ; preds = %lor.lhs.false
  %96 = load i64* %feas_tol13, align 8
  %cmp14 = icmp sgt i64 %sub12, %96
  br i1 %cmp14, label %lor.lhs.false.if.then15_crit_edge, label %if.end18

lor.lhs.false.if.then15_crit_edge:                ; preds = %95
  %sigma_node49 = phi i64 [ %96, %95 ]
  %sigma_node47 = phi i64 [ %sub12, %95 ]
  br label %if.then15

if.then15:                                        ; preds = %lor.lhs.false.if.then15_crit_edge, %if.else.if.then15_crit_edge
  %phi_node43 = phi i64 [ %sigma_node42, %if.else.if.then15_crit_edge ], [ %sigma_node44, %lor.lhs.false.if.then15_crit_edge ]
  br label %if.then15.split

if.then15.split:                                  ; preds = %if.then15
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [25 x i8], [39 x i8] }* @.str, i32 0, i32 0, i32 0))
  br label %if.then15.split.split

if.then15.split.split:                            ; preds = %if.then15.split
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [31 x i8], [33 x i8] }* @.str2, i32 0, i32 0, i32 0), i64 %phi_node43)
  %feasible = getelementptr inbounds %struct.network* %net, i32 0, i32 13
  %97 = ptrtoint i64* %feasible to i64
  %98 = lshr i64 %97, 3
  %99 = or i64 %98, 17592186044416
  %100 = inttoptr i64 %99 to i8*
  %101 = load i8* %100
  %102 = icmp ne i8 %101, 0
  br i1 %102, label %103, label %104

; <label>:103                                     ; preds = %if.then15.split.split
  call void @__asan_report_store8(i64 %97)
  call void asm sideeffect "", ""()
  unreachable

; <label>:104                                     ; preds = %if.then15.split.split
  store i64 0, i64* %feasible, align 8
  br label %return

if.end18:                                         ; preds = %95
  %sigma_node50 = phi i64 [ %96, %95 ]
  %sigma_node48 = phi i64 [ %sub12, %95 ]
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end19
  %incdec.ptr20 = getelementptr inbounds %struct.node* %sigma_node, i32 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node26 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node24 = phi %struct.node* [ %37, %for.cond ]
  %sigma_node22 = phi %struct.node* [ %node.0, %for.cond ]
  %feasible21 = getelementptr inbounds %struct.network* %net, i32 0, i32 13
  %105 = ptrtoint i64* %feasible21 to i64
  %106 = lshr i64 %105, 3
  %107 = or i64 %106, 17592186044416
  %108 = inttoptr i64 %107 to i8*
  %109 = load i8* %108
  %110 = icmp ne i8 %109, 0
  br i1 %110, label %111, label %112

; <label>:111                                     ; preds = %for.end
  call void @__asan_report_store8(i64 %105)
  call void asm sideeffect "", ""()
  unreachable

; <label>:112                                     ; preds = %for.end
  store i64 1, i64* %feasible21, align 8
  br label %return

return:                                           ; preds = %112, %104
  %retval.0 = phi i64 [ 1, %104 ], [ 0, %112 ]
  ret i64 %retval.0
}

declare i32 @printf(i8*, ...)

define i64 @dual_feasible(%struct.network* %net) address_safety nounwind {
entry:
  %stop_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %0 = ptrtoint %struct.arc** %stop_arcs to i64
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
  %8 = load %struct.arc** %stop_arcs, align 8
  %arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %9 = ptrtoint %struct.arc** %arcs to i64
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
  %17 = load %struct.arc** %arcs, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %16
  %phi_node = phi %struct.arc* [ %sigma_node13, %for.inc ], [ %8, %16 ]
  %arc.0 = phi %struct.arc* [ %17, %16 ], [ %incdec.ptr, %for.inc ]
  %cmp = icmp ult %struct.arc* %arc.0, %phi_node
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node13 = phi %struct.arc* [ %phi_node, %for.cond ]
  %sigma_node = phi %struct.arc* [ %arc.0, %for.cond ]
  %cost = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 0
  %18 = ptrtoint i64* %cost to i64
  %19 = lshr i64 %18, 3
  %20 = or i64 %19, 17592186044416
  %21 = inttoptr i64 %20 to i8*
  %22 = load i8* %21
  %23 = icmp ne i8 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %for.body
  call void @__asan_report_load8(i64 %18)
  call void asm sideeffect "", ""()
  unreachable

; <label>:25                                      ; preds = %for.body
  %26 = load i64* %cost, align 8
  %tail = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 1
  %27 = ptrtoint %struct.node** %tail to i64
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
  %35 = load %struct.node** %tail, align 8
  %potential = getelementptr inbounds %struct.node* %35, i32 0, i32 0
  %36 = ptrtoint i64* %potential to i64
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
  %44 = load i64* %potential, align 8
  %sub = sub nsw i64 %26, %44
  %head = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 2
  %45 = ptrtoint %struct.node** %head to i64
  %46 = lshr i64 %45, 3
  %47 = or i64 %46, 17592186044416
  %48 = inttoptr i64 %47 to i8*
  %49 = load i8* %48
  %50 = icmp ne i8 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %43
  call void @__asan_report_load8(i64 %45)
  call void asm sideeffect "", ""()
  unreachable

; <label>:52                                      ; preds = %43
  %53 = load %struct.node** %head, align 8
  %potential1 = getelementptr inbounds %struct.node* %53, i32 0, i32 0
  %54 = ptrtoint i64* %potential1 to i64
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
  %62 = load i64* %potential1, align 8
  %add = add nsw i64 %sub, %62
  %ident = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 3
  %63 = ptrtoint i32* %ident to i64
  %64 = lshr i64 %63, 3
  %65 = or i64 %64, 17592186044416
  %66 = inttoptr i64 %65 to i8*
  %67 = load i8* %66
  %68 = icmp ne i8 %67, 0
  br i1 %68, label %69, label %75

; <label>:69                                      ; preds = %61
  %70 = and i64 %63, 7
  %71 = add i64 %70, 3
  %72 = trunc i64 %71 to i8
  %73 = icmp sge i8 %72, %67
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %69
  call void @__asan_report_load4(i64 %63)
  call void asm sideeffect "", ""()
  unreachable

; <label>:75                                      ; preds = %69, %61
  %76 = load i32* %ident, align 4
  switch i32 %76, label %for.body.sw.default_crit_edge [
    i32 0, label %for.body.sw.bb_crit_edge
    i32 1, label %for.body.sw.bb_crit_edge11
    i32 2, label %sw.bb4
    i32 -1, label %sw.bb9
  ]

for.body.sw.bb_crit_edge11:                       ; preds = %75
  br label %sw.bb

for.body.sw.bb_crit_edge:                         ; preds = %75
  br label %sw.bb

for.body.sw.default_crit_edge:                    ; preds = %75
  br label %sw.default

sw.bb:                                            ; preds = %for.body.sw.bb_crit_edge11, %for.body.sw.bb_crit_edge
  %feas_tol = getelementptr inbounds %struct.network* %net, i32 0, i32 16
  %77 = ptrtoint i64* %feas_tol to i64
  %78 = lshr i64 %77, 3
  %79 = or i64 %78, 17592186044416
  %80 = inttoptr i64 %79 to i8*
  %81 = load i8* %80
  %82 = icmp ne i8 %81, 0
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %sw.bb
  call void @__asan_report_load8(i64 %77)
  call void asm sideeffect "", ""()
  unreachable

; <label>:84                                      ; preds = %sw.bb
  %85 = load i64* %feas_tol, align 8
  %sub2 = sub nsw i64 0, %85
  %cmp3 = icmp slt i64 %add, %sub2
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %84
  %sigma_node17 = phi i64 [ %sub2, %84 ]
  %sigma_node15 = phi i64 [ %add, %84 ]
  br label %DUAL_INFEAS

if.end:                                           ; preds = %84
  %sigma_node18 = phi i64 [ %sub2, %84 ]
  %sigma_node16 = phi i64 [ %add, %84 ]
  br label %sw.epilog

sw.bb4:                                           ; preds = %75
  %feas_tol5 = getelementptr inbounds %struct.network* %net, i32 0, i32 16
  %86 = ptrtoint i64* %feas_tol5 to i64
  %87 = lshr i64 %86, 3
  %88 = or i64 %87, 17592186044416
  %89 = inttoptr i64 %88 to i8*
  %90 = load i8* %89
  %91 = icmp ne i8 %90, 0
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %sw.bb4
  call void @__asan_report_load8(i64 %86)
  call void asm sideeffect "", ""()
  unreachable

; <label>:93                                      ; preds = %sw.bb4
  %94 = load i64* %feas_tol5, align 8
  %cmp6 = icmp sgt i64 %add, %94
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %93
  %sigma_node21 = phi i64 [ %94, %93 ]
  %sigma_node19 = phi i64 [ %add, %93 ]
  br label %DUAL_INFEAS

if.end8:                                          ; preds = %93
  %sigma_node22 = phi i64 [ %94, %93 ]
  %sigma_node20 = phi i64 [ %add, %93 ]
  br label %sw.epilog

sw.bb9:                                           ; preds = %75
  br label %sw.default

sw.default:                                       ; preds = %for.body.sw.default_crit_edge, %sw.bb9
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %if.end8, %if.end
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog
  %incdec.ptr = getelementptr inbounds %struct.arc* %sigma_node, i32 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node14 = phi %struct.arc* [ %phi_node, %for.cond ]
  %sigma_node12 = phi %struct.arc* [ %arc.0, %for.cond ]
  br label %return

DUAL_INFEAS:                                      ; preds = %if.then7, %if.then
  %95 = load %struct._IO_FILE** @stderr, align 8
  br label %DUAL_INFEAS.split

DUAL_INFEAS.split:                                ; preds = %DUAL_INFEAS
  %omega_node = phi %struct._IO_FILE* [ %95, %DUAL_INFEAS ]
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %omega_node, i8* getelementptr inbounds ({ [23 x i8], [41 x i8] }* @.str3, i32 0, i32 0, i32 0))
  %96 = load %struct._IO_FILE** @stderr, align 8
  br label %DUAL_INFEAS.split.split

DUAL_INFEAS.split.split:                          ; preds = %DUAL_INFEAS.split
  %omega_node23 = phi %struct._IO_FILE* [ %96, %DUAL_INFEAS.split ]
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %omega_node23, i8* getelementptr inbounds ({ [23 x i8], [41 x i8] }* @.str4, i32 0, i32 0, i32 0))
  br label %return

return:                                           ; preds = %DUAL_INFEAS.split.split, %for.end
  %retval.0 = phi i64 [ 1, %DUAL_INFEAS.split.split ], [ 0, %for.end ]
  ret i64 %retval.0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...)

define i64 @getfree(%struct.network* %net) address_safety nounwind {
entry:
  %nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %0 = ptrtoint %struct.node** %nodes to i64
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
  %8 = load %struct.node** %nodes, align 8
  %tobool = icmp ne %struct.node* %8, null
  br i1 %tobool, label %if.then, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %7
  %sigma_node13 = phi %struct.node* [ %8, %7 ]
  br label %if.end

if.then:                                          ; preds = %7
  %sigma_node = phi %struct.node* [ %8, %7 ]
  %nodes1 = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %9 = ptrtoint %struct.node** %nodes1 to i64
  %10 = lshr i64 %9, 3
  %11 = or i64 %10, 17592186044416
  %12 = inttoptr i64 %11 to i8*
  %13 = load i8* %12
  %14 = icmp ne i8 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %if.then
  call void @__asan_report_load8(i64 %9)
  call void asm sideeffect "", ""()
  unreachable

; <label>:16                                      ; preds = %if.then
  %17 = load %struct.node** %nodes1, align 8
  %18 = bitcast %struct.node* %17 to i8*
  br label %if.then.split

if.then.split:                                    ; preds = %16
  %omega_node = phi i8* [ %18, %16 ]
  call void @free(i8* %omega_node) nounwind
  br label %if.end

if.end:                                           ; preds = %entry.if.end_crit_edge, %if.then.split
  %arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %19 = ptrtoint %struct.arc** %arcs to i64
  %20 = lshr i64 %19, 3
  %21 = or i64 %20, 17592186044416
  %22 = inttoptr i64 %21 to i8*
  %23 = load i8* %22
  %24 = icmp ne i8 %23, 0
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %if.end
  call void @__asan_report_load8(i64 %19)
  call void asm sideeffect "", ""()
  unreachable

; <label>:26                                      ; preds = %if.end
  %27 = load %struct.arc** %arcs, align 8
  %tobool2 = icmp ne %struct.arc* %27, null
  br i1 %tobool2, label %if.then3, label %if.end.if.end5_crit_edge

if.end.if.end5_crit_edge:                         ; preds = %26
  %sigma_node15 = phi %struct.arc* [ %27, %26 ]
  br label %if.end5

if.then3:                                         ; preds = %26
  %sigma_node14 = phi %struct.arc* [ %27, %26 ]
  %arcs4 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %28 = ptrtoint %struct.arc** %arcs4 to i64
  %29 = lshr i64 %28, 3
  %30 = or i64 %29, 17592186044416
  %31 = inttoptr i64 %30 to i8*
  %32 = load i8* %31
  %33 = icmp ne i8 %32, 0
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %if.then3
  call void @__asan_report_load8(i64 %28)
  call void asm sideeffect "", ""()
  unreachable

; <label>:35                                      ; preds = %if.then3
  %36 = load %struct.arc** %arcs4, align 8
  %37 = bitcast %struct.arc* %36 to i8*
  br label %if.then3.split

if.then3.split:                                   ; preds = %35
  %omega_node18 = phi i8* [ %37, %35 ]
  call void @free(i8* %omega_node18) nounwind
  br label %if.end5

if.end5:                                          ; preds = %if.end.if.end5_crit_edge, %if.then3.split
  %dummy_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 25
  %38 = ptrtoint %struct.arc** %dummy_arcs to i64
  %39 = lshr i64 %38, 3
  %40 = or i64 %39, 17592186044416
  %41 = inttoptr i64 %40 to i8*
  %42 = load i8* %41
  %43 = icmp ne i8 %42, 0
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %if.end5
  call void @__asan_report_load8(i64 %38)
  call void asm sideeffect "", ""()
  unreachable

; <label>:45                                      ; preds = %if.end5
  %46 = load %struct.arc** %dummy_arcs, align 8
  %tobool6 = icmp ne %struct.arc* %46, null
  br i1 %tobool6, label %if.then7, label %if.end5.if.end9_crit_edge

if.end5.if.end9_crit_edge:                        ; preds = %45
  %sigma_node17 = phi %struct.arc* [ %46, %45 ]
  br label %if.end9

if.then7:                                         ; preds = %45
  %sigma_node16 = phi %struct.arc* [ %46, %45 ]
  %dummy_arcs8 = getelementptr inbounds %struct.network* %net, i32 0, i32 25
  %47 = ptrtoint %struct.arc** %dummy_arcs8 to i64
  %48 = lshr i64 %47, 3
  %49 = or i64 %48, 17592186044416
  %50 = inttoptr i64 %49 to i8*
  %51 = load i8* %50
  %52 = icmp ne i8 %51, 0
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %if.then7
  call void @__asan_report_load8(i64 %47)
  call void asm sideeffect "", ""()
  unreachable

; <label>:54                                      ; preds = %if.then7
  %55 = load %struct.arc** %dummy_arcs8, align 8
  %56 = bitcast %struct.arc* %55 to i8*
  br label %if.then7.split

if.then7.split:                                   ; preds = %54
  %omega_node19 = phi i8* [ %56, %54 ]
  call void @free(i8* %omega_node19) nounwind
  br label %if.end9

if.end9:                                          ; preds = %if.end5.if.end9_crit_edge, %if.then7.split
  %stop_nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 22
  %57 = ptrtoint %struct.node** %stop_nodes to i64
  %58 = lshr i64 %57, 3
  %59 = or i64 %58, 17592186044416
  %60 = inttoptr i64 %59 to i8*
  %61 = load i8* %60
  %62 = icmp ne i8 %61, 0
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %if.end9
  call void @__asan_report_store8(i64 %57)
  call void asm sideeffect "", ""()
  unreachable

; <label>:64                                      ; preds = %if.end9
  store %struct.node* null, %struct.node** %stop_nodes, align 8
  %nodes10 = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %65 = ptrtoint %struct.node** %nodes10 to i64
  %66 = lshr i64 %65, 3
  %67 = or i64 %66, 17592186044416
  %68 = inttoptr i64 %67 to i8*
  %69 = load i8* %68
  %70 = icmp ne i8 %69, 0
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %64
  call void @__asan_report_store8(i64 %65)
  call void asm sideeffect "", ""()
  unreachable

; <label>:72                                      ; preds = %64
  store %struct.node* null, %struct.node** %nodes10, align 8
  %stop_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %73 = ptrtoint %struct.arc** %stop_arcs to i64
  %74 = lshr i64 %73, 3
  %75 = or i64 %74, 17592186044416
  %76 = inttoptr i64 %75 to i8*
  %77 = load i8* %76
  %78 = icmp ne i8 %77, 0
  br i1 %78, label %79, label %80

; <label>:79                                      ; preds = %72
  call void @__asan_report_store8(i64 %73)
  call void asm sideeffect "", ""()
  unreachable

; <label>:80                                      ; preds = %72
  store %struct.arc* null, %struct.arc** %stop_arcs, align 8
  %arcs11 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %81 = ptrtoint %struct.arc** %arcs11 to i64
  %82 = lshr i64 %81, 3
  %83 = or i64 %82, 17592186044416
  %84 = inttoptr i64 %83 to i8*
  %85 = load i8* %84
  %86 = icmp ne i8 %85, 0
  br i1 %86, label %87, label %88

; <label>:87                                      ; preds = %80
  call void @__asan_report_store8(i64 %81)
  call void asm sideeffect "", ""()
  unreachable

; <label>:88                                      ; preds = %80
  store %struct.arc* null, %struct.arc** %arcs11, align 8
  %stop_dummy = getelementptr inbounds %struct.network* %net, i32 0, i32 26
  %89 = ptrtoint %struct.arc** %stop_dummy to i64
  %90 = lshr i64 %89, 3
  %91 = or i64 %90, 17592186044416
  %92 = inttoptr i64 %91 to i8*
  %93 = load i8* %92
  %94 = icmp ne i8 %93, 0
  br i1 %94, label %95, label %96

; <label>:95                                      ; preds = %88
  call void @__asan_report_store8(i64 %89)
  call void asm sideeffect "", ""()
  unreachable

; <label>:96                                      ; preds = %88
  store %struct.arc* null, %struct.arc** %stop_dummy, align 8
  %dummy_arcs12 = getelementptr inbounds %struct.network* %net, i32 0, i32 25
  %97 = ptrtoint %struct.arc** %dummy_arcs12 to i64
  %98 = lshr i64 %97, 3
  %99 = or i64 %98, 17592186044416
  %100 = inttoptr i64 %99 to i8*
  %101 = load i8* %100
  %102 = icmp ne i8 %101, 0
  br i1 %102, label %103, label %104

; <label>:103                                     ; preds = %96
  call void @__asan_report_store8(i64 %97)
  call void asm sideeffect "", ""()
  unreachable

; <label>:104                                     ; preds = %96
  store %struct.arc* null, %struct.arc** %dummy_arcs12, align 8
  ret i64 0
}

declare void @free(i8*) nounwind

define internal void @asan.module_ctor() {
  call void @__asan_init()
  %1 = load volatile i64* @__asan_mapping_offset
  %2 = load volatile i64* @__asan_mapping_scale
  call void @__asan_register_globals(i64 ptrtoint ([5 x { i64, i64, i64, i64, i64 }]* @0 to i64), i64 5)
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
  call void @__asan_unregister_globals(i64 ptrtoint ([5 x { i64, i64, i64, i64, i64 }]* @0 to i64), i64 5)
  ret void
}
