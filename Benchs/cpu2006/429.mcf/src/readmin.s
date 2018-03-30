; ModuleID = 'readmin.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.network = type { [200 x i8], [200 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double, i64, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i64 }
%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant { [2 x i8], [62 x i8] } { [2 x i8] c"r\00", [62 x i8] zeroinitializer }, align 32
@.str1 = private unnamed_addr constant { [8 x i8], [56 x i8] } { [8 x i8] c"%ld %ld\00", [56 x i8] zeroinitializer }, align 32
@.str2 = private unnamed_addr constant { [20 x i8], [44 x i8] } { [20 x i8] c"net->max_new_m >= 3\00", [44 x i8] zeroinitializer }, align 32
@.str3 = private unnamed_addr constant { [10 x i8], [54 x i8] } { [10 x i8] c"readmin.c\00", [54 x i8] zeroinitializer }, align 32
@__PRETTY_FUNCTION__.read_min = private unnamed_addr constant { [27 x i8], [37 x i8] } { [27 x i8] c"long read_min(network_t *)\00", [37 x i8] zeroinitializer }, align 32
@.str4 = private unnamed_addr constant { [31 x i8], [33 x i8] } { [31 x i8] c"read_min(): not enough memory\0A\00", [33 x i8] zeroinitializer }, align 32
@.str5 = private unnamed_addr constant { [12 x i8], [52 x i8] } { [12 x i8] c"%ld %ld %ld\00", [52 x i8] zeroinitializer }, align 32
@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]
@__asan_gen_ = private constant [60 x i8] c"read_min 4 32 201 8 instring 288 8 1 t 352 8 1 h 416 8 1 c \00"
@__asan_gen_6 = private constant [17 x i8] c".str (readmin.c)\00"
@__asan_gen_7 = private constant [18 x i8] c".str1 (readmin.c)\00"
@__asan_gen_8 = private constant [18 x i8] c".str2 (readmin.c)\00"
@__asan_gen_9 = private constant [18 x i8] c".str3 (readmin.c)\00"
@__asan_gen_10 = private constant [41 x i8] c"__PRETTY_FUNCTION__.read_min (readmin.c)\00"
@__asan_gen_11 = private constant [18 x i8] c".str4 (readmin.c)\00"
@__asan_gen_12 = private constant [18 x i8] c".str5 (readmin.c)\00"
@0 = private global [7 x { i64, i64, i64, i64, i64 }] [{ i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [2 x i8], [62 x i8] }* @.str to i64), i64 2, i64 64, i64 ptrtoint ([17 x i8]* @__asan_gen_6 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [8 x i8], [56 x i8] }* @.str1 to i64), i64 8, i64 64, i64 ptrtoint ([18 x i8]* @__asan_gen_7 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [20 x i8], [44 x i8] }* @.str2 to i64), i64 20, i64 64, i64 ptrtoint ([18 x i8]* @__asan_gen_8 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [10 x i8], [54 x i8] }* @.str3 to i64), i64 10, i64 64, i64 ptrtoint ([18 x i8]* @__asan_gen_9 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [27 x i8], [37 x i8] }* @__PRETTY_FUNCTION__.read_min to i64), i64 27, i64 64, i64 ptrtoint ([41 x i8]* @__asan_gen_10 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [31 x i8], [33 x i8] }* @.str4 to i64), i64 31, i64 64, i64 ptrtoint ([18 x i8]* @__asan_gen_11 to i64), i64 0 }, { i64, i64, i64, i64, i64 } { i64 ptrtoint ({ [12 x i8], [52 x i8] }* @.str5 to i64), i64 12, i64 64, i64 ptrtoint ([18 x i8]* @__asan_gen_12 to i64), i64 0 }]
@llvm.global_dtors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_dtor }]

define i64 @read_min(%struct.network* %net) address_safety nounwind {
entry:
  %MyAlloca = alloca [480 x i8], align 32
  %0 = ptrtoint [480 x i8]* %MyAlloca to i64
  %1 = add i64 %0, 32
  %2 = inttoptr i64 %1 to [201 x i8]*
  %3 = add i64 %0, 288
  %4 = inttoptr i64 %3 to i64*
  %5 = add i64 %0, 352
  %6 = inttoptr i64 %5 to i64*
  %7 = add i64 %0, 416
  %8 = inttoptr i64 %7 to i64*
  %9 = inttoptr i64 %0 to i64*
  store i64 1102416563, i64* %9
  %10 = add i64 %0, 8
  %11 = inttoptr i64 %10 to i64*
  store i64 ptrtoint ([60 x i8]* @__asan_gen_ to i64), i64* %11
  %12 = lshr i64 %0, 3
  %13 = or i64 %12, 17592186044416
  %14 = inttoptr i64 %13 to i32*
  store i32 -235802127, i32* %14
  %15 = add i64 %13, 28
  %16 = inttoptr i64 %15 to i32*
  store i32 -185335552, i32* %16
  %17 = add i64 %13, 32
  %18 = inttoptr i64 %17 to i32*
  store i32 -218959118, i32* %18
  %19 = add i64 %13, 36
  %20 = inttoptr i64 %19 to i32*
  store i32 -185273344, i32* %20
  %21 = add i64 %13, 40
  %22 = inttoptr i64 %21 to i32*
  store i32 -218959118, i32* %22
  %23 = add i64 %13, 44
  %24 = inttoptr i64 %23 to i32*
  store i32 -185273344, i32* %24
  %25 = add i64 %13, 48
  %26 = inttoptr i64 %25 to i32*
  store i32 -218959118, i32* %26
  %27 = add i64 %13, 52
  %28 = inttoptr i64 %27 to i32*
  store i32 -185273344, i32* %28
  %29 = add i64 %13, 56
  %30 = inttoptr i64 %29 to i32*
  store i32 -202116109, i32* %30
  %inputfile = getelementptr inbounds %struct.network* %net, i32 0, i32 0
  %arraydecay = getelementptr inbounds [200 x i8]* %inputfile, i32 0, i32 0
  br label %entry.split

entry.split:                                      ; preds = %entry
  %omega_node = phi i8* [ %arraydecay, %entry ]
  %call = call %struct._IO_FILE* @fopen(i8* %omega_node, i8* getelementptr inbounds ({ [2 x i8], [62 x i8] }* @.str, i32 0, i32 0, i32 0))
  %cmp = icmp eq %struct._IO_FILE* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split
  %sigma_node = phi %struct._IO_FILE* [ %call, %entry.split ]
  br label %return

if.end:                                           ; preds = %entry.split
  %sigma_node234 = phi %struct._IO_FILE* [ %call, %entry.split ]
  %arraydecay1 = getelementptr inbounds [201 x i8]* %2, i32 0, i32 0, !byte_size !0, !safe !1, !index_size !2
  br label %if.end.split

if.end.split:                                     ; preds = %if.end
  %omega_node286 = phi %struct._IO_FILE* [ %sigma_node234, %if.end ]
  %omega_node285 = phi i8* [ %arraydecay1, %if.end ], !byte_size !0, !safe !1, !index_size !2
  %call2 = call i8* @fgets(i8* %omega_node285, i32 200, %struct._IO_FILE* %omega_node286)
  %arraydecay3 = getelementptr inbounds [201 x i8]* %2, i32 0, i32 0, !byte_size !0, !safe !1, !index_size !2
  br label %if.end.split.split

if.end.split.split:                               ; preds = %if.end.split
  %omega_node289 = phi i64* [ %6, %if.end.split ], !byte_size !3, !safe !1
  %omega_node288 = phi i64* [ %4, %if.end.split ], !byte_size !3, !safe !1
  %omega_node287 = phi i8* [ %arraydecay3, %if.end.split ], !byte_size !0, !safe !1, !index_size !2
  %call4 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %omega_node287, i8* getelementptr inbounds ({ [8 x i8], [56 x i8] }* @.str1, i32 0, i32 0, i32 0), i64* %omega_node288, i64* %omega_node289) nounwind
  %cmp5 = icmp ne i32 %call4, 2
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end.split.split
  %sigma_node235 = phi i32 [ %call4, %if.end.split.split ]
  br label %return

if.end7:                                          ; preds = %if.end.split.split
  %sigma_node236 = phi i32 [ %call4, %if.end.split.split ]
  %31 = load i64* %omega_node288, align 8
  %n_trips = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %32 = ptrtoint i64* %n_trips to i64
  %33 = lshr i64 %32, 3
  %34 = or i64 %33, 17592186044416
  %35 = inttoptr i64 %34 to i8*
  %36 = load i8* %35
  %37 = icmp ne i8 %36, 0
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %if.end7
  call void @__asan_report_store8(i64 %32)
  call void asm sideeffect "", ""()
  unreachable

; <label>:39                                      ; preds = %if.end7
  store i64 %31, i64* %n_trips, align 8
  %40 = load i64* %omega_node289, align 8
  %m_org = getelementptr inbounds %struct.network* %net, i32 0, i32 6
  %41 = ptrtoint i64* %m_org to i64
  %42 = lshr i64 %41, 3
  %43 = or i64 %42, 17592186044416
  %44 = inttoptr i64 %43 to i8*
  %45 = load i8* %44
  %46 = icmp ne i8 %45, 0
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %39
  call void @__asan_report_store8(i64 %41)
  call void asm sideeffect "", ""()
  unreachable

; <label>:48                                      ; preds = %39
  store i64 %40, i64* %m_org, align 8
  %49 = load i64* %omega_node288, align 8
  %50 = load i64* %omega_node288, align 8
  %add = add nsw i64 %49, %50
  %add8 = add nsw i64 %add, 1
  %n = getelementptr inbounds %struct.network* %net, i32 0, i32 2
  %51 = ptrtoint i64* %n to i64
  %52 = lshr i64 %51, 3
  %53 = or i64 %52, 17592186044416
  %54 = inttoptr i64 %53 to i8*
  %55 = load i8* %54
  %56 = icmp ne i8 %55, 0
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %48
  call void @__asan_report_store8(i64 %51)
  call void asm sideeffect "", ""()
  unreachable

; <label>:58                                      ; preds = %48
  store i64 %add8, i64* %n, align 8
  %59 = load i64* %omega_node288, align 8
  %60 = load i64* %omega_node288, align 8
  %add9 = add nsw i64 %59, %60
  %61 = load i64* %omega_node288, align 8
  %add10 = add nsw i64 %add9, %61
  %62 = load i64* %omega_node289, align 8
  %add11 = add nsw i64 %add10, %62
  %m = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %63 = ptrtoint i64* %m to i64
  %64 = lshr i64 %63, 3
  %65 = or i64 %64, 17592186044416
  %66 = inttoptr i64 %65 to i8*
  %67 = load i8* %66
  %68 = icmp ne i8 %67, 0
  br i1 %68, label %69, label %70

; <label>:69                                      ; preds = %58
  call void @__asan_report_store8(i64 %63)
  call void asm sideeffect "", ""()
  unreachable

; <label>:70                                      ; preds = %58
  store i64 %add11, i64* %m, align 8
  %n_trips12 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %71 = ptrtoint i64* %n_trips12 to i64
  %72 = lshr i64 %71, 3
  %73 = or i64 %72, 17592186044416
  %74 = inttoptr i64 %73 to i8*
  %75 = load i8* %74
  %76 = icmp ne i8 %75, 0
  br i1 %76, label %77, label %78

; <label>:77                                      ; preds = %70
  call void @__asan_report_load8(i64 %71)
  call void asm sideeffect "", ""()
  unreachable

; <label>:78                                      ; preds = %70
  %79 = load i64* %n_trips12, align 8
  %cmp13 = icmp sle i64 %79, 15000
  br i1 %cmp13, label %if.then14, label %if.else

if.then14:                                        ; preds = %78
  %sigma_node237 = phi i64 [ %79, %78 ]
  %m15 = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %80 = ptrtoint i64* %m15 to i64
  %81 = lshr i64 %80, 3
  %82 = or i64 %81, 17592186044416
  %83 = inttoptr i64 %82 to i8*
  %84 = load i8* %83
  %85 = icmp ne i8 %84, 0
  br i1 %85, label %86, label %87

; <label>:86                                      ; preds = %if.then14
  call void @__asan_report_load8(i64 %80)
  call void asm sideeffect "", ""()
  unreachable

; <label>:87                                      ; preds = %if.then14
  %88 = load i64* %m15, align 8
  %max_m = getelementptr inbounds %struct.network* %net, i32 0, i32 4
  %89 = ptrtoint i64* %max_m to i64
  %90 = lshr i64 %89, 3
  %91 = or i64 %90, 17592186044416
  %92 = inttoptr i64 %91 to i8*
  %93 = load i8* %92
  %94 = icmp ne i8 %93, 0
  br i1 %94, label %95, label %96

; <label>:95                                      ; preds = %87
  call void @__asan_report_store8(i64 %89)
  call void asm sideeffect "", ""()
  unreachable

; <label>:96                                      ; preds = %87
  store i64 %88, i64* %max_m, align 8
  %max_new_m = getelementptr inbounds %struct.network* %net, i32 0, i32 9
  %97 = ptrtoint i64* %max_new_m to i64
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
  store i64 3000000, i64* %max_new_m, align 8
  br label %if.end18

if.else:                                          ; preds = %78
  %sigma_node238 = phi i64 [ %79, %78 ]
  %max_m16 = getelementptr inbounds %struct.network* %net, i32 0, i32 4
  %105 = ptrtoint i64* %max_m16 to i64
  %106 = lshr i64 %105, 3
  %107 = or i64 %106, 17592186044416
  %108 = inttoptr i64 %107 to i8*
  %109 = load i8* %108
  %110 = icmp ne i8 %109, 0
  br i1 %110, label %111, label %112

; <label>:111                                     ; preds = %if.else
  call void @__asan_report_store8(i64 %105)
  call void asm sideeffect "", ""()
  unreachable

; <label>:112                                     ; preds = %if.else
  store i64 27328512, i64* %max_m16, align 8
  %max_new_m17 = getelementptr inbounds %struct.network* %net, i32 0, i32 9
  %113 = ptrtoint i64* %max_new_m17 to i64
  %114 = lshr i64 %113, 3
  %115 = or i64 %114, 17592186044416
  %116 = inttoptr i64 %115 to i8*
  %117 = load i8* %116
  %118 = icmp ne i8 %117, 0
  br i1 %118, label %119, label %120

