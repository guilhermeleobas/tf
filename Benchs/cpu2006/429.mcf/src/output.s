; ModuleID = 'output.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.network = type { [200 x i8], [200 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double, i64, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i64 }
%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant { [2 x i8], [62 x i8] } { [2 x i8] c"w\00", [62 x i8] zeroinitializer }, align 32
@.str1 = private unnamed_addr constant { [4 x i8], [60 x i8] } { [4 x i8] c"()\0A\00", [60 x i8] zeroinitializer }, align 32
@.str2 = private unnamed_addr constant { [5 x i8], [59 x i8] } { [5 x i8] c"***\0A\00", [59 x i8] zeroinitializer }, align 32
@.str3 = private unnamed_addr constant { [4 x i8], [60 x i8] } { [4 x i8] c"%d\0A\00", [60 x i8] zeroinitializer }, align 32
@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]
@__asan_gen_ = private constant [16 x i8] c".str (output.c)\00"
@__asan_gen_4 = private constant [17 x i8] c".str1 (output.c)\00"
@__asan_gen_5 = private constant [17 x i8] c".str2 (output.c)\00"
@__asan_gen_6 = private constant [17 x i8] c".str3 (output.c)\00"
@0 = private global [4 x { i64, i64, i64, i64, i64 }] [{ i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [2 x i8], [62 x i8] }* @.str to i64), i64 2, i64 64, i64 ptrtoint ([16 x i8]* @__asan_gen_ to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [4 x i8], [60 x i8] }* @.str1 to i64), i64 4, i64 64, i64 ptrtoint ([17 x i8]* @__asan_gen_4 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [5 x i8], [59 x i8] }* @.str2 to i64), i64 5, i64 64, i64 ptrtoint ([17 x i8]* @__asan_gen_5 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [4 x i8], [60 x i8] }* @.str3 to i64), i64 4, i64 64, i64 ptrtoint ([17 x i8]* @__asan_gen_6 to i64), i64 0 }]
@llvm.global_dtors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_dtor }]

define i64 @write_circulations(i8* %outfile, %struct.network* %net) address_safety nounwind {
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
  %m_impl = getelementptr inbounds %struct.network* %net, i32 0, i32 7
  %9 = ptrtoint i64* %m_impl to i64
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
  %17 = load i64* %m_impl, align 8
  %idx.neg = sub i64 0, %17
  %add.ptr = getelementptr inbounds %struct.arc* %8, i64 %idx.neg
  br label %entry.split

entry.split:                                      ; preds = %16
  %omega_node = phi i8* [ %outfile, %16 ]
  %call = call %struct._IO_FILE* @fopen(i8* %omega_node, i8* getelementptr inbounds ({ [2 x i8], [62 x i8] }* @.str, i32 0, i32 0, i32 0))
  %cmp = icmp eq %struct._IO_FILE* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split
  %sigma_node = phi %struct._IO_FILE* [ %call, %entry.split ]
  br label %return

if.end:                                           ; preds = %entry.split
  %sigma_node34 = phi %struct._IO_FILE* [ %call, %entry.split ]
  br label %if.end.split

if.end.split:                                     ; preds = %if.end
  %omega_node54 = phi %struct.network* [ %net, %if.end ]
  call void @refresh_neighbour_lists(%struct.network* %omega_node54)
  %n = getelementptr inbounds %struct.network* %omega_node54, i32 0, i32 2
  %18 = ptrtoint i64* %n to i64
  %19 = lshr i64 %18, 3
  %20 = or i64 %19, 17592186044416
  %21 = inttoptr i64 %20 to i8*
  %22 = load i8* %21
  %23 = icmp ne i8 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %if.end.split
  call void @__asan_report_load8(i64 %18)
  call void asm sideeffect "", ""()
  unreachable

; <label>:25                                      ; preds = %if.end.split
  %26 = load i64* %n, align 8
  %nodes = getelementptr inbounds %struct.network* %omega_node54, i32 0, i32 21
  %27 = ptrtoint %struct.node** %nodes to i64
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
  %35 = load %struct.node** %nodes, align 8
  %arrayidx = getelementptr inbounds %struct.node* %35, i64 %26
  %firstout = getelementptr inbounds %struct.node* %arrayidx, i32 0, i32 7
  %36 = ptrtoint %struct.arc** %firstout to i64
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
  %44 = load %struct.arc** %firstout, align 8
  br label %for.cond

for.cond:                                         ; preds = %152, %43
  %block.0 = phi %struct.arc* [ %44, %43 ], [ %153, %152 ]
  %tobool = icmp ne %struct.arc* %block.0, null
  br i1 %tobool, label %for.body, label %for.end32

for.body:                                         ; preds = %for.cond
  %sigma_node35 = phi %struct.arc* [ %block.0, %for.cond ]
  %flow = getelementptr inbounds %struct.arc* %sigma_node35, i32 0, i32 6
  %45 = ptrtoint i64* %flow to i64
  %46 = lshr i64 %45, 3
  %47 = or i64 %46, 17592186044416
  %48 = inttoptr i64 %47 to i8*
  %49 = load i8* %48
  %50 = icmp ne i8 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %for.body
  call void @__asan_report_load8(i64 %45)
  call void asm sideeffect "", ""()
  unreachable

; <label>:52                                      ; preds = %for.body
  %53 = load i64* %flow, align 8
  %tobool1 = icmp ne i64 %53, 0
  br i1 %tobool1, label %if.then2, label %for.body.if.end29_crit_edge

for.body.if.end29_crit_edge:                      ; preds = %52
  %sigma_node38 = phi i64 [ %53, %52 ]
  br label %if.end29

if.then2:                                         ; preds = %52
  %sigma_node37 = phi i64 [ %53, %52 ]
  br label %if.then2.split

if.then2.split:                                   ; preds = %if.then2
  %omega_node55 = phi %struct._IO_FILE* [ %sigma_node34, %if.then2 ]
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %omega_node55, i8* getelementptr inbounds ({ [4 x i8], [60 x i8] }* @.str1, i32 0, i32 0, i32 0))
  br label %while.cond