; <label>:119                                     ; preds = %112
  call void @__asan_report_store8(i64 %113)
  call void asm sideeffect "", ""()
  unreachable

; <label>:120                                     ; preds = %112
  store i64 28900000, i64* %max_new_m17, align 8
  br label %if.end18

if.end18:                                         ; preds = %120, %104
  %max_m19 = getelementptr inbounds %struct.network* %net, i32 0, i32 4
  %121 = ptrtoint i64* %max_m19 to i64
  %122 = lshr i64 %121, 3
  %123 = or i64 %122, 17592186044416
  %124 = inttoptr i64 %123 to i8*
  %125 = load i8* %124
  %126 = icmp ne i8 %125, 0
  br i1 %126, label %127, label %128

; <label>:127                                     ; preds = %if.end18
  call void @__asan_report_load8(i64 %121)
  call void asm sideeffect "", ""()
  unreachable

; <label>:128                                     ; preds = %if.end18
  %129 = load i64* %max_m19, align 8
  %m20 = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %130 = ptrtoint i64* %m20 to i64
  %131 = lshr i64 %130, 3
  %132 = or i64 %131, 17592186044416
  %133 = inttoptr i64 %132 to i8*
  %134 = load i8* %133
  %135 = icmp ne i8 %134, 0
  br i1 %135, label %136, label %137

; <label>:136                                     ; preds = %128
  call void @__asan_report_load8(i64 %130)
  call void asm sideeffect "", ""()
  unreachable

; <label>:137                                     ; preds = %128
  %138 = load i64* %m20, align 8
  %sub = sub nsw i64 %129, %138
  %max_residual_new_m = getelementptr inbounds %struct.network* %net, i32 0, i32 8
  %139 = ptrtoint i64* %max_residual_new_m to i64
  %140 = lshr i64 %139, 3
  %141 = or i64 %140, 17592186044416
  %142 = inttoptr i64 %141 to i8*
  %143 = load i8* %142
  %144 = icmp ne i8 %143, 0
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %137
  call void @__asan_report_store8(i64 %139)
  call void asm sideeffect "", ""()
  unreachable

; <label>:146                                     ; preds = %137
  store i64 %sub, i64* %max_residual_new_m, align 8
  %max_new_m21 = getelementptr inbounds %struct.network* %net, i32 0, i32 9
  %147 = ptrtoint i64* %max_new_m21 to i64
  %148 = lshr i64 %147, 3
  %149 = or i64 %148, 17592186044416
  %150 = inttoptr i64 %149 to i8*
  %151 = load i8* %150
  %152 = icmp ne i8 %151, 0
  br i1 %152, label %153, label %154

; <label>:153                                     ; preds = %146
  call void @__asan_report_load8(i64 %147)
  call void asm sideeffect "", ""()
  unreachable

; <label>:154                                     ; preds = %146
  %155 = load i64* %max_new_m21, align 8
  %cmp22 = icmp sge i64 %155, 3
  br i1 %cmp22, label %cond.true, label %cond.false

cond.true:                                        ; preds = %154
  %sigma_node239 = phi i64 [ %155, %154 ]
  br label %cond.end

cond.false:                                       ; preds = %154
  %sigma_node240 = phi i64 [ %155, %154 ]
  br label %cond.false.split

cond.false.split:                                 ; preds = %cond.false
  call void @__asan_handle_no_return()
  call void @__assert_fail(i8* getelementptr inbounds ({ [20 x i8], [44 x i8] }* @.str2, i32 0, i32 0, i32 0), i8* getelementptr inbounds ({ [10 x i8], [54 x i8] }* @.str3, i32 0, i32 0, i32 0), i32 77, i8* getelementptr inbounds ({ [27 x i8], [37 x i8] }* @__PRETTY_FUNCTION__.read_min, i32 0, i32 0, i32 0)) noreturn nounwind
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %156, %cond.true
  %n23 = getelementptr inbounds %struct.network* %net, i32 0, i32 2
  %157 = ptrtoint i64* %n23 to i64
  %158 = lshr i64 %157, 3
  %159 = or i64 %158, 17592186044416
  %160 = inttoptr i64 %159 to i8*
  %161 = load i8* %160
  %162 = icmp ne i8 %161, 0
  br i1 %162, label %163, label %164

; <label>:163                                     ; preds = %cond.end
  call void @__asan_report_load8(i64 %157)
  call void asm sideeffect "", ""()
  unreachable

; <label>:164                                     ; preds = %cond.end
  %165 = load i64* %n23, align 8
  %add24 = add nsw i64 %165, 1
  %call25 = call noalias i8* @calloc(i64 %add24, i64 104) nounwind
  %166 = bitcast i8* %call25 to %struct.node*
  %nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %167 = ptrtoint %struct.node** %nodes to i64
  %168 = lshr i64 %167, 3
  %169 = or i64 %168, 17592186044416
  %170 = inttoptr i64 %169 to i8*
  %171 = load i8* %170
  %172 = icmp ne i8 %171, 0
  br i1 %172, label %173, label %174

; <label>:173                                     ; preds = %164
  call void @__asan_report_store8(i64 %167)
  call void asm sideeffect "", ""()
  unreachable

; <label>:174                                     ; preds = %164
  store %struct.node* %166, %struct.node** %nodes, align 8
  %n26 = getelementptr inbounds %struct.network* %net, i32 0, i32 2
  %175 = ptrtoint i64* %n26 to i64
  %176 = lshr i64 %175, 3
  %177 = or i64 %176, 17592186044416
  %178 = inttoptr i64 %177 to i8*
  %179 = load i8* %178
  %180 = icmp ne i8 %179, 0
  br i1 %180, label %181, label %182

; <label>:181                                     ; preds = %174
  call void @__asan_report_load8(i64 %175)
  call void asm sideeffect "", ""()
  unreachable

; <label>:182                                     ; preds = %174
  %183 = load i64* %n26, align 8
  %call27 = call noalias i8* @calloc(i64 %183, i64 64) nounwind
  %184 = bitcast i8* %call27 to %struct.arc*
  %dummy_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 25
  %185 = ptrtoint %struct.arc** %dummy_arcs to i64
  %186 = lshr i64 %185, 3
  %187 = or i64 %186, 17592186044416
  %188 = inttoptr i64 %187 to i8*
  %189 = load i8* %188
  %190 = icmp ne i8 %189, 0
  br i1 %190, label %191, label %192

; <label>:191                                     ; preds = %182
  call void @__asan_report_store8(i64 %185)
  call void asm sideeffect "", ""()
  unreachable

; <label>:192                                     ; preds = %182
  store %struct.arc* %184, %struct.arc** %dummy_arcs, align 8
  %max_m28 = getelementptr inbounds %struct.network* %net, i32 0, i32 4
  %193 = ptrtoint i64* %max_m28 to i64
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
  %201 = load i64* %max_m28, align 8
  %call29 = call noalias i8* @calloc(i64 %201, i64 64) nounwind
  %202 = bitcast i8* %call29 to %struct.arc*
  %arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %203 = ptrtoint %struct.arc** %arcs to i64
  %204 = lshr i64 %203, 3
  %205 = or i64 %204, 17592186044416
  %206 = inttoptr i64 %205 to i8*
  %207 = load i8* %206
  %208 = icmp ne i8 %207, 0
  br i1 %208, label %209, label %210

; <label>:209                                     ; preds = %200
  call void @__asan_report_store8(i64 %203)
  call void asm sideeffect "", ""()
  unreachable

; <label>:210                                     ; preds = %200
  store %struct.arc* %202, %struct.arc** %arcs, align 8
  %nodes30 = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %211 = ptrtoint %struct.node** %nodes30 to i64
  %212 = lshr i64 %211, 3
  %213 = or i64 %212, 17592186044416
  %214 = inttoptr i64 %213 to i8*
  %215 = load i8* %214
  %216 = icmp ne i8 %215, 0
  br i1 %216, label %217, label %218

; <label>:217                                     ; preds = %210
  call void @__asan_report_load8(i64 %211)
  call void asm sideeffect "", ""()
  unreachable

; <label>:218                                     ; preds = %210
  %219 = load %struct.node** %nodes30, align 8
  %tobool = icmp ne %struct.node* %219, null
  br i1 %tobool, label %land.lhs.true, label %cond.end.if.then36_crit_edge

cond.end.if.then36_crit_edge:                     ; preds = %218
  %sigma_node242 = phi %struct.node* [ %219, %218 ]
  br label %if.then36

land.lhs.true:                                    ; preds = %218
  %sigma_node241 = phi %struct.node* [ %219, %218 ]
  %arcs31 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %220 = ptrtoint %struct.arc** %arcs31 to i64
  %221 = lshr i64 %220, 3
  %222 = or i64 %221, 17592186044416
  %223 = inttoptr i64 %222 to i8*
  %224 = load i8* %223
  %225 = icmp ne i8 %224, 0
  br i1 %225, label %226, label %227

; <label>:226                                     ; preds = %land.lhs.true
  call void @__asan_report_load8(i64 %220)
  call void asm sideeffect "", ""()
  unreachable

; <label>:227                                     ; preds = %land.lhs.true
  %228 = load %struct.arc** %arcs31, align 8
  %tobool32 = icmp ne %struct.arc* %228, null
  br i1 %tobool32, label %land.lhs.true33, label %land.lhs.true.if.then36_crit_edge

land.lhs.true.if.then36_crit_edge:                ; preds = %227
  %sigma_node244 = phi %struct.arc* [ %228, %227 ]
  br label %if.then36

land.lhs.true33:                                  ; preds = %227
  %sigma_node243 = phi %struct.arc* [ %228, %227 ]
  %dummy_arcs34 = getelementptr inbounds %struct.network* %net, i32 0, i32 25
  %229 = ptrtoint %struct.arc** %dummy_arcs34 to i64
  %230 = lshr i64 %229, 3
  %231 = or i64 %230, 17592186044416
  %232 = inttoptr i64 %231 to i8*
  %233 = load i8* %232
  %234 = icmp ne i8 %233, 0
  br i1 %234, label %235, label %236

; <label>:235                                     ; preds = %land.lhs.true33
  call void @__asan_report_load8(i64 %229)
  call void asm sideeffect "", ""()
  unreachable

; <label>:236                                     ; preds = %land.lhs.true33
  %237 = load %struct.arc** %dummy_arcs34, align 8
  %tobool35 = icmp ne %struct.arc* %237, null
  br i1 %tobool35, label %if.end39, label %land.lhs.true33.if.then36_crit_edge

land.lhs.true33.if.then36_crit_edge:              ; preds = %236
  %sigma_node246 = phi %struct.arc* [ %237, %236 ]
  br label %if.then36

if.then36:                                        ; preds = %land.lhs.true33.if.then36_crit_edge, %land.lhs.true.if.then36_crit_edge, %cond.end.if.then36_crit_edge
  br label %if.then36.split

if.then36.split:                                  ; preds = %if.then36
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ({ [31 x i8], [33 x i8] }* @.str4, i32 0, i32 0, i32 0))
  br label %if.then36.split.split

if.then36.split.split:                            ; preds = %if.then36.split
  %omega_node290 = phi %struct.network* [ %net, %if.then36.split ]
  %call38 = call i64 @getfree(%struct.network* %omega_node290)
  br label %return

if.end39:                                         ; preds = %236
  %sigma_node245 = phi %struct.arc* [ %237, %236 ]
  %nodes40 = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %238 = ptrtoint %struct.node** %nodes40 to i64
  %239 = lshr i64 %238, 3
  %240 = or i64 %239, 17592186044416
  %241 = inttoptr i64 %240 to i8*
  %242 = load i8* %241
  %243 = icmp ne i8 %242, 0
  br i1 %243, label %244, label %245

; <label>:244                                     ; preds = %if.end39
  call void @__asan_report_load8(i64 %238)
  call void asm sideeffect "", ""()
  unreachable

; <label>:245                                     ; preds = %if.end39
  %246 = load %struct.node** %nodes40, align 8
  %n41 = getelementptr inbounds %struct.network* %net, i32 0, i32 2
  %247 = ptrtoint i64* %n41 to i64
  %248 = lshr i64 %247, 3
  %249 = or i64 %248, 17592186044416
  %250 = inttoptr i64 %249 to i8*
  %251 = load i8* %250
  %252 = icmp ne i8 %251, 0
  br i1 %252, label %253, label %254

; <label>:253                                     ; preds = %245
  call void @__asan_report_load8(i64 %247)
  call void asm sideeffect "", ""()
  unreachable

; <label>:254                                     ; preds = %245
  %255 = load i64* %n41, align 8
  %add.ptr = getelementptr inbounds %struct.node* %246, i64 %255
  %add.ptr42 = getelementptr inbounds %struct.node* %add.ptr, i64 1
  %stop_nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 22
  %256 = ptrtoint %struct.node** %stop_nodes to i64
  %257 = lshr i64 %256, 3
  %258 = or i64 %257, 17592186044416
  %259 = inttoptr i64 %258 to i8*
  %260 = load i8* %259
  %261 = icmp ne i8 %260, 0
  br i1 %261, label %262, label %263

; <label>:262                                     ; preds = %254
  call void @__asan_report_store8(i64 %256)
  call void asm sideeffect "", ""()
  unreachable

; <label>:263                                     ; preds = %254
  store %struct.node* %add.ptr42, %struct.node** %stop_nodes, align 8
  %arcs43 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %264 = ptrtoint %struct.arc** %arcs43 to i64
  %265 = lshr i64 %264, 3
  %266 = or i64 %265, 17592186044416
  %267 = inttoptr i64 %266 to i8*
  %268 = load i8* %267
  %269 = icmp ne i8 %268, 0
  br i1 %269, label %270, label %271

; <label>:270                                     ; preds = %263
  call void @__asan_report_load8(i64 %264)
  call void asm sideeffect "", ""()
  unreachable

; <label>:271                                     ; preds = %263
  %272 = load %struct.arc** %arcs43, align 8
  %m44 = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %273 = ptrtoint i64* %m44 to i64
  %274 = lshr i64 %273, 3
  %275 = or i64 %274, 17592186044416
  %276 = inttoptr i64 %275 to i8*
  %277 = load i8* %276
  %278 = icmp ne i8 %277, 0
  br i1 %278, label %279, label %280

; <label>:279                                     ; preds = %271
  call void @__asan_report_load8(i64 %273)
  call void asm sideeffect "", ""()
  unreachable

; <label>:280                                     ; preds = %271
  %281 = load i64* %m44, align 8
  %add.ptr45 = getelementptr inbounds %struct.arc* %272, i64 %281
  %stop_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %282 = ptrtoint %struct.arc** %stop_arcs to i64
  %283 = lshr i64 %282, 3
  %284 = or i64 %283, 17592186044416
  %285 = inttoptr i64 %284 to i8*
  %286 = load i8* %285
  %287 = icmp ne i8 %286, 0
  br i1 %287, label %288, label %289

; <label>:288                                     ; preds = %280
  call void @__asan_report_store8(i64 %282)
  call void asm sideeffect "", ""()
  unreachable

; <label>:289                                     ; preds = %280
  store %struct.arc* %add.ptr45, %struct.arc** %stop_arcs, align 8
  %dummy_arcs46 = getelementptr inbounds %struct.network* %net, i32 0, i32 25
  %290 = ptrtoint %struct.arc** %dummy_arcs46 to i64
  %291 = lshr i64 %290, 3
  %292 = or i64 %291, 17592186044416
  %293 = inttoptr i64 %292 to i8*
  %294 = load i8* %293
  %295 = icmp ne i8 %294, 0
  br i1 %295, label %296, label %297

; <label>:296                                     ; preds = %289
  call void @__asan_report_load8(i64 %290)
  call void asm sideeffect "", ""()
  unreachable

; <label>:297                                     ; preds = %289
  %298 = load %struct.arc** %dummy_arcs46, align 8
  %n47 = getelementptr inbounds %struct.network* %net, i32 0, i32 2
  %299 = ptrtoint i64* %n47 to i64
  %300 = lshr i64 %299, 3
  %301 = or i64 %300, 17592186044416
  %302 = inttoptr i64 %301 to i8*
  %303 = load i8* %302
  %304 = icmp ne i8 %303, 0
  br i1 %304, label %305, label %306

; <label>:305                                     ; preds = %297
  call void @__asan_report_load8(i64 %299)
  call void asm sideeffect "", ""()
  unreachable

; <label>:306                                     ; preds = %297
  %307 = load i64* %n47, align 8
  %add.ptr48 = getelementptr inbounds %struct.arc* %298, i64 %307
  %stop_dummy = getelementptr inbounds %struct.network* %net, i32 0, i32 26
  %308 = ptrtoint %struct.arc** %stop_dummy to i64
  %309 = lshr i64 %308, 3
  %310 = or i64 %309, 17592186044416
  %311 = inttoptr i64 %310 to i8*
  %312 = load i8* %311
  %313 = icmp ne i8 %312, 0
  br i1 %313, label %314, label %315

; <label>:314                                     ; preds = %306
  call void @__asan_report_store8(i64 %308)
  call void asm sideeffect "", ""()
  unreachable

; <label>:315                                     ; preds = %306
  store %struct.arc* %add.ptr48, %struct.arc** %stop_dummy, align 8
  %nodes49 = getelementptr inbounds %struct.network* %net, i32 0, i32 21
  %316 = ptrtoint %struct.node** %nodes49 to i64
  %317 = lshr i64 %316, 3
  %318 = or i64 %317, 17592186044416
  %319 = inttoptr i64 %318 to i8*
  %320 = load i8* %319
  %321 = icmp ne i8 %320, 0
  br i1 %321, label %322, label %323

; <label>:322                                     ; preds = %315
  call void @__asan_report_load8(i64 %316)
  call void asm sideeffect "", ""()
  unreachable

; <label>:323                                     ; preds = %315
  %324 = load %struct.node** %nodes49, align 8
  %arcs50 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %325 = ptrtoint %struct.arc** %arcs50 to i64
  %326 = lshr i64 %325, 3
  %327 = or i64 %326, 17592186044416
  %328 = inttoptr i64 %327 to i8*
  %329 = load i8* %328
  %330 = icmp ne i8 %329, 0
  br i1 %330, label %331, label %332

; <label>:331                                     ; preds = %323
  call void @__asan_report_load8(i64 %325)
  call void asm sideeffect "", ""()
  unreachable

; <label>:332                                     ; preds = %323
  %333 = load %struct.arc** %arcs50, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %332
  %phi_node297 = phi i64* [ %omega_node289, %332 ], [ %omega_node296, %for.inc ]
  %phi_node295 = phi i64* [ %omega_node288, %332 ], [ %omega_node294, %for.inc ]
  %phi_node = phi %struct._IO_FILE* [ %omega_node286, %332 ], [ %omega_node292, %for.inc ]
  %i.0 = phi i64 [ 1, %332 ], [ %inc, %for.inc ]
  %arc.0 = phi %struct.arc* [ %333, %332 ], [ %incdec.ptr134, %for.inc ]
  %n_trips51 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %334 = ptrtoint i64* %n_trips51 to i64
  %335 = lshr i64 %334, 3
  %336 = or i64 %335, 17592186044416
  %337 = inttoptr i64 %336 to i8*
  %338 = load i8* %337
  %339 = icmp ne i8 %338, 0
  br i1 %339, label %340, label %341

; <label>:340                                     ; preds = %for.cond
  call void @__asan_report_load8(i64 %334)
  call void asm sideeffect "", ""()
  unreachable

; <label>:341                                     ; preds = %for.cond
  %342 = load i64* %n_trips51, align 8
  %cmp52 = icmp sle i64 %i.0, %342
  br i1 %cmp52, label %for.body, label %for.end

for.body:                                         ; preds = %341
  %sigma_node249 = phi i64 [ %342, %341 ]
  %sigma_node247 = phi i64 [ %i.0, %341 ]
  %arraydecay53 = getelementptr inbounds [201 x i8]* %2, i32 0, i32 0, !byte_size !0, !safe !1, !index_size !2
  br label %for.body.split

for.body.split:                                   ; preds = %for.body
  %omega_node292 = phi %struct._IO_FILE* [ %phi_node, %for.body ]
  %omega_node291 = phi i8* [ %arraydecay53, %for.body ], !byte_size !0, !safe !1, !index_size !2
  %call54 = call i8* @fgets(i8* %omega_node291, i32 200, %struct._IO_FILE* %omega_node292)
  %arraydecay55 = getelementptr inbounds [201 x i8]* %2, i32 0, i32 0, !byte_size !0, !safe !1, !index_size !2
  br label %for.body.split.split

for.body.split.split:                             ; preds = %for.body.split
  %omega_node296 = phi i64* [ %phi_node297, %for.body.split ]
  %omega_node294 = phi i64* [ %phi_node295, %for.body.split ]
  %omega_node293 = phi i8* [ %arraydecay55, %for.body.split ], !byte_size !0, !safe !1, !index_size !2
  %call56 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %omega_node293, i8* getelementptr inbounds ({ [8 x i8], [56 x i8] }* @.str1, i32 0, i32 0, i32 0), i64* %omega_node294, i64* %omega_node296) nounwind
  %cmp57 = icmp ne i32 %call56, 2
  br i1 %cmp57, label %for.body.if.then59_crit_edge, label %lor.lhs.false

for.body.if.then59_crit_edge:                     ; preds = %for.body.split.split
  %sigma_node251 = phi i32 [ %call56, %for.body.split.split ]
  br label %if.then59

lor.lhs.false:                                    ; preds = %for.body.split.split
  %sigma_node252 = phi i32 [ %call56, %for.body.split.split ]
  %343 = ptrtoint i64* %phi_node295 to i64
  %344 = lshr i64 %343, 3
  %345 = or i64 %344, 17592186044416
  %346 = inttoptr i64 %345 to i8*
  %347 = load i8* %346
  %348 = icmp ne i8 %347, 0
  br i1 %348, label %349, label %350

; <label>:349                                     ; preds = %lor.lhs.false
  call void @__asan_report_load8(i64 %343)
  call void asm sideeffect "", ""()
  unreachable

; <label>:350                                     ; preds = %lor.lhs.false
  %351 = load i64* %phi_node295, align 8
  %352 = ptrtoint i64* %phi_node297 to i64
  %353 = lshr i64 %352, 3
  %354 = or i64 %353, 17592186044416
  %355 = inttoptr i64 %354 to i8*
  %356 = load i8* %355
  %357 = icmp ne i8 %356, 0
  br i1 %357, label %358, label %359

; <label>:358                                     ; preds = %350
  call void @__asan_report_load8(i64 %352)
  call void asm sideeffect "", ""()
  unreachable

; <label>:359                                     ; preds = %350
  %360 = load i64* %phi_node297, align 8
  %cmp58 = icmp sgt i64 %351, %360
  br i1 %cmp58, label %lor.lhs.false.if.then59_crit_edge, label %if.end60

lor.lhs.false.if.then59_crit_edge:                ; preds = %359
  %sigma_node255 = phi i64 [ %360, %359 ]
  %sigma_node253 = phi i64 [ %351, %359 ]
  br label %if.then59

if.then59:                                        ; preds = %lor.lhs.false.if.then59_crit_edge, %for.body.if.then59_crit_edge
  br label %return

if.end60:                                         ; preds = %359
  %sigma_node256 = phi i64 [ %360, %359 ]
  %sigma_node254 = phi i64 [ %351, %359 ]
  %sub61 = sub nsw i64 0, %sigma_node247
  %conv = trunc i64 %sub61 to i32
  %arrayidx = getelementptr inbounds %struct.node* %324, i64 %sigma_node247
  %number = getelementptr inbounds %struct.node* %arrayidx, i32 0, i32 12
  %361 = ptrtoint i32* %number to i64
  %362 = lshr i64 %361, 3
  %363 = or i64 %362, 17592186044416
  %364 = inttoptr i64 %363 to i8*
  %365 = load i8* %364
  %366 = icmp ne i8 %365, 0
  br i1 %366, label %367, label %373

; <label>:367                                     ; preds = %if.end60
  %368 = and i64 %361, 7
  %369 = add i64 %368, 3
  %370 = trunc i64 %369 to i8
  %371 = icmp sge i8 %370, %365
  br i1 %371, label %372, label %373

; <label>:372                                     ; preds = %367
  call void @__asan_report_store4(i64 %361)
  call void asm sideeffect "", ""()
  unreachable

; <label>:373                                     ; preds = %367, %if.end60
  store i32 %conv, i32* %number, align 4
  %arrayidx62 = getelementptr inbounds %struct.node* %324, i64 %sigma_node247
  %flow = getelementptr inbounds %struct.node* %arrayidx62, i32 0, i32 10
  %374 = ptrtoint i64* %flow to i64
  %375 = lshr i64 %374, 3
  %376 = or i64 %375, 17592186044416
  %377 = inttoptr i64 %376 to i8*
  %378 = load i8* %377
  %379 = icmp ne i8 %378, 0
  br i1 %379, label %380, label %381

; <label>:380                                     ; preds = %373
  call void @__asan_report_store8(i64 %374)
  call void asm sideeffect "", ""()
  unreachable

; <label>:381                                     ; preds = %373
  store i64 -1, i64* %flow, align 8
  %conv63 = trunc i64 %sigma_node247 to i32
  %n_trips64 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %382 = ptrtoint i64* %n_trips64 to i64
  %383 = lshr i64 %382, 3
  %384 = or i64 %383, 17592186044416
  %385 = inttoptr i64 %384 to i8*
  %386 = load i8* %385
  %387 = icmp ne i8 %386, 0
  br i1 %387, label %388, label %389

; <label>:388                                     ; preds = %381
  call void @__asan_report_load8(i64 %382)
  call void asm sideeffect "", ""()
  unreachable

; <label>:389                                     ; preds = %381
  %390 = load i64* %n_trips64, align 8
  %add65 = add nsw i64 %sigma_node247, %390
  %arrayidx66 = getelementptr inbounds %struct.node* %324, i64 %add65
  %number67 = getelementptr inbounds %struct.node* %arrayidx66, i32 0, i32 12
  %391 = ptrtoint i32* %number67 to i64
  %392 = lshr i64 %391, 3
  %393 = or i64 %392, 17592186044416
  %394 = inttoptr i64 %393 to i8*
  %395 = load i8* %394
  %396 = icmp ne i8 %395, 0
  br i1 %396, label %397, label %403

; <label>:397                                     ; preds = %389
  %398 = and i64 %391, 7
  %399 = add i64 %398, 3
  %400 = trunc i64 %399 to i8
  %401 = icmp sge i8 %400, %395
  br i1 %401, label %402, label %403

; <label>:402                                     ; preds = %397
  call void @__asan_report_store4(i64 %391)
  call void asm sideeffect "", ""()
  unreachable

; <label>:403                                     ; preds = %397, %389
  store i32 %conv63, i32* %number67, align 4
  %n_trips68 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %404 = ptrtoint i64* %n_trips68 to i64
  %405 = lshr i64 %404, 3
  %406 = or i64 %405, 17592186044416
  %407 = inttoptr i64 %406 to i8*
  %408 = load i8* %407
  %409 = icmp ne i8 %408, 0
  br i1 %409, label %410, label %411

; <label>:410                                     ; preds = %403
  call void @__asan_report_load8(i64 %404)
  call void asm sideeffect "", ""()
  unreachable

; <label>:411                                     ; preds = %403
  %412 = load i64* %n_trips68, align 8
  %add69 = add nsw i64 %sigma_node247, %412
  %arrayidx70 = getelementptr inbounds %struct.node* %324, i64 %add69
  %flow71 = getelementptr inbounds %struct.node* %arrayidx70, i32 0, i32 10
  %413 = ptrtoint i64* %flow71 to i64
  %414 = lshr i64 %413, 3
  %415 = or i64 %414, 17592186044416
  %416 = inttoptr i64 %415 to i8*
  %417 = load i8* %416
  %418 = icmp ne i8 %417, 0
  br i1 %418, label %419, label %420