while.cond:                                       ; preds = %if.end28, %if.then2.split
  %arc.0 = phi %struct.arc* [ %sigma_node35, %if.then2.split ], [ %arc.1, %if.end28 ]
  %tobool4 = icmp ne %struct.arc* %arc.0, null
  br i1 %tobool4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %sigma_node39 = phi %struct.arc* [ %arc.0, %while.cond ]
  %cmp5 = icmp uge %struct.arc* %sigma_node39, %add.ptr
  br i1 %cmp5, label %if.then6, label %while.body.if.end8_crit_edge

while.body.if.end8_crit_edge:                     ; preds = %while.body
  %sigma_node44 = phi %struct.arc* [ %add.ptr, %while.body ]
  %sigma_node42 = phi %struct.arc* [ %sigma_node39, %while.body ]
  br label %if.end8

if.then6:                                         ; preds = %while.body
  %sigma_node43 = phi %struct.arc* [ %add.ptr, %while.body ]
  %sigma_node41 = phi %struct.arc* [ %sigma_node39, %while.body ]
  br label %if.then6.split

if.then6.split:                                   ; preds = %if.then6
  %omega_node56 = phi %struct._IO_FILE* [ %omega_node55, %if.then6 ]
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %omega_node56, i8* getelementptr inbounds ({ [5 x i8], [59 x i8] }* @.str2, i32 0, i32 0, i32 0))
  br label %if.end8

if.end8:                                          ; preds = %while.body.if.end8_crit_edge, %if.then6.split
  %phi_node57 = phi %struct._IO_FILE* [ %omega_node55, %while.body.if.end8_crit_edge ], [ %omega_node56, %if.then6.split ]
  %phi_node = phi %struct.arc* [ %sigma_node41, %if.then6.split ], [ %sigma_node42, %while.body.if.end8_crit_edge ]
  %head = getelementptr inbounds %struct.arc* %phi_node, i32 0, i32 2
  %54 = ptrtoint %struct.node** %head to i64
  %55 = lshr i64 %54, 3
  %56 = or i64 %55, 17592186044416
  %57 = inttoptr i64 %56 to i8*
  %58 = load i8* %57
  %59 = icmp ne i8 %58, 0
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %if.end8
  call void @__asan_report_load8(i64 %54)
  call void asm sideeffect "", ""()
  unreachable

; <label>:61                                      ; preds = %if.end8
  %62 = load %struct.node** %head, align 8
  %number = getelementptr inbounds %struct.node* %62, i32 0, i32 12
  %63 = ptrtoint i32* %number to i64
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
  %76 = load i32* %number, align 4
  %sub = sub nsw i32 0, %76
  br label %if.end8.split