; <label>:419                                     ; preds = %411
  call void @__asan_report_store8(i64 %413)
  call void asm sideeffect "", ""()
  unreachable

; <label>:420                                     ; preds = %411
  store i64 1, i64* %flow71, align 8
  %421 = ptrtoint i64* %phi_node295 to i64
  %422 = lshr i64 %421, 3
  %423 = or i64 %422, 17592186044416
  %424 = inttoptr i64 %423 to i8*
  %425 = load i8* %424
  %426 = icmp ne i8 %425, 0
  br i1 %426, label %427, label %428

; <label>:427                                     ; preds = %420
  call void @__asan_report_load8(i64 %421)
  call void asm sideeffect "", ""()
  unreachable

; <label>:428                                     ; preds = %420
  %429 = load i64* %phi_node295, align 8
  %conv72 = trunc i64 %429 to i32
  %arrayidx73 = getelementptr inbounds %struct.node* %324, i64 %sigma_node247
  %time = getelementptr inbounds %struct.node* %arrayidx73, i32 0, i32 13
  %430 = ptrtoint i32* %time to i64
  %431 = lshr i64 %430, 3
  %432 = or i64 %431, 17592186044416
  %433 = inttoptr i64 %432 to i8*
  %434 = load i8* %433
  %435 = icmp ne i8 %434, 0
  br i1 %435, label %436, label %442

; <label>:436                                     ; preds = %428
  %437 = and i64 %430, 7
  %438 = add i64 %437, 3
  %439 = trunc i64 %438 to i8
  %440 = icmp sge i8 %439, %434
  br i1 %440, label %441, label %442

; <label>:441                                     ; preds = %436
  call void @__asan_report_store4(i64 %430)
  call void asm sideeffect "", ""()
  unreachable

; <label>:442                                     ; preds = %436, %428
  store i32 %conv72, i32* %time, align 4
  %443 = ptrtoint i64* %phi_node297 to i64
  %444 = lshr i64 %443, 3
  %445 = or i64 %444, 17592186044416
  %446 = inttoptr i64 %445 to i8*
  %447 = load i8* %446
  %448 = icmp ne i8 %447, 0
  br i1 %448, label %449, label %450

; <label>:449                                     ; preds = %442
  call void @__asan_report_load8(i64 %443)
  call void asm sideeffect "", ""()
  unreachable

; <label>:450                                     ; preds = %442
  %451 = load i64* %phi_node297, align 8
  %conv74 = trunc i64 %451 to i32
  %n_trips75 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %452 = ptrtoint i64* %n_trips75 to i64
  %453 = lshr i64 %452, 3
  %454 = or i64 %453, 17592186044416
  %455 = inttoptr i64 %454 to i8*
  %456 = load i8* %455
  %457 = icmp ne i8 %456, 0
  br i1 %457, label %458, label %459

; <label>:458                                     ; preds = %450
  call void @__asan_report_load8(i64 %452)
  call void asm sideeffect "", ""()
  unreachable

; <label>:459                                     ; preds = %450
  %460 = load i64* %n_trips75, align 8
  %add76 = add nsw i64 %sigma_node247, %460
  %arrayidx77 = getelementptr inbounds %struct.node* %324, i64 %add76
  %time78 = getelementptr inbounds %struct.node* %arrayidx77, i32 0, i32 13
  %461 = ptrtoint i32* %time78 to i64
  %462 = lshr i64 %461, 3
  %463 = or i64 %462, 17592186044416
  %464 = inttoptr i64 %463 to i8*
  %465 = load i8* %464
  %466 = icmp ne i8 %465, 0
  br i1 %466, label %467, label %473

; <label>:467                                     ; preds = %459
  %468 = and i64 %461, 7
  %469 = add i64 %468, 3
  %470 = trunc i64 %469 to i8
  %471 = icmp sge i8 %470, %465
  br i1 %471, label %472, label %473

; <label>:472                                     ; preds = %467
  call void @__asan_report_store4(i64 %461)
  call void asm sideeffect "", ""()
  unreachable

; <label>:473                                     ; preds = %467, %459
  store i32 %conv74, i32* %time78, align 4
  %n79 = getelementptr inbounds %struct.network* %net, i32 0, i32 2
  %474 = ptrtoint i64* %n79 to i64
  %475 = lshr i64 %474, 3
  %476 = or i64 %475, 17592186044416
  %477 = inttoptr i64 %476 to i8*
  %478 = load i8* %477
  %479 = icmp ne i8 %478, 0
  br i1 %479, label %480, label %481

; <label>:480                                     ; preds = %473
  call void @__asan_report_load8(i64 %474)
  call void asm sideeffect "", ""()
  unreachable

; <label>:481                                     ; preds = %473
  %482 = load i64* %n79, align 8
  %arrayidx80 = getelementptr inbounds %struct.node* %324, i64 %482
  %tail = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 1
  %483 = ptrtoint %struct.node** %tail to i64
  %484 = lshr i64 %483, 3
  %485 = or i64 %484, 17592186044416
  %486 = inttoptr i64 %485 to i8*
  %487 = load i8* %486
  %488 = icmp ne i8 %487, 0
  br i1 %488, label %489, label %490

; <label>:489                                     ; preds = %481
  call void @__asan_report_store8(i64 %483)
  call void asm sideeffect "", ""()
  unreachable

; <label>:490                                     ; preds = %481
  store %struct.node* %arrayidx80, %struct.node** %tail, align 8
  %arrayidx81 = getelementptr inbounds %struct.node* %324, i64 %sigma_node247
  %head = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 2
  %491 = ptrtoint %struct.node** %head to i64
  %492 = lshr i64 %491, 3
  %493 = or i64 %492, 17592186044416
  %494 = inttoptr i64 %493 to i8*
  %495 = load i8* %494
  %496 = icmp ne i8 %495, 0
  br i1 %496, label %497, label %498

; <label>:497                                     ; preds = %490
  call void @__asan_report_store8(i64 %491)
  call void asm sideeffect "", ""()
  unreachable

; <label>:498                                     ; preds = %490
  store %struct.node* %arrayidx81, %struct.node** %head, align 8
  %bigM = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %499 = ptrtoint i64* %bigM to i64
  %500 = lshr i64 %499, 3
  %501 = or i64 %500, 17592186044416
  %502 = inttoptr i64 %501 to i8*
  %503 = load i8* %502
  %504 = icmp ne i8 %503, 0
  br i1 %504, label %505, label %506

; <label>:505                                     ; preds = %498
  call void @__asan_report_load8(i64 %499)
  call void asm sideeffect "", ""()
  unreachable

; <label>:506                                     ; preds = %498
  %507 = load i64* %bigM, align 8
  %add82 = add nsw i64 %507, 15
  %cost = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 0
  %508 = ptrtoint i64* %cost to i64
  %509 = lshr i64 %508, 3
  %510 = or i64 %509, 17592186044416
  %511 = inttoptr i64 %510 to i8*
  %512 = load i8* %511
  %513 = icmp ne i8 %512, 0
  br i1 %513, label %514, label %515

; <label>:514                                     ; preds = %506
  call void @__asan_report_store8(i64 %508)
  call void asm sideeffect "", ""()
  unreachable

; <label>:515                                     ; preds = %506
  store i64 %add82, i64* %cost, align 8
  %org_cost = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 7
  %516 = ptrtoint i64* %org_cost to i64
  %517 = lshr i64 %516, 3
  %518 = or i64 %517, 17592186044416
  %519 = inttoptr i64 %518 to i8*
  %520 = load i8* %519
  %521 = icmp ne i8 %520, 0
  br i1 %521, label %522, label %523

; <label>:522                                     ; preds = %515
  call void @__asan_report_store8(i64 %516)
  call void asm sideeffect "", ""()
  unreachable

; <label>:523                                     ; preds = %515
  store i64 %add82, i64* %org_cost, align 8
  %tail83 = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 1
  %524 = ptrtoint %struct.node** %tail83 to i64
  %525 = lshr i64 %524, 3
  %526 = or i64 %525, 17592186044416
  %527 = inttoptr i64 %526 to i8*
  %528 = load i8* %527
  %529 = icmp ne i8 %528, 0
  br i1 %529, label %530, label %531

; <label>:530                                     ; preds = %523
  call void @__asan_report_load8(i64 %524)
  call void asm sideeffect "", ""()
  unreachable

; <label>:531                                     ; preds = %523
  %532 = load %struct.node** %tail83, align 8
  %firstout = getelementptr inbounds %struct.node* %532, i32 0, i32 7
  %533 = ptrtoint %struct.arc** %firstout to i64
  %534 = lshr i64 %533, 3
  %535 = or i64 %534, 17592186044416
  %536 = inttoptr i64 %535 to i8*
  %537 = load i8* %536
  %538 = icmp ne i8 %537, 0
  br i1 %538, label %539, label %540

; <label>:539                                     ; preds = %531
  call void @__asan_report_load8(i64 %533)
  call void asm sideeffect "", ""()
  unreachable

; <label>:540                                     ; preds = %531
  %541 = load %struct.arc** %firstout, align 8
  %nextout = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 4
  %542 = ptrtoint %struct.arc** %nextout to i64
  %543 = lshr i64 %542, 3
  %544 = or i64 %543, 17592186044416
  %545 = inttoptr i64 %544 to i8*
  %546 = load i8* %545
  %547 = icmp ne i8 %546, 0
  br i1 %547, label %548, label %549

; <label>:548                                     ; preds = %540
  call void @__asan_report_store8(i64 %542)
  call void asm sideeffect "", ""()
  unreachable

; <label>:549                                     ; preds = %540
  store %struct.arc* %541, %struct.arc** %nextout, align 8
  %tail84 = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 1
  %550 = ptrtoint %struct.node** %tail84 to i64
  %551 = lshr i64 %550, 3
  %552 = or i64 %551, 17592186044416
  %553 = inttoptr i64 %552 to i8*
  %554 = load i8* %553
  %555 = icmp ne i8 %554, 0
  br i1 %555, label %556, label %557

; <label>:556                                     ; preds = %549
  call void @__asan_report_load8(i64 %550)
  call void asm sideeffect "", ""()
  unreachable

; <label>:557                                     ; preds = %549
  %558 = load %struct.node** %tail84, align 8
  %firstout85 = getelementptr inbounds %struct.node* %558, i32 0, i32 7
  %559 = ptrtoint %struct.arc** %firstout85 to i64
  %560 = lshr i64 %559, 3
  %561 = or i64 %560, 17592186044416
  %562 = inttoptr i64 %561 to i8*
  %563 = load i8* %562
  %564 = icmp ne i8 %563, 0
  br i1 %564, label %565, label %566

; <label>:565                                     ; preds = %557
  call void @__asan_report_store8(i64 %559)
  call void asm sideeffect "", ""()
  unreachable

; <label>:566                                     ; preds = %557
  store %struct.arc* %arc.0, %struct.arc** %firstout85, align 8
  %head86 = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 2
  %567 = ptrtoint %struct.node** %head86 to i64
  %568 = lshr i64 %567, 3
  %569 = or i64 %568, 17592186044416
  %570 = inttoptr i64 %569 to i8*
  %571 = load i8* %570
  %572 = icmp ne i8 %571, 0
  br i1 %572, label %573, label %574

; <label>:573                                     ; preds = %566
  call void @__asan_report_load8(i64 %567)
  call void asm sideeffect "", ""()
  unreachable

; <label>:574                                     ; preds = %566
  %575 = load %struct.node** %head86, align 8
  %firstin = getelementptr inbounds %struct.node* %575, i32 0, i32 8
  %576 = ptrtoint %struct.arc** %firstin to i64
  %577 = lshr i64 %576, 3
  %578 = or i64 %577, 17592186044416
  %579 = inttoptr i64 %578 to i8*
  %580 = load i8* %579
  %581 = icmp ne i8 %580, 0
  br i1 %581, label %582, label %583

; <label>:582                                     ; preds = %574
  call void @__asan_report_load8(i64 %576)
  call void asm sideeffect "", ""()
  unreachable

; <label>:583                                     ; preds = %574
  %584 = load %struct.arc** %firstin, align 8
  %nextin = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 5
  %585 = ptrtoint %struct.arc** %nextin to i64
  %586 = lshr i64 %585, 3
  %587 = or i64 %586, 17592186044416
  %588 = inttoptr i64 %587 to i8*
  %589 = load i8* %588
  %590 = icmp ne i8 %589, 0
  br i1 %590, label %591, label %592

; <label>:591                                     ; preds = %583
  call void @__asan_report_store8(i64 %585)
  call void asm sideeffect "", ""()
  unreachable

; <label>:592                                     ; preds = %583
  store %struct.arc* %584, %struct.arc** %nextin, align 8
  %head87 = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 2
  %593 = ptrtoint %struct.node** %head87 to i64
  %594 = lshr i64 %593, 3
  %595 = or i64 %594, 17592186044416
  %596 = inttoptr i64 %595 to i8*
  %597 = load i8* %596
  %598 = icmp ne i8 %597, 0
  br i1 %598, label %599, label %600

; <label>:599                                     ; preds = %592
  call void @__asan_report_load8(i64 %593)
  call void asm sideeffect "", ""()
  unreachable

; <label>:600                                     ; preds = %592
  %601 = load %struct.node** %head87, align 8
  %firstin88 = getelementptr inbounds %struct.node* %601, i32 0, i32 8
  %602 = ptrtoint %struct.arc** %firstin88 to i64
  %603 = lshr i64 %602, 3
  %604 = or i64 %603, 17592186044416
  %605 = inttoptr i64 %604 to i8*
  %606 = load i8* %605
  %607 = icmp ne i8 %606, 0
  br i1 %607, label %608, label %609

; <label>:608                                     ; preds = %600
  call void @__asan_report_store8(i64 %602)
  call void asm sideeffect "", ""()
  unreachable

; <label>:609                                     ; preds = %600
  store %struct.arc* %arc.0, %struct.arc** %firstin88, align 8
  %incdec.ptr = getelementptr inbounds %struct.arc* %arc.0, i32 1
  %n_trips89 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %610 = ptrtoint i64* %n_trips89 to i64
  %611 = lshr i64 %610, 3
  %612 = or i64 %611, 17592186044416
  %613 = inttoptr i64 %612 to i8*
  %614 = load i8* %613
  %615 = icmp ne i8 %614, 0
  br i1 %615, label %616, label %617

; <label>:616                                     ; preds = %609
  call void @__asan_report_load8(i64 %610)
  call void asm sideeffect "", ""()
  unreachable

; <label>:617                                     ; preds = %609
  %618 = load i64* %n_trips89, align 8
  %add90 = add nsw i64 %sigma_node247, %618
  %arrayidx91 = getelementptr inbounds %struct.node* %324, i64 %add90
  %tail92 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 0, i32 1
  %619 = ptrtoint %struct.node** %tail92 to i64
  %620 = lshr i64 %619, 3
  %621 = or i64 %620, 17592186044416
  %622 = inttoptr i64 %621 to i8*
  %623 = load i8* %622
  %624 = icmp ne i8 %623, 0
  br i1 %624, label %625, label %626

; <label>:625                                     ; preds = %617
  call void @__asan_report_store8(i64 %619)
  call void asm sideeffect "", ""()
  unreachable

; <label>:626                                     ; preds = %617
  store %struct.node* %arrayidx91, %struct.node** %tail92, align 8
  %n93 = getelementptr inbounds %struct.network* %net, i32 0, i32 2
  %627 = ptrtoint i64* %n93 to i64
  %628 = lshr i64 %627, 3
  %629 = or i64 %628, 17592186044416
  %630 = inttoptr i64 %629 to i8*
  %631 = load i8* %630
  %632 = icmp ne i8 %631, 0
  br i1 %632, label %633, label %634

; <label>:633                                     ; preds = %626
  call void @__asan_report_load8(i64 %627)
  call void asm sideeffect "", ""()
  unreachable

; <label>:634                                     ; preds = %626
  %635 = load i64* %n93, align 8
  %arrayidx94 = getelementptr inbounds %struct.node* %324, i64 %635
  %head95 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 0, i32 2
  %636 = ptrtoint %struct.node** %head95 to i64
  %637 = lshr i64 %636, 3
  %638 = or i64 %637, 17592186044416
  %639 = inttoptr i64 %638 to i8*
  %640 = load i8* %639
  %641 = icmp ne i8 %640, 0
  br i1 %641, label %642, label %643

; <label>:642                                     ; preds = %634
  call void @__asan_report_store8(i64 %636)
  call void asm sideeffect "", ""()
  unreachable

; <label>:643                                     ; preds = %634
  store %struct.node* %arrayidx94, %struct.node** %head95, align 8
  %cost96 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 0, i32 0
  %644 = ptrtoint i64* %cost96 to i64
  %645 = lshr i64 %644, 3
  %646 = or i64 %645, 17592186044416
  %647 = inttoptr i64 %646 to i8*
  %648 = load i8* %647
  %649 = icmp ne i8 %648, 0
  br i1 %649, label %650, label %651

; <label>:650                                     ; preds = %643
  call void @__asan_report_store8(i64 %644)
  call void asm sideeffect "", ""()
  unreachable

; <label>:651                                     ; preds = %643
  store i64 15, i64* %cost96, align 8
  %org_cost97 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 0, i32 7
  %652 = ptrtoint i64* %org_cost97 to i64
  %653 = lshr i64 %652, 3
  %654 = or i64 %653, 17592186044416
  %655 = inttoptr i64 %654 to i8*
  %656 = load i8* %655
  %657 = icmp ne i8 %656, 0
  br i1 %657, label %658, label %659

; <label>:658                                     ; preds = %651
  call void @__asan_report_store8(i64 %652)
  call void asm sideeffect "", ""()
  unreachable

; <label>:659                                     ; preds = %651
  store i64 15, i64* %org_cost97, align 8
  %tail98 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 0, i32 1
  %660 = ptrtoint %struct.node** %tail98 to i64
  %661 = lshr i64 %660, 3
  %662 = or i64 %661, 17592186044416
  %663 = inttoptr i64 %662 to i8*
  %664 = load i8* %663
  %665 = icmp ne i8 %664, 0
  br i1 %665, label %666, label %667

; <label>:666                                     ; preds = %659
  call void @__asan_report_load8(i64 %660)
  call void asm sideeffect "", ""()
  unreachable

; <label>:667                                     ; preds = %659
  %668 = load %struct.node** %tail98, align 8
  %firstout99 = getelementptr inbounds %struct.node* %668, i32 0, i32 7
  %669 = ptrtoint %struct.arc** %firstout99 to i64
  %670 = lshr i64 %669, 3
  %671 = or i64 %670, 17592186044416
  %672 = inttoptr i64 %671 to i8*
  %673 = load i8* %672
  %674 = icmp ne i8 %673, 0
  br i1 %674, label %675, label %676

; <label>:675                                     ; preds = %667
  call void @__asan_report_load8(i64 %669)
  call void asm sideeffect "", ""()
  unreachable

; <label>:676                                     ; preds = %667
  %677 = load %struct.arc** %firstout99, align 8
  %nextout100 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 0, i32 4
  %678 = ptrtoint %struct.arc** %nextout100 to i64
  %679 = lshr i64 %678, 3
  %680 = or i64 %679, 17592186044416
  %681 = inttoptr i64 %680 to i8*
  %682 = load i8* %681
  %683 = icmp ne i8 %682, 0
  br i1 %683, label %684, label %685

; <label>:684                                     ; preds = %676
  call void @__asan_report_store8(i64 %678)
  call void asm sideeffect "", ""()
  unreachable

; <label>:685                                     ; preds = %676
  store %struct.arc* %677, %struct.arc** %nextout100, align 8
  %tail101 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 0, i32 1
  %686 = ptrtoint %struct.node** %tail101 to i64
  %687 = lshr i64 %686, 3
  %688 = or i64 %687, 17592186044416
  %689 = inttoptr i64 %688 to i8*
  %690 = load i8* %689
  %691 = icmp ne i8 %690, 0
  br i1 %691, label %692, label %693

; <label>:692                                     ; preds = %685
  call void @__asan_report_load8(i64 %686)
  call void asm sideeffect "", ""()
  unreachable

; <label>:693                                     ; preds = %685
  %694 = load %struct.node** %tail101, align 8
  %firstout102 = getelementptr inbounds %struct.node* %694, i32 0, i32 7
  %695 = ptrtoint %struct.arc** %firstout102 to i64
  %696 = lshr i64 %695, 3
  %697 = or i64 %696, 17592186044416
  %698 = inttoptr i64 %697 to i8*
  %699 = load i8* %698
  %700 = icmp ne i8 %699, 0
  br i1 %700, label %701, label %702

; <label>:701                                     ; preds = %693
  call void @__asan_report_store8(i64 %695)
  call void asm sideeffect "", ""()
  unreachable

; <label>:702                                     ; preds = %693
  store %struct.arc* %incdec.ptr, %struct.arc** %firstout102, align 8
  %head103 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 0, i32 2
  %703 = ptrtoint %struct.node** %head103 to i64
  %704 = lshr i64 %703, 3
  %705 = or i64 %704, 17592186044416
  %706 = inttoptr i64 %705 to i8*
  %707 = load i8* %706
  %708 = icmp ne i8 %707, 0
  br i1 %708, label %709, label %710

; <label>:709                                     ; preds = %702
  call void @__asan_report_load8(i64 %703)
  call void asm sideeffect "", ""()
  unreachable

; <label>:710                                     ; preds = %702
  %711 = load %struct.node** %head103, align 8
  %firstin104 = getelementptr inbounds %struct.node* %711, i32 0, i32 8
  %712 = ptrtoint %struct.arc** %firstin104 to i64
  %713 = lshr i64 %712, 3
  %714 = or i64 %713, 17592186044416
  %715 = inttoptr i64 %714 to i8*
  %716 = load i8* %715
  %717 = icmp ne i8 %716, 0
  br i1 %717, label %718, label %719

; <label>:718                                     ; preds = %710
  call void @__asan_report_load8(i64 %712)
  call void asm sideeffect "", ""()
  unreachable

; <label>:719                                     ; preds = %710
  %720 = load %struct.arc** %firstin104, align 8
  %nextin105 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 0, i32 5
  %721 = ptrtoint %struct.arc** %nextin105 to i64
  %722 = lshr i64 %721, 3
  %723 = or i64 %722, 17592186044416
  %724 = inttoptr i64 %723 to i8*
  %725 = load i8* %724
  %726 = icmp ne i8 %725, 0
  br i1 %726, label %727, label %728

; <label>:727                                     ; preds = %719
  call void @__asan_report_store8(i64 %721)
  call void asm sideeffect "", ""()
  unreachable

; <label>:728                                     ; preds = %719
  store %struct.arc* %720, %struct.arc** %nextin105, align 8
  %head106 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 0, i32 2
  %729 = ptrtoint %struct.node** %head106 to i64
  %730 = lshr i64 %729, 3
  %731 = or i64 %730, 17592186044416
  %732 = inttoptr i64 %731 to i8*
  %733 = load i8* %732
  %734 = icmp ne i8 %733, 0
  br i1 %734, label %735, label %736

; <label>:735                                     ; preds = %728
  call void @__asan_report_load8(i64 %729)
  call void asm sideeffect "", ""()
  unreachable

; <label>:736                                     ; preds = %728
  %737 = load %struct.node** %head106, align 8
  %firstin107 = getelementptr inbounds %struct.node* %737, i32 0, i32 8
  %738 = ptrtoint %struct.arc** %firstin107 to i64
  %739 = lshr i64 %738, 3
  %740 = or i64 %739, 17592186044416
  %741 = inttoptr i64 %740 to i8*
  %742 = load i8* %741
  %743 = icmp ne i8 %742, 0
  br i1 %743, label %744, label %745

; <label>:744                                     ; preds = %736
  call void @__asan_report_store8(i64 %738)
  call void asm sideeffect "", ""()
  unreachable

; <label>:745                                     ; preds = %736
  store %struct.arc* %incdec.ptr, %struct.arc** %firstin107, align 8
  %incdec.ptr108 = getelementptr inbounds %struct.arc* %incdec.ptr, i32 1
  %arrayidx109 = getelementptr inbounds %struct.node* %324, i64 %sigma_node247
  %tail110 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 0, i32 1
  %746 = ptrtoint %struct.node** %tail110 to i64
  %747 = lshr i64 %746, 3
  %748 = or i64 %747, 17592186044416
  %749 = inttoptr i64 %748 to i8*
  %750 = load i8* %749
  %751 = icmp ne i8 %750, 0
  br i1 %751, label %752, label %753

; <label>:752                                     ; preds = %745
  call void @__asan_report_store8(i64 %746)
  call void asm sideeffect "", ""()
  unreachable

; <label>:753                                     ; preds = %745
  store %struct.node* %arrayidx109, %struct.node** %tail110, align 8
  %n_trips111 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %754 = ptrtoint i64* %n_trips111 to i64
  %755 = lshr i64 %754, 3
  %756 = or i64 %755, 17592186044416
  %757 = inttoptr i64 %756 to i8*
  %758 = load i8* %757
  %759 = icmp ne i8 %758, 0
  br i1 %759, label %760, label %761

; <label>:760                                     ; preds = %753
  call void @__asan_report_load8(i64 %754)
  call void asm sideeffect "", ""()
  unreachable

; <label>:761                                     ; preds = %753
  %762 = load i64* %n_trips111, align 8
  %add112 = add nsw i64 %sigma_node247, %762
  %arrayidx113 = getelementptr inbounds %struct.node* %324, i64 %add112
  %head114 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 0, i32 2
  %763 = ptrtoint %struct.node** %head114 to i64
  %764 = lshr i64 %763, 3
  %765 = or i64 %764, 17592186044416
  %766 = inttoptr i64 %765 to i8*
  %767 = load i8* %766
  %768 = icmp ne i8 %767, 0
  br i1 %768, label %769, label %770

; <label>:769                                     ; preds = %761
  call void @__asan_report_store8(i64 %763)
  call void asm sideeffect "", ""()
  unreachable

; <label>:770                                     ; preds = %761
  store %struct.node* %arrayidx113, %struct.node** %head114, align 8
  %bigM115 = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %771 = ptrtoint i64* %bigM115 to i64
  %772 = lshr i64 %771, 3
  %773 = or i64 %772, 17592186044416
  %774 = inttoptr i64 %773 to i8*
  %775 = load i8* %774
  %776 = icmp ne i8 %775, 0
  br i1 %776, label %777, label %778

; <label>:777                                     ; preds = %770
  call void @__asan_report_load8(i64 %771)
  call void asm sideeffect "", ""()
  unreachable

; <label>:778                                     ; preds = %770
  %779 = load i64* %bigM115, align 8
  %cmp116 = icmp sgt i64 %779, 10000000
  br i1 %cmp116, label %cond.true118, label %cond.false120

cond.true118:                                     ; preds = %778
  %sigma_node257 = phi i64 [ %779, %778 ]
  %bigM119 = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %780 = ptrtoint i64* %bigM119 to i64
  %781 = lshr i64 %780, 3
  %782 = or i64 %781, 17592186044416
  %783 = inttoptr i64 %782 to i8*
  %784 = load i8* %783
  %785 = icmp ne i8 %784, 0
  br i1 %785, label %786, label %787

; <label>:786                                     ; preds = %cond.true118
  call void @__asan_report_load8(i64 %780)
  call void asm sideeffect "", ""()
  unreachable

; <label>:787                                     ; preds = %cond.true118
  %788 = load i64* %bigM119, align 8
  br label %cond.end121

cond.false120:                                    ; preds = %778
  %sigma_node258 = phi i64 [ %779, %778 ]
  br label %cond.end121

cond.end121:                                      ; preds = %cond.false120, %787
  %cond = phi i64 [ %788, %787 ], [ 10000000, %cond.false120 ]
  %mul = mul nsw i64 2, %cond
  %cost122 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 0, i32 0
  %789 = ptrtoint i64* %cost122 to i64
  %790 = lshr i64 %789, 3
  %791 = or i64 %790, 17592186044416
  %792 = inttoptr i64 %791 to i8*
  %793 = load i8* %792
  %794 = icmp ne i8 %793, 0
  br i1 %794, label %795, label %796