if.end8.split:                                    ; preds = %75
  %omega_node58 = phi %struct._IO_FILE* [ %phi_node57, %75 ]
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %omega_node58, i8* getelementptr inbounds ({ [4 x i8], [60 x i8] }* @.str3, i32 0, i32 0, i32 0), i32 %sub)
  %n_trips = getelementptr inbounds %struct.network* %omega_node54, i32 0, i32 3
  %77 = ptrtoint i64* %n_trips to i64
  %78 = lshr i64 %77, 3
  %79 = or i64 %78, 17592186044416
  %80 = inttoptr i64 %79 to i8*
  %81 = load i8* %80
  %82 = icmp ne i8 %81, 0
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %if.end8.split
  call void @__asan_report_load8(i64 %77)
  call void asm sideeffect "", ""()
  unreachable

; <label>:84                                      ; preds = %if.end8.split
  %85 = load i64* %n_trips, align 8
  %head10 = getelementptr inbounds %struct.arc* %phi_node, i32 0, i32 2
  %86 = ptrtoint %struct.node** %head10 to i64
  %87 = lshr i64 %86, 3
  %88 = or i64 %87, 17592186044416
  %89 = inttoptr i64 %88 to i8*
  %90 = load i8* %89
  %91 = icmp ne i8 %90, 0
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %84
  call void @__asan_report_load8(i64 %86)
  call void asm sideeffect "", ""()
  unreachable

; <label>:93                                      ; preds = %84
  %94 = load %struct.node** %head10, align 8
  %arrayidx11 = getelementptr inbounds %struct.node* %94, i64 %85
  %firstout12 = getelementptr inbounds %struct.node* %arrayidx11, i32 0, i32 7
  %95 = ptrtoint %struct.arc** %firstout12 to i64
  %96 = lshr i64 %95, 3
  %97 = or i64 %96, 17592186044416
  %98 = inttoptr i64 %97 to i8*
  %99 = load i8* %98
  %100 = icmp ne i8 %99, 0
  br i1 %100, label %101, label %102

; <label>:101                                     ; preds = %93
  call void @__asan_report_load8(i64 %95)
  call void asm sideeffect "", ""()
  unreachable

; <label>:102                                     ; preds = %93
  %103 = load %struct.arc** %firstout12, align 8
  br label %for.cond13

for.cond13:                                       ; preds = %120, %102
  %arc2.0 = phi %struct.arc* [ %103, %102 ], [ %121, %120 ]
  %tobool14 = icmp ne %struct.arc* %arc2.0, null
  br i1 %tobool14, label %for.body15, label %for.cond13.for.end_crit_edge

for.cond13.for.end_crit_edge:                     ; preds = %for.cond13
  %sigma_node47 = phi %struct.arc* [ %arc2.0, %for.cond13 ]
  br label %for.end

for.body15:                                       ; preds = %for.cond13
  %sigma_node45 = phi %struct.arc* [ %arc2.0, %for.cond13 ]
  %flow16 = getelementptr inbounds %struct.arc* %sigma_node45, i32 0, i32 6
  %104 = ptrtoint i64* %flow16 to i64
  %105 = lshr i64 %104, 3
  %106 = or i64 %105, 17592186044416
  %107 = inttoptr i64 %106 to i8*
  %108 = load i8* %107
  %109 = icmp ne i8 %108, 0
  br i1 %109, label %110, label %111

; <label>:110                                     ; preds = %for.body15
  call void @__asan_report_load8(i64 %104)
  call void asm sideeffect "", ""()
  unreachable

; <label>:111                                     ; preds = %for.body15
  %112 = load i64* %flow16, align 8
  %tobool17 = icmp ne i64 %112, 0
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %111
  %sigma_node50 = phi i64 [ %112, %111 ]
  br label %for.end

if.end19:                                         ; preds = %111
  %sigma_node51 = phi i64 [ %112, %111 ]
  br label %for.inc

for.inc:                                          ; preds = %if.end19
  %nextout = getelementptr inbounds %struct.arc* %sigma_node45, i32 0, i32 4
  %113 = ptrtoint %struct.arc** %nextout to i64
  %114 = lshr i64 %113, 3
  %115 = or i64 %114, 17592186044416
  %116 = inttoptr i64 %115 to i8*
  %117 = load i8* %116
  %118 = icmp ne i8 %117, 0
  br i1 %118, label %119, label %120

; <label>:119                                     ; preds = %for.inc
  call void @__asan_report_load8(i64 %113)
  call void asm sideeffect "", ""()
  unreachable

; <label>:120                                     ; preds = %for.inc
  %121 = load %struct.arc** %nextout, align 8
  br label %for.cond13

for.end:                                          ; preds = %for.cond13.for.end_crit_edge, %if.then18
  %phi_node46 = phi %struct.arc* [ %sigma_node45, %if.then18 ], [ %sigma_node47, %for.cond13.for.end_crit_edge ]
  %tobool20 = icmp ne %struct.arc* %phi_node46, null
  br i1 %tobool20, label %if.end23, label %if.then21