; <label>:795                                     ; preds = %cond.end121
  call void @__asan_report_store8(i64 %789)
  call void asm sideeffect "", ""()
  unreachable

; <label>:796                                     ; preds = %cond.end121
  store i64 %mul, i64* %cost122, align 8
  %org_cost123 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 0, i32 7
  %797 = ptrtoint i64* %org_cost123 to i64
  %798 = lshr i64 %797, 3
  %799 = or i64 %798, 17592186044416
  %800 = inttoptr i64 %799 to i8*
  %801 = load i8* %800
  %802 = icmp ne i8 %801, 0
  br i1 %802, label %803, label %804

; <label>:803                                     ; preds = %796
  call void @__asan_report_store8(i64 %797)
  call void asm sideeffect "", ""()
  unreachable

; <label>:804                                     ; preds = %796
  store i64 %mul, i64* %org_cost123, align 8
  %tail124 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 0, i32 1
  %805 = ptrtoint %struct.node** %tail124 to i64
  %806 = lshr i64 %805, 3
  %807 = or i64 %806, 17592186044416
  %808 = inttoptr i64 %807 to i8*
  %809 = load i8* %808
  %810 = icmp ne i8 %809, 0
  br i1 %810, label %811, label %812

; <label>:811                                     ; preds = %804
  call void @__asan_report_load8(i64 %805)
  call void asm sideeffect "", ""()
  unreachable

; <label>:812                                     ; preds = %804
  %813 = load %struct.node** %tail124, align 8
  %firstout125 = getelementptr inbounds %struct.node* %813, i32 0, i32 7
  %814 = ptrtoint %struct.arc** %firstout125 to i64
  %815 = lshr i64 %814, 3
  %816 = or i64 %815, 17592186044416
  %817 = inttoptr i64 %816 to i8*
  %818 = load i8* %817
  %819 = icmp ne i8 %818, 0
  br i1 %819, label %820, label %821

; <label>:820                                     ; preds = %812
  call void @__asan_report_load8(i64 %814)
  call void asm sideeffect "", ""()
  unreachable

; <label>:821                                     ; preds = %812
  %822 = load %struct.arc** %firstout125, align 8
  %nextout126 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 0, i32 4
  %823 = ptrtoint %struct.arc** %nextout126 to i64
  %824 = lshr i64 %823, 3
  %825 = or i64 %824, 17592186044416
  %826 = inttoptr i64 %825 to i8*
  %827 = load i8* %826
  %828 = icmp ne i8 %827, 0
  br i1 %828, label %829, label %830

; <label>:829                                     ; preds = %821
  call void @__asan_report_store8(i64 %823)
  call void asm sideeffect "", ""()
  unreachable

; <label>:830                                     ; preds = %821
  store %struct.arc* %822, %struct.arc** %nextout126, align 8
  %tail127 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 0, i32 1
  %831 = ptrtoint %struct.node** %tail127 to i64
  %832 = lshr i64 %831, 3
  %833 = or i64 %832, 17592186044416
  %834 = inttoptr i64 %833 to i8*
  %835 = load i8* %834
  %836 = icmp ne i8 %835, 0
  br i1 %836, label %837, label %838

; <label>:837                                     ; preds = %830
  call void @__asan_report_load8(i64 %831)
  call void asm sideeffect "", ""()
  unreachable

; <label>:838                                     ; preds = %830
  %839 = load %struct.node** %tail127, align 8
  %firstout128 = getelementptr inbounds %struct.node* %839, i32 0, i32 7
  %840 = ptrtoint %struct.arc** %firstout128 to i64
  %841 = lshr i64 %840, 3
  %842 = or i64 %841, 17592186044416
  %843 = inttoptr i64 %842 to i8*
  %844 = load i8* %843
  %845 = icmp ne i8 %844, 0
  br i1 %845, label %846, label %847

; <label>:846                                     ; preds = %838
  call void @__asan_report_store8(i64 %840)
  call void asm sideeffect "", ""()
  unreachable

; <label>:847                                     ; preds = %838
  store %struct.arc* %incdec.ptr108, %struct.arc** %firstout128, align 8
  %head129 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 0, i32 2
  %848 = ptrtoint %struct.node** %head129 to i64
  %849 = lshr i64 %848, 3
  %850 = or i64 %849, 17592186044416
  %851 = inttoptr i64 %850 to i8*
  %852 = load i8* %851
  %853 = icmp ne i8 %852, 0
  br i1 %853, label %854, label %855

; <label>:854                                     ; preds = %847
  call void @__asan_report_load8(i64 %848)
  call void asm sideeffect "", ""()
  unreachable

; <label>:855                                     ; preds = %847
  %856 = load %struct.node** %head129, align 8
  %firstin130 = getelementptr inbounds %struct.node* %856, i32 0, i32 8
  %857 = ptrtoint %struct.arc** %firstin130 to i64
  %858 = lshr i64 %857, 3
  %859 = or i64 %858, 17592186044416
  %860 = inttoptr i64 %859 to i8*
  %861 = load i8* %860
  %862 = icmp ne i8 %861, 0
  br i1 %862, label %863, label %864

; <label>:863                                     ; preds = %855
  call void @__asan_report_load8(i64 %857)
  call void asm sideeffect "", ""()
  unreachable

; <label>:864                                     ; preds = %855
  %865 = load %struct.arc** %firstin130, align 8
  %nextin131 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 0, i32 5
  %866 = ptrtoint %struct.arc** %nextin131 to i64
  %867 = lshr i64 %866, 3
  %868 = or i64 %867, 17592186044416
  %869 = inttoptr i64 %868 to i8*
  %870 = load i8* %869
  %871 = icmp ne i8 %870, 0
  br i1 %871, label %872, label %873

; <label>:872                                     ; preds = %864
  call void @__asan_report_store8(i64 %866)
  call void asm sideeffect "", ""()
  unreachable

; <label>:873                                     ; preds = %864
  store %struct.arc* %865, %struct.arc** %nextin131, align 8
  %head132 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 0, i32 2
  %874 = ptrtoint %struct.node** %head132 to i64
  %875 = lshr i64 %874, 3
  %876 = or i64 %875, 17592186044416
  %877 = inttoptr i64 %876 to i8*
  %878 = load i8* %877
  %879 = icmp ne i8 %878, 0
  br i1 %879, label %880, label %881

; <label>:880                                     ; preds = %873
  call void @__asan_report_load8(i64 %874)
  call void asm sideeffect "", ""()
  unreachable

; <label>:881                                     ; preds = %873
  %882 = load %struct.node** %head132, align 8
  %firstin133 = getelementptr inbounds %struct.node* %882, i32 0, i32 8
  %883 = ptrtoint %struct.arc** %firstin133 to i64
  %884 = lshr i64 %883, 3
  %885 = or i64 %884, 17592186044416
  %886 = inttoptr i64 %885 to i8*
  %887 = load i8* %886
  %888 = icmp ne i8 %887, 0
  br i1 %888, label %889, label %890

; <label>:889                                     ; preds = %881
  call void @__asan_report_store8(i64 %883)
  call void asm sideeffect "", ""()
  unreachable

; <label>:890                                     ; preds = %881
  store %struct.arc* %incdec.ptr108, %struct.arc** %firstin133, align 8
  %incdec.ptr134 = getelementptr inbounds %struct.arc* %incdec.ptr108, i32 1
  br label %for.inc

for.inc:                                          ; preds = %890
  %inc = add nsw i64 %sigma_node247, 1
  br label %for.cond

for.end:                                          ; preds = %341
  %sigma_node250 = phi i64 [ %342, %341 ]
  %sigma_node248 = phi i64 [ %i.0, %341 ]
  %n_trips135 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %891 = ptrtoint i64* %n_trips135 to i64
  %892 = lshr i64 %891, 3
  %893 = or i64 %892, 17592186044416
  %894 = inttoptr i64 %893 to i8*
  %895 = load i8* %894
  %896 = icmp ne i8 %895, 0
  br i1 %896, label %897, label %898

; <label>:897                                     ; preds = %for.end
  call void @__asan_report_load8(i64 %891)
  call void asm sideeffect "", ""()
  unreachable

; <label>:898                                     ; preds = %for.end
  %899 = load i64* %n_trips135, align 8
  %add136 = add nsw i64 %899, 1
  %cmp137 = icmp ne i64 %sigma_node248, %add136
  br i1 %cmp137, label %if.then139, label %if.end140

if.then139:                                       ; preds = %898
  %sigma_node261 = phi i64 [ %add136, %898 ]
  %sigma_node259 = phi i64 [ %sigma_node248, %898 ]
  br label %return

if.end140:                                        ; preds = %898
  %sigma_node262 = phi i64 [ %add136, %898 ]
  %sigma_node260 = phi i64 [ %sigma_node248, %898 ]
  br label %for.cond141

for.cond141:                                      ; preds = %for.inc172, %if.end140
  %phi_node307 = phi i64* [ %8, %if.end140 ], [ %omega_node306, %for.inc172 ]
  %phi_node305 = phi i64* [ %phi_node297, %if.end140 ], [ %omega_node304, %for.inc172 ]
  %phi_node303 = phi i64* [ %phi_node295, %if.end140 ], [ %omega_node302, %for.inc172 ]
  %phi_node300 = phi %struct._IO_FILE* [ %phi_node, %if.end140 ], [ %omega_node299, %for.inc172 ]
  %i.1 = phi i64 [ 0, %if.end140 ], [ %inc173, %for.inc172 ]
  %arc.1 = phi %struct.arc* [ %arc.0, %if.end140 ], [ %incdec.ptr174, %for.inc172 ]
  %m_org142 = getelementptr inbounds %struct.network* %net, i32 0, i32 6
  %900 = ptrtoint i64* %m_org142 to i64
  %901 = lshr i64 %900, 3
  %902 = or i64 %901, 17592186044416
  %903 = inttoptr i64 %902 to i8*
  %904 = load i8* %903
  %905 = icmp ne i8 %904, 0
  br i1 %905, label %906, label %907

; <label>:906                                     ; preds = %for.cond141
  call void @__asan_report_load8(i64 %900)
  call void asm sideeffect "", ""()
  unreachable

; <label>:907                                     ; preds = %for.cond141
  %908 = load i64* %m_org142, align 8
  %cmp143 = icmp slt i64 %i.1, %908
  br i1 %cmp143, label %for.body145, label %for.end175

for.body145:                                      ; preds = %907
  %sigma_node265 = phi i64 [ %908, %907 ]
  %sigma_node263 = phi i64 [ %i.1, %907 ]
  %arraydecay146 = getelementptr inbounds [201 x i8]* %2, i32 0, i32 0, !byte_size !0, !safe !1, !index_size !2
  br label %for.body145.split

for.body145.split:                                ; preds = %for.body145
  %omega_node299 = phi %struct._IO_FILE* [ %phi_node300, %for.body145 ]
  %omega_node298 = phi i8* [ %arraydecay146, %for.body145 ], !byte_size !0, !safe !1, !index_size !2
  %call147 = call i8* @fgets(i8* %omega_node298, i32 200, %struct._IO_FILE* %omega_node299)
  %arraydecay148 = getelementptr inbounds [201 x i8]* %2, i32 0, i32 0, !byte_size !0, !safe !1, !index_size !2
  br label %for.body145.split.split

for.body145.split.split:                          ; preds = %for.body145.split
  %omega_node306 = phi i64* [ %phi_node307, %for.body145.split ]
  %omega_node304 = phi i64* [ %phi_node305, %for.body145.split ]
  %omega_node302 = phi i64* [ %phi_node303, %for.body145.split ]
  %omega_node301 = phi i8* [ %arraydecay148, %for.body145.split ], !byte_size !0, !safe !1, !index_size !2
  %call149 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %omega_node301, i8* getelementptr inbounds ({ [12 x i8], [52 x i8] }* @.str5, i32 0, i32 0, i32 0), i64* %omega_node302, i64* %omega_node304, i64* %omega_node306) nounwind
  %cmp150 = icmp ne i32 %call149, 3
  br i1 %cmp150, label %if.then152, label %if.end153

if.then152:                                       ; preds = %for.body145.split.split
  %sigma_node267 = phi i32 [ %call149, %for.body145.split.split ]
  br label %return

if.end153:                                        ; preds = %for.body145.split.split
  %sigma_node268 = phi i32 [ %call149, %for.body145.split.split ]
  %909 = ptrtoint i64* %phi_node303 to i64
  %910 = lshr i64 %909, 3
  %911 = or i64 %910, 17592186044416
  %912 = inttoptr i64 %911 to i8*
  %913 = load i8* %912
  %914 = icmp ne i8 %913, 0
  br i1 %914, label %915, label %916

; <label>:915                                     ; preds = %if.end153
  call void @__asan_report_load8(i64 %909)
  call void asm sideeffect "", ""()
  unreachable

; <label>:916                                     ; preds = %if.end153
  %917 = load i64* %phi_node303, align 8
  %n_trips154 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %918 = ptrtoint i64* %n_trips154 to i64
  %919 = lshr i64 %918, 3
  %920 = or i64 %919, 17592186044416
  %921 = inttoptr i64 %920 to i8*
  %922 = load i8* %921
  %923 = icmp ne i8 %922, 0
  br i1 %923, label %924, label %925

; <label>:924                                     ; preds = %916
  call void @__asan_report_load8(i64 %918)
  call void asm sideeffect "", ""()
  unreachable

; <label>:925                                     ; preds = %916
  %926 = load i64* %n_trips154, align 8
  %add155 = add nsw i64 %917, %926
  %arrayidx156 = getelementptr inbounds %struct.node* %324, i64 %add155
  %tail157 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 1
  %927 = ptrtoint %struct.node** %tail157 to i64
  %928 = lshr i64 %927, 3
  %929 = or i64 %928, 17592186044416
  %930 = inttoptr i64 %929 to i8*
  %931 = load i8* %930
  %932 = icmp ne i8 %931, 0
  br i1 %932, label %933, label %934

; <label>:933                                     ; preds = %925
  call void @__asan_report_store8(i64 %927)
  call void asm sideeffect "", ""()
  unreachable

; <label>:934                                     ; preds = %925
  store %struct.node* %arrayidx156, %struct.node** %tail157, align 8
  %935 = ptrtoint i64* %phi_node305 to i64
  %936 = lshr i64 %935, 3
  %937 = or i64 %936, 17592186044416
  %938 = inttoptr i64 %937 to i8*
  %939 = load i8* %938
  %940 = icmp ne i8 %939, 0
  br i1 %940, label %941, label %942

; <label>:941                                     ; preds = %934
  call void @__asan_report_load8(i64 %935)
  call void asm sideeffect "", ""()
  unreachable

; <label>:942                                     ; preds = %934
  %943 = load i64* %phi_node305, align 8
  %arrayidx158 = getelementptr inbounds %struct.node* %324, i64 %943
  %head159 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 2
  %944 = ptrtoint %struct.node** %head159 to i64
  %945 = lshr i64 %944, 3
  %946 = or i64 %945, 17592186044416
  %947 = inttoptr i64 %946 to i8*
  %948 = load i8* %947
  %949 = icmp ne i8 %948, 0
  br i1 %949, label %950, label %951

; <label>:950                                     ; preds = %942
  call void @__asan_report_store8(i64 %944)
  call void asm sideeffect "", ""()
  unreachable

; <label>:951                                     ; preds = %942
  store %struct.node* %arrayidx158, %struct.node** %head159, align 8
  %952 = ptrtoint i64* %phi_node307 to i64
  %953 = lshr i64 %952, 3
  %954 = or i64 %953, 17592186044416
  %955 = inttoptr i64 %954 to i8*
  %956 = load i8* %955
  %957 = icmp ne i8 %956, 0
  br i1 %957, label %958, label %959

; <label>:958                                     ; preds = %951
  call void @__asan_report_load8(i64 %952)
  call void asm sideeffect "", ""()
  unreachable

; <label>:959                                     ; preds = %951
  %960 = load i64* %phi_node307, align 8
  %org_cost160 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 7
  %961 = ptrtoint i64* %org_cost160 to i64
  %962 = lshr i64 %961, 3
  %963 = or i64 %962, 17592186044416
  %964 = inttoptr i64 %963 to i8*
  %965 = load i8* %964
  %966 = icmp ne i8 %965, 0
  br i1 %966, label %967, label %968

; <label>:967                                     ; preds = %959
  call void @__asan_report_store8(i64 %961)
  call void asm sideeffect "", ""()
  unreachable

; <label>:968                                     ; preds = %959
  store i64 %960, i64* %org_cost160, align 8
  %969 = load i64* %phi_node307, align 8
  %cost161 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 0
  %970 = ptrtoint i64* %cost161 to i64
  %971 = lshr i64 %970, 3
  %972 = or i64 %971, 17592186044416
  %973 = inttoptr i64 %972 to i8*
  %974 = load i8* %973
  %975 = icmp ne i8 %974, 0
  br i1 %975, label %976, label %977

; <label>:976                                     ; preds = %968
  call void @__asan_report_store8(i64 %970)
  call void asm sideeffect "", ""()
  unreachable

; <label>:977                                     ; preds = %968
  store i64 %969, i64* %cost161, align 8
  %tail162 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 1
  %978 = ptrtoint %struct.node** %tail162 to i64
  %979 = lshr i64 %978, 3
  %980 = or i64 %979, 17592186044416
  %981 = inttoptr i64 %980 to i8*
  %982 = load i8* %981
  %983 = icmp ne i8 %982, 0
  br i1 %983, label %984, label %985

; <label>:984                                     ; preds = %977
  call void @__asan_report_load8(i64 %978)
  call void asm sideeffect "", ""()
  unreachable

; <label>:985                                     ; preds = %977
  %986 = load %struct.node** %tail162, align 8
  %firstout163 = getelementptr inbounds %struct.node* %986, i32 0, i32 7
  %987 = ptrtoint %struct.arc** %firstout163 to i64
  %988 = lshr i64 %987, 3
  %989 = or i64 %988, 17592186044416
  %990 = inttoptr i64 %989 to i8*
  %991 = load i8* %990
  %992 = icmp ne i8 %991, 0
  br i1 %992, label %993, label %994

; <label>:993                                     ; preds = %985
  call void @__asan_report_load8(i64 %987)
  call void asm sideeffect "", ""()
  unreachable

; <label>:994                                     ; preds = %985
  %995 = load %struct.arc** %firstout163, align 8
  %nextout164 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 4
  %996 = ptrtoint %struct.arc** %nextout164 to i64
  %997 = lshr i64 %996, 3
  %998 = or i64 %997, 17592186044416
  %999 = inttoptr i64 %998 to i8*
  %1000 = load i8* %999
  %1001 = icmp ne i8 %1000, 0
  br i1 %1001, label %1002, label %1003

; <label>:1002                                    ; preds = %994
  call void @__asan_report_store8(i64 %996)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1003                                    ; preds = %994
  store %struct.arc* %995, %struct.arc** %nextout164, align 8
  %tail165 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 1
  %1004 = ptrtoint %struct.node** %tail165 to i64
  %1005 = lshr i64 %1004, 3
  %1006 = or i64 %1005, 17592186044416
  %1007 = inttoptr i64 %1006 to i8*
  %1008 = load i8* %1007
  %1009 = icmp ne i8 %1008, 0
  br i1 %1009, label %1010, label %1011

; <label>:1010                                    ; preds = %1003
  call void @__asan_report_load8(i64 %1004)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1011                                    ; preds = %1003
  %1012 = load %struct.node** %tail165, align 8
  %firstout166 = getelementptr inbounds %struct.node* %1012, i32 0, i32 7
  %1013 = ptrtoint %struct.arc** %firstout166 to i64
  %1014 = lshr i64 %1013, 3
  %1015 = or i64 %1014, 17592186044416
  %1016 = inttoptr i64 %1015 to i8*
  %1017 = load i8* %1016
  %1018 = icmp ne i8 %1017, 0
  br i1 %1018, label %1019, label %1020

; <label>:1019                                    ; preds = %1011
  call void @__asan_report_store8(i64 %1013)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1020                                    ; preds = %1011
  store %struct.arc* %arc.1, %struct.arc** %firstout166, align 8
  %head167 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 2
  %1021 = ptrtoint %struct.node** %head167 to i64
  %1022 = lshr i64 %1021, 3
  %1023 = or i64 %1022, 17592186044416
  %1024 = inttoptr i64 %1023 to i8*
  %1025 = load i8* %1024
  %1026 = icmp ne i8 %1025, 0
  br i1 %1026, label %1027, label %1028

; <label>:1027                                    ; preds = %1020
  call void @__asan_report_load8(i64 %1021)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1028                                    ; preds = %1020
  %1029 = load %struct.node** %head167, align 8
  %firstin168 = getelementptr inbounds %struct.node* %1029, i32 0, i32 8
  %1030 = ptrtoint %struct.arc** %firstin168 to i64
  %1031 = lshr i64 %1030, 3
  %1032 = or i64 %1031, 17592186044416
  %1033 = inttoptr i64 %1032 to i8*
  %1034 = load i8* %1033
  %1035 = icmp ne i8 %1034, 0
  br i1 %1035, label %1036, label %1037

; <label>:1036                                    ; preds = %1028
  call void @__asan_report_load8(i64 %1030)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1037                                    ; preds = %1028
  %1038 = load %struct.arc** %firstin168, align 8
  %nextin169 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 5
  %1039 = ptrtoint %struct.arc** %nextin169 to i64
  %1040 = lshr i64 %1039, 3
  %1041 = or i64 %1040, 17592186044416
  %1042 = inttoptr i64 %1041 to i8*
  %1043 = load i8* %1042
  %1044 = icmp ne i8 %1043, 0
  br i1 %1044, label %1045, label %1046

; <label>:1045                                    ; preds = %1037
  call void @__asan_report_store8(i64 %1039)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1046                                    ; preds = %1037
  store %struct.arc* %1038, %struct.arc** %nextin169, align 8
  %head170 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 2
  %1047 = ptrtoint %struct.node** %head170 to i64
  %1048 = lshr i64 %1047, 3
  %1049 = or i64 %1048, 17592186044416
  %1050 = inttoptr i64 %1049 to i8*
  %1051 = load i8* %1050
  %1052 = icmp ne i8 %1051, 0
  br i1 %1052, label %1053, label %1054

; <label>:1053                                    ; preds = %1046
  call void @__asan_report_load8(i64 %1047)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1054                                    ; preds = %1046
  %1055 = load %struct.node** %head170, align 8
  %firstin171 = getelementptr inbounds %struct.node* %1055, i32 0, i32 8
  %1056 = ptrtoint %struct.arc** %firstin171 to i64
  %1057 = lshr i64 %1056, 3
  %1058 = or i64 %1057, 17592186044416
  %1059 = inttoptr i64 %1058 to i8*
  %1060 = load i8* %1059
  %1061 = icmp ne i8 %1060, 0
  br i1 %1061, label %1062, label %1063

; <label>:1062                                    ; preds = %1054
  call void @__asan_report_store8(i64 %1056)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1063                                    ; preds = %1054
  store %struct.arc* %arc.1, %struct.arc** %firstin171, align 8
  br label %for.inc172

for.inc172:                                       ; preds = %1063
  %inc173 = add nsw i64 %sigma_node263, 1
  %incdec.ptr174 = getelementptr inbounds %struct.arc* %arc.1, i32 1
  br label %for.cond141

for.end175:                                       ; preds = %907
  %sigma_node266 = phi i64 [ %908, %907 ]
  %sigma_node264 = phi i64 [ %i.1, %907 ]
  %stop_arcs176 = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %1064 = ptrtoint %struct.arc** %stop_arcs176 to i64
  %1065 = lshr i64 %1064, 3
  %1066 = or i64 %1065, 17592186044416
  %1067 = inttoptr i64 %1066 to i8*
  %1068 = load i8* %1067
  %1069 = icmp ne i8 %1068, 0
  br i1 %1069, label %1070, label %1071

; <label>:1070                                    ; preds = %for.end175
  call void @__asan_report_load8(i64 %1064)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1071                                    ; preds = %for.end175
  %1072 = load %struct.arc** %stop_arcs176, align 8
  %cmp177 = icmp ne %struct.arc* %1072, %arc.1
  br i1 %cmp177, label %if.then179, label %for.end175.if.end195_crit_edge

for.end175.if.end195_crit_edge:                   ; preds = %1071
  %sigma_node272 = phi %struct.arc* [ %arc.1, %1071 ]
  %sigma_node270 = phi %struct.arc* [ %1072, %1071 ]
  br label %if.end195

if.then179:                                       ; preds = %1071
  %sigma_node271 = phi %struct.arc* [ %arc.1, %1071 ]
  %sigma_node269 = phi %struct.arc* [ %1072, %1071 ]
  %stop_arcs180 = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %1073 = ptrtoint %struct.arc** %stop_arcs180 to i64
  %1074 = lshr i64 %1073, 3
  %1075 = or i64 %1074, 17592186044416
  %1076 = inttoptr i64 %1075 to i8*
  %1077 = load i8* %1076
  %1078 = icmp ne i8 %1077, 0
  br i1 %1078, label %1079, label %1080

; <label>:1079                                    ; preds = %if.then179
  call void @__asan_report_store8(i64 %1073)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1080                                    ; preds = %if.then179
  store %struct.arc* %sigma_node271, %struct.arc** %stop_arcs180, align 8
  %arcs181 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %1081 = ptrtoint %struct.arc** %arcs181 to i64
  %1082 = lshr i64 %1081, 3
  %1083 = or i64 %1082, 17592186044416
  %1084 = inttoptr i64 %1083 to i8*
  %1085 = load i8* %1084
  %1086 = icmp ne i8 %1085, 0
  br i1 %1086, label %1087, label %1088

; <label>:1087                                    ; preds = %1080
  call void @__asan_report_load8(i64 %1081)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1088                                    ; preds = %1080
  %1089 = load %struct.arc** %arcs181, align 8
  %m182 = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %1090 = ptrtoint i64* %m182 to i64
  %1091 = lshr i64 %1090, 3
  %1092 = or i64 %1091, 17592186044416
  %1093 = inttoptr i64 %1092 to i8*
  %1094 = load i8* %1093
  %1095 = icmp ne i8 %1094, 0
  br i1 %1095, label %1096, label %1097

; <label>:1096                                    ; preds = %1088
  call void @__asan_report_store8(i64 %1090)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1097                                    ; preds = %1088
  store i64 0, i64* %m182, align 8
  br label %for.cond183

for.cond183:                                      ; preds = %for.inc190, %1097
  %arc.2 = phi %struct.arc* [ %1089, %1097 ], [ %incdec.ptr191, %for.inc190 ]
  %stop_arcs184 = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %1098 = ptrtoint %struct.arc** %stop_arcs184 to i64
  %1099 = lshr i64 %1098, 3
  %1100 = or i64 %1099, 17592186044416
  %1101 = inttoptr i64 %1100 to i8*
  %1102 = load i8* %1101
  %1103 = icmp ne i8 %1102, 0
  br i1 %1103, label %1104, label %1105

; <label>:1104                                    ; preds = %for.cond183
  call void @__asan_report_load8(i64 %1098)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1105                                    ; preds = %for.cond183
  %1106 = load %struct.arc** %stop_arcs184, align 8
  %cmp185 = icmp ult %struct.arc* %arc.2, %1106
  br i1 %cmp185, label %for.body187, label %for.end192

for.body187:                                      ; preds = %1105
  %sigma_node275 = phi %struct.arc* [ %1106, %1105 ]
  %sigma_node273 = phi %struct.arc* [ %arc.2, %1105 ]
  %m188 = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %1107 = ptrtoint i64* %m188 to i64
  %1108 = lshr i64 %1107, 3
  %1109 = or i64 %1108, 17592186044416
  %1110 = inttoptr i64 %1109 to i8*
  %1111 = load i8* %1110
  %1112 = icmp ne i8 %1111, 0
  br i1 %1112, label %1113, label %1114

; <label>:1113                                    ; preds = %for.body187
  call void @__asan_report_load8(i64 %1107)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1114                                    ; preds = %for.body187
  %1115 = load i64* %m188, align 8
  %inc189 = add nsw i64 %1115, 1
  store i64 %inc189, i64* %m188, align 8
  br label %for.inc190