if.then21:                                        ; preds = %for.end
  %sigma_node49 = phi %struct.arc* [ %phi_node46, %for.end ]
  br label %if.then21.split

if.then21.split:                                  ; preds = %if.then21
  %omega_node59 = phi %struct._IO_FILE* [ %omega_node58, %if.then21 ]
  %call22 = call i32 @fclose(%struct._IO_FILE* %omega_node59)
  br label %return

if.end23:                                         ; preds = %for.end
  %sigma_node48 = phi %struct.arc* [ %phi_node46, %for.end ]
  %head24 = getelementptr inbounds %struct.arc* %sigma_node48, i32 0, i32 2
  %122 = ptrtoint %struct.node** %head24 to i64
  %123 = lshr i64 %122, 3
  %124 = or i64 %123, 17592186044416
  %125 = inttoptr i64 %124 to i8*
  %126 = load i8* %125
  %127 = icmp ne i8 %126, 0
  br i1 %127, label %128, label %129

; <label>:128                                     ; preds = %if.end23
  call void @__asan_report_load8(i64 %122)
  call void asm sideeffect "", ""()
  unreachable

; <label>:129                                     ; preds = %if.end23
  %130 = load %struct.node** %head24, align 8
  %number25 = getelementptr inbounds %struct.node* %130, i32 0, i32 12
  %131 = ptrtoint i32* %number25 to i64
  %132 = lshr i64 %131, 3
  %133 = or i64 %132, 17592186044416
  %134 = inttoptr i64 %133 to i8*
  %135 = load i8* %134
  %136 = icmp ne i8 %135, 0
  br i1 %136, label %137, label %143

; <label>:137                                     ; preds = %129
  %138 = and i64 %131, 7
  %139 = add i64 %138, 3
  %140 = trunc i64 %139 to i8
  %141 = icmp sge i8 %140, %135
  br i1 %141, label %142, label %143

; <label>:142                                     ; preds = %137
  call void @__asan_report_load4(i64 %131)
  call void asm sideeffect "", ""()
  unreachable

; <label>:143                                     ; preds = %137, %129
  %144 = load i32* %number25, align 4
  %tobool26 = icmp ne i32 %144, 0
  br i1 %tobool26, label %if.then27, label %if.else

if.then27:                                        ; preds = %143
  %sigma_node52 = phi i32 [ %144, %143 ]
  br label %if.end28

if.else:                                          ; preds = %143
  %sigma_node53 = phi i32 [ %144, %143 ]
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then27
  %arc.1 = phi %struct.arc* [ %sigma_node48, %if.then27 ], [ null, %if.else ]
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %sigma_node40 = phi %struct.arc* [ %arc.0, %while.cond ]
  br label %if.end29

if.end29:                                         ; preds = %for.body.if.end29_crit_edge, %while.end
  br label %for.inc30

for.inc30:                                        ; preds = %if.end29
  %nextout31 = getelementptr inbounds %struct.arc* %sigma_node35, i32 0, i32 4
  %145 = ptrtoint %struct.arc** %nextout31 to i64
  %146 = lshr i64 %145, 3
  %147 = or i64 %146, 17592186044416
  %148 = inttoptr i64 %147 to i8*
  %149 = load i8* %148
  %150 = icmp ne i8 %149, 0
  br i1 %150, label %151, label %152

; <label>:151                                     ; preds = %for.inc30
  call void @__asan_report_load8(i64 %145)
  call void asm sideeffect "", ""()
  unreachable

; <label>:152                                     ; preds = %for.inc30
  %153 = load %struct.arc** %nextout31, align 8
  br label %for.cond

for.end32:                                        ; preds = %for.cond
  %sigma_node36 = phi %struct.arc* [ %block.0, %for.cond ]
  br label %for.end32.split

for.end32.split:                                  ; preds = %for.end32
  %omega_node60 = phi %struct._IO_FILE* [ %sigma_node34, %for.end32 ]
  %call33 = call i32 @fclose(%struct._IO_FILE* %omega_node60)
  br label %return

return:                                           ; preds = %for.end32.split, %if.then21.split, %if.then
  %retval.0 = phi i64 [ -1, %if.then ], [ -1, %if.then21.split ], [ 0, %for.end32.split ]
  ret i64 %retval.0
}

declare %struct._IO_FILE* @fopen(i8*, i8*)

declare void @refresh_neighbour_lists(%struct.network*)

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...)

declare i32 @fclose(%struct._IO_FILE*)

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