for.inc190:                                       ; preds = %1114
  %incdec.ptr191 = getelementptr inbounds %struct.arc* %sigma_node273, i32 1
  br label %for.cond183

for.end192:                                       ; preds = %1105
  %sigma_node276 = phi %struct.arc* [ %1106, %1105 ]
  %sigma_node274 = phi %struct.arc* [ %arc.2, %1105 ]
  %m193 = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %1116 = ptrtoint i64* %m193 to i64
  %1117 = lshr i64 %1116, 3
  %1118 = or i64 %1117, 17592186044416
  %1119 = inttoptr i64 %1118 to i8*
  %1120 = load i8* %1119
  %1121 = icmp ne i8 %1120, 0
  br i1 %1121, label %1122, label %1123

; <label>:1122                                    ; preds = %for.end192
  call void @__asan_report_load8(i64 %1116)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1123                                    ; preds = %for.end192
  %1124 = load i64* %m193, align 8
  %m_org194 = getelementptr inbounds %struct.network* %net, i32 0, i32 6
  %1125 = ptrtoint i64* %m_org194 to i64
  %1126 = lshr i64 %1125, 3
  %1127 = or i64 %1126, 17592186044416
  %1128 = inttoptr i64 %1127 to i8*
  %1129 = load i8* %1128
  %1130 = icmp ne i8 %1129, 0
  br i1 %1130, label %1131, label %1132

; <label>:1131                                    ; preds = %1123
  call void @__asan_report_store8(i64 %1125)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1132                                    ; preds = %1123
  store i64 %1124, i64* %m_org194, align 8
  br label %if.end195

if.end195:                                        ; preds = %for.end175.if.end195_crit_edge, %1132
  br label %if.end195.split

if.end195.split:                                  ; preds = %if.end195
  %omega_node308 = phi %struct._IO_FILE* [ %phi_node300, %if.end195 ]
  %call196 = call i32 @fclose(%struct._IO_FILE* %omega_node308)
  %clustfile = getelementptr inbounds %struct.network* %net, i32 0, i32 1
  %arrayidx197 = getelementptr inbounds [200 x i8]* %clustfile, i32 0, i64 0
  %1133 = ptrtoint i8* %arrayidx197 to i64
  %1134 = lshr i64 %1133, 3
  %1135 = or i64 %1134, 17592186044416
  %1136 = inttoptr i64 %1135 to i8*
  %1137 = load i8* %1136
  %1138 = icmp ne i8 %1137, 0
  br i1 %1138, label %1139, label %1144

; <label>:1139                                    ; preds = %if.end195.split
  %1140 = and i64 %1133, 7
  %1141 = trunc i64 %1140 to i8
  %1142 = icmp sge i8 %1141, %1137
  br i1 %1142, label %1143, label %1144

; <label>:1143                                    ; preds = %1139
  call void @__asan_report_store1(i64 %1133)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1144                                    ; preds = %1139, %if.end195.split
  store i8 0, i8* %arrayidx197, align 1
  br label %for.cond198

for.cond198:                                      ; preds = %for.inc231, %1144
  %i.2 = phi i64 [ 1, %1144 ], [ %inc232, %for.inc231 ]
  %n_trips199 = getelementptr inbounds %struct.network* %net, i32 0, i32 3
  %1145 = ptrtoint i64* %n_trips199 to i64
  %1146 = lshr i64 %1145, 3
  %1147 = or i64 %1146, 17592186044416
  %1148 = inttoptr i64 %1147 to i8*
  %1149 = load i8* %1148
  %1150 = icmp ne i8 %1149, 0
  br i1 %1150, label %1151, label %1152

; <label>:1151                                    ; preds = %for.cond198
  call void @__asan_report_load8(i64 %1145)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1152                                    ; preds = %for.cond198
  %1153 = load i64* %n_trips199, align 8
  %cmp200 = icmp sle i64 %i.2, %1153
  br i1 %cmp200, label %for.body202, label %for.end233

for.body202:                                      ; preds = %1152
  %sigma_node279 = phi i64 [ %1153, %1152 ]
  %sigma_node277 = phi i64 [ %i.2, %1152 ]
  %bigM203 = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %1154 = ptrtoint i64* %bigM203 to i64
  %1155 = lshr i64 %1154, 3
  %1156 = or i64 %1155, 17592186044416
  %1157 = inttoptr i64 %1156 to i8*
  %1158 = load i8* %1157
  %1159 = icmp ne i8 %1158, 0
  br i1 %1159, label %1160, label %1161

; <label>:1160                                    ; preds = %for.body202
  call void @__asan_report_load8(i64 %1154)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1161                                    ; preds = %for.body202
  %1162 = load i64* %bigM203, align 8
  %cmp204 = icmp sgt i64 %1162, 10000000
  br i1 %cmp204, label %cond.true206, label %cond.false208

cond.true206:                                     ; preds = %1161
  %sigma_node281 = phi i64 [ %1162, %1161 ]
  %bigM207 = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %1163 = ptrtoint i64* %bigM207 to i64
  %1164 = lshr i64 %1163, 3
  %1165 = or i64 %1164, 17592186044416
  %1166 = inttoptr i64 %1165 to i8*
  %1167 = load i8* %1166
  %1168 = icmp ne i8 %1167, 0
  br i1 %1168, label %1169, label %1170

; <label>:1169                                    ; preds = %cond.true206
  call void @__asan_report_load8(i64 %1163)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1170                                    ; preds = %cond.true206
  %1171 = load i64* %bigM207, align 8
  br label %cond.end209

cond.false208:                                    ; preds = %1161
  %sigma_node282 = phi i64 [ %1162, %1161 ]
  br label %cond.end209

cond.end209:                                      ; preds = %cond.false208, %1170
  %cond210 = phi i64 [ %1171, %1170 ], [ 10000000, %cond.false208 ]
  %mul211 = mul nsw i64 -2, %cond210
  %mul212 = mul nsw i64 3, %sigma_node277
  %sub213 = sub nsw i64 %mul212, 1
  %arcs214 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %1172 = ptrtoint %struct.arc** %arcs214 to i64
  %1173 = lshr i64 %1172, 3
  %1174 = or i64 %1173, 17592186044416
  %1175 = inttoptr i64 %1174 to i8*
  %1176 = load i8* %1175
  %1177 = icmp ne i8 %1176, 0
  br i1 %1177, label %1178, label %1179

; <label>:1178                                    ; preds = %cond.end209
  call void @__asan_report_load8(i64 %1172)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1179                                    ; preds = %cond.end209
  %1180 = load %struct.arc** %arcs214, align 8
  %arrayidx215 = getelementptr inbounds %struct.arc* %1180, i64 %sub213
  %cost216 = getelementptr inbounds %struct.arc* %arrayidx215, i32 0, i32 0
  %1181 = ptrtoint i64* %cost216 to i64
  %1182 = lshr i64 %1181, 3
  %1183 = or i64 %1182, 17592186044416
  %1184 = inttoptr i64 %1183 to i8*
  %1185 = load i8* %1184
  %1186 = icmp ne i8 %1185, 0
  br i1 %1186, label %1187, label %1188

; <label>:1187                                    ; preds = %1179
  call void @__asan_report_store8(i64 %1181)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1188                                    ; preds = %1179
  store i64 %mul211, i64* %cost216, align 8
  %bigM217 = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %1189 = ptrtoint i64* %bigM217 to i64
  %1190 = lshr i64 %1189, 3
  %1191 = or i64 %1190, 17592186044416
  %1192 = inttoptr i64 %1191 to i8*
  %1193 = load i8* %1192
  %1194 = icmp ne i8 %1193, 0
  br i1 %1194, label %1195, label %1196

; <label>:1195                                    ; preds = %1188
  call void @__asan_report_load8(i64 %1189)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1196                                    ; preds = %1188
  %1197 = load i64* %bigM217, align 8
  %cmp218 = icmp sgt i64 %1197, 10000000
  br i1 %cmp218, label %cond.true220, label %cond.false222

cond.true220:                                     ; preds = %1196
  %sigma_node283 = phi i64 [ %1197, %1196 ]
  %bigM221 = getelementptr inbounds %struct.network* %net, i32 0, i32 18
  %1198 = ptrtoint i64* %bigM221 to i64
  %1199 = lshr i64 %1198, 3
  %1200 = or i64 %1199, 17592186044416
  %1201 = inttoptr i64 %1200 to i8*
  %1202 = load i8* %1201
  %1203 = icmp ne i8 %1202, 0
  br i1 %1203, label %1204, label %1205

; <label>:1204                                    ; preds = %cond.true220
  call void @__asan_report_load8(i64 %1198)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1205                                    ; preds = %cond.true220
  %1206 = load i64* %bigM221, align 8
  br label %cond.end223

cond.false222:                                    ; preds = %1196
  %sigma_node284 = phi i64 [ %1197, %1196 ]
  br label %cond.end223

cond.end223:                                      ; preds = %cond.false222, %1205
  %cond224 = phi i64 [ %1206, %1205 ], [ 10000000, %cond.false222 ]
  %mul225 = mul nsw i64 -2, %cond224
  %mul226 = mul nsw i64 3, %sigma_node277
  %sub227 = sub nsw i64 %mul226, 1
  %arcs228 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %1207 = ptrtoint %struct.arc** %arcs228 to i64
  %1208 = lshr i64 %1207, 3
  %1209 = or i64 %1208, 17592186044416
  %1210 = inttoptr i64 %1209 to i8*
  %1211 = load i8* %1210
  %1212 = icmp ne i8 %1211, 0
  br i1 %1212, label %1213, label %1214

; <label>:1213                                    ; preds = %cond.end223
  call void @__asan_report_load8(i64 %1207)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1214                                    ; preds = %cond.end223
  %1215 = load %struct.arc** %arcs228, align 8
  %arrayidx229 = getelementptr inbounds %struct.arc* %1215, i64 %sub227
  %org_cost230 = getelementptr inbounds %struct.arc* %arrayidx229, i32 0, i32 7
  %1216 = ptrtoint i64* %org_cost230 to i64
  %1217 = lshr i64 %1216, 3
  %1218 = or i64 %1217, 17592186044416
  %1219 = inttoptr i64 %1218 to i8*
  %1220 = load i8* %1219
  %1221 = icmp ne i8 %1220, 0
  br i1 %1221, label %1222, label %1223

; <label>:1222                                    ; preds = %1214
  call void @__asan_report_store8(i64 %1216)
  call void asm sideeffect "", ""()
  unreachable

; <label>:1223                                    ; preds = %1214
  store i64 %mul225, i64* %org_cost230, align 8
  br label %for.inc231

for.inc231:                                       ; preds = %1223
  %inc232 = add nsw i64 %sigma_node277, 1
  br label %for.cond198

for.end233:                                       ; preds = %1152
  %sigma_node280 = phi i64 [ %1153, %1152 ]
  %sigma_node278 = phi i64 [ %i.2, %1152 ]
  br label %return

return:                                           ; preds = %for.end233, %if.then152, %if.then139, %if.then59, %if.then36.split.split, %if.then6, %if.then
  %retval.0 = phi i64 [ -1, %if.then ], [ -1, %if.then6 ], [ -1, %if.then59 ], [ -1, %if.then139 ], [ -1, %if.then152 ], [ 0, %for.end233 ], [ -1, %if.then36.split.split ]
  store i64 1172321806, i64* %9
  %1224 = inttoptr i64 %13 to i32*
  store i32 0, i32* %1224
  %1225 = add i64 %13, 28
  %1226 = inttoptr i64 %1225 to i32*
  store i32 0, i32* %1226
  %1227 = add i64 %13, 32
  %1228 = inttoptr i64 %1227 to i32*
  store i32 0, i32* %1228
  %1229 = add i64 %13, 36
  %1230 = inttoptr i64 %1229 to i32*
  store i32 0, i32* %1230
  %1231 = add i64 %13, 40
  %1232 = inttoptr i64 %1231 to i32*
  store i32 0, i32* %1232
  %1233 = add i64 %13, 44
  %1234 = inttoptr i64 %1233 to i32*
  store i32 0, i32* %1234
  %1235 = add i64 %13, 48
  %1236 = inttoptr i64 %1235 to i32*
  store i32 0, i32* %1236
  %1237 = add i64 %13, 52
  %1238 = inttoptr i64 %1237 to i32*
  store i32 0, i32* %1238
  %1239 = add i64 %13, 56
  %1240 = inttoptr i64 %1239 to i32*
  store i32 0, i32* %1240
  ret i64 %retval.0
}

declare %struct._IO_FILE* @fopen(i8*, i8*)

declare i8* @fgets(i8*, i32, %struct._IO_FILE*)

declare i32 @__isoc99_sscanf(i8*, i8*, ...) nounwind

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

declare noalias i8* @calloc(i64, i64) nounwind

declare i32 @printf(i8*, ...)

declare i64 @getfree(%struct.network*)

declare i32 @fclose(%struct._IO_FILE*)

define internal void @asan.module_ctor() {
  call void @__asan_init()
  %1 = load volatile i64* @__asan_mapping_offset
  %2 = load volatile i64* @__asan_mapping_scale
  call void @__asan_register_globals(i64 ptrtoint ([7 x { i64, i64, i64, i64, i64 }]* @0 to i64), i64 7)
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

declare i64 @__asan_stack_malloc(i64, i64)

declare void @__asan_stack_free(i64, i64, i64)

declare void @__asan_poison_stack_memory(i64, i64)

declare void @__asan_unpoison_stack_memory(i64, i64)

declare void @__asan_before_dynamic_init(i64, i64)

declare void @__asan_after_dynamic_init()

declare void @__asan_register_globals(i64, i64)

declare void @__asan_unregister_globals(i64, i64)

define internal void @asan.module_dtor() {
  call void @__asan_unregister_globals(i64 ptrtoint ([7 x { i64, i64, i64, i64, i64 }]* @0 to i64), i64 7)
  ret void
}

!0 = metadata !{i32 201}
!1 = metadata !{}
!2 = metadata !{i32 1}
!3 = metadata !{i32 8}
