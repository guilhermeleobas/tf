; ModuleID = 'psimplex.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.network = type { [200 x i8], [200 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double, i64, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i64 }
%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }

@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]
@__asan_gen_ = private constant [85 x i8] c"primal_net_simplex 4 32 8 5 delta 96 8 7 xchange 160 8 1 w 224 8 15 red_cost_of_bea \00"

define i64 @primal_net_simplex(%struct.network* %net) address_safety nounwind {
entry:
  %MyAlloca = alloca [288 x i8], align 32
  %0 = ptrtoint [288 x i8]* %MyAlloca to i64
  %1 = add i64 %0, 32
  %2 = inttoptr i64 %1 to i64*
  %3 = add i64 %0, 96
  %4 = inttoptr i64 %3 to i64*
  %5 = add i64 %0, 160
  %6 = inttoptr i64 %5 to %struct.node**
  %7 = add i64 %0, 224
  %8 = inttoptr i64 %7 to i64*
  %9 = inttoptr i64 %0 to i64*
  store i64 1102416563, i64* %9
  %10 = add i64 %0, 8
  %11 = inttoptr i64 %10 to i64*
  store i64 ptrtoint ([85 x i8]* @__asan_gen_ to i64), i64* %11
  %12 = lshr i64 %0, 3
  %13 = or i64 %12, 17592186044416
  %14 = inttoptr i64 %13 to i32*
  store i32 -235802127, i32* %14
  %15 = add i64 %13, 4
  %16 = inttoptr i64 %15 to i32*
  store i32 -185273344, i32* %16
  %17 = add i64 %13, 8
  %18 = inttoptr i64 %17 to i32*
  store i32 -218959118, i32* %18
  %19 = add i64 %13, 12
  %20 = inttoptr i64 %19 to i32*
  store i32 -185273344, i32* %20
  %21 = add i64 %13, 16
  %22 = inttoptr i64 %21 to i32*
  store i32 -218959118, i32* %22
  %23 = add i64 %13, 20
  %24 = inttoptr i64 %23 to i32*
  store i32 -185273344, i32* %24
  %25 = add i64 %13, 24
  %26 = inttoptr i64 %25 to i32*
  store i32 -218959118, i32* %26
  %27 = add i64 %13, 28
  %28 = inttoptr i64 %27 to i32*
  store i32 -185273344, i32* %28
  %29 = add i64 %13, 32
  %30 = inttoptr i64 %29 to i32*
  store i32 -202116109, i32* %30
  %arcs1 = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %31 = ptrtoint %struct.arc** %arcs1 to i64
  %32 = lshr i64 %31, 3
  %33 = or i64 %32, 17592186044416
  %34 = inttoptr i64 %33 to i8*
  %35 = load i8* %34
  %36 = icmp ne i8 %35, 0
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %entry
  call void @__asan_report_load8(i64 %31)
  call void asm sideeffect "", ""()
  unreachable

; <label>:38                                      ; preds = %entry
  %39 = load %struct.arc** %arcs1, align 8
  %stop_arcs2 = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %40 = ptrtoint %struct.arc** %stop_arcs2 to i64
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
  %48 = load %struct.arc** %stop_arcs2, align 8
  %m3 = getelementptr inbounds %struct.network* %net, i32 0, i32 5
  %49 = ptrtoint i64* %m3 to i64
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
  %57 = load i64* %m3, align 8
  %iterations4 = getelementptr inbounds %struct.network* %net, i32 0, i32 27
  %bound_exchanges5 = getelementptr inbounds %struct.network* %net, i32 0, i32 28
  %checksum6 = getelementptr inbounds %struct.network* %net, i32 0, i32 29
  br label %while.cond

while.cond:                                       ; preds = %if.end57, %56
  %phi_node89 = phi i64* [ %8, %56 ], [ %omega_node88, %if.end57 ]
  %opt.0 = phi i64 [ 0, %56 ], [ %opt.1, %if.end57 ]
  %tobool = icmp ne i64 %opt.0, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.body.split

while.body.split:                                 ; preds = %while.body
  %omega_node88 = phi i64* [ %phi_node89, %while.body ]
  %omega_node87 = phi %struct.arc* [ %48, %while.body ]
  %omega_node = phi %struct.arc* [ %39, %while.body ]
  %call = call %struct.arc* @primal_bea_mpp(i64 %57, %struct.arc* %omega_node, %struct.arc* %omega_node87, i64* %omega_node88)
  %tobool7 = icmp ne %struct.arc* %call, null
  br i1 %tobool7, label %if.then, label %if.else56

if.then:                                          ; preds = %while.body.split
  %sigma_node = phi %struct.arc* [ %call, %while.body.split ]
  %58 = ptrtoint i64* %iterations4 to i64
  %59 = lshr i64 %58, 3
  %60 = or i64 %59, 17592186044416
  %61 = inttoptr i64 %60 to i8*
  %62 = load i8* %61
  %63 = icmp ne i8 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %if.then
  call void @__asan_report_load8(i64 %58)
  call void asm sideeffect "", ""()
  unreachable

; <label>:65                                      ; preds = %if.then
  %66 = load i64* %iterations4, align 8
  %inc = add nsw i64 %66, 1
  store i64 %inc, i64* %iterations4, align 8
  %67 = ptrtoint i64* %phi_node89 to i64
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
  %75 = load i64* %phi_node89, align 8
  %cmp = icmp sgt i64 %75, 0
  br i1 %cmp, label %if.then8, label %if.else

if.then8:                                         ; preds = %74
  %sigma_node63 = phi i64 [ %75, %74 ]
  %head = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 2
  %76 = ptrtoint %struct.node** %head to i64
  %77 = lshr i64 %76, 3
  %78 = or i64 %77, 17592186044416
  %79 = inttoptr i64 %78 to i8*
  %80 = load i8* %79
  %81 = icmp ne i8 %80, 0
  br i1 %81, label %82, label %83

; <label>:82                                      ; preds = %if.then8
  call void @__asan_report_load8(i64 %76)
  call void asm sideeffect "", ""()
  unreachable

; <label>:83                                      ; preds = %if.then8
  %84 = load %struct.node** %head, align 8
  %tail = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 1
  %85 = ptrtoint %struct.node** %tail to i64
  %86 = lshr i64 %85, 3
  %87 = or i64 %86, 17592186044416
  %88 = inttoptr i64 %87 to i8*
  %89 = load i8* %88
  %90 = icmp ne i8 %89, 0
  br i1 %90, label %91, label %92

; <label>:91                                      ; preds = %83
  call void @__asan_report_load8(i64 %85)
  call void asm sideeffect "", ""()
  unreachable

; <label>:92                                      ; preds = %83
  %93 = load %struct.node** %tail, align 8
  br label %if.end

if.else:                                          ; preds = %74
  %sigma_node64 = phi i64 [ %75, %74 ]
  %tail9 = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 1
  %94 = ptrtoint %struct.node** %tail9 to i64
  %95 = lshr i64 %94, 3
  %96 = or i64 %95, 17592186044416
  %97 = inttoptr i64 %96 to i8*
  %98 = load i8* %97
  %99 = icmp ne i8 %98, 0
  br i1 %99, label %100, label %101

; <label>:100                                     ; preds = %if.else
  call void @__asan_report_load8(i64 %94)
  call void asm sideeffect "", ""()
  unreachable

; <label>:101                                     ; preds = %if.else
  %102 = load %struct.node** %tail9, align 8
  %head10 = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 2
  %103 = ptrtoint %struct.node** %head10 to i64
  %104 = lshr i64 %103, 3
  %105 = or i64 %104, 17592186044416
  %106 = inttoptr i64 %105 to i8*
  %107 = load i8* %106
  %108 = icmp ne i8 %107, 0
  br i1 %108, label %109, label %110

; <label>:109                                     ; preds = %101
  call void @__asan_report_load8(i64 %103)
  call void asm sideeffect "", ""()
  unreachable

; <label>:110                                     ; preds = %101
  %111 = load %struct.node** %head10, align 8
  br label %if.end

if.end:                                           ; preds = %110, %92
  %jplus.0 = phi %struct.node* [ %93, %92 ], [ %111, %110 ]
  %iplus.0 = phi %struct.node* [ %84, %92 ], [ %102, %110 ]
  store i64 1, i64* %2, align 8
  br label %if.end.split

if.end.split:                                     ; preds = %if.end
  %omega_node94 = phi %struct.node** [ %6, %if.end ], !byte_size !0, !safe !1
  %omega_node93 = phi %struct.node* [ %jplus.0, %if.end ]
  %omega_node92 = phi %struct.node* [ %iplus.0, %if.end ]
  %omega_node91 = phi i64* [ %4, %if.end ], !byte_size !0, !safe !1
  %omega_node90 = phi i64* [ %2, %if.end ], !byte_size !0, !safe !1
  %call11 = call %struct.node* @primal_iminus(i64* %omega_node90, i64* %omega_node91, %struct.node* %omega_node92, %struct.node* %omega_node93, %struct.node** %omega_node94)
  %tobool12 = icmp ne %struct.node* %call11, null
  br i1 %tobool12, label %if.else24, label %if.then13

if.then13:                                        ; preds = %if.end.split
  %sigma_node66 = phi %struct.node* [ %call11, %if.end.split ]
  %112 = ptrtoint i64* %bound_exchanges5 to i64
  %113 = lshr i64 %112, 3
  %114 = or i64 %113, 17592186044416
  %115 = inttoptr i64 %114 to i8*
  %116 = load i8* %115
  %117 = icmp ne i8 %116, 0
  br i1 %117, label %118, label %119

; <label>:118                                     ; preds = %if.then13
  call void @__asan_report_load8(i64 %112)
  call void asm sideeffect "", ""()
  unreachable

; <label>:119                                     ; preds = %if.then13
  %120 = load i64* %bound_exchanges5, align 8
  %inc14 = add nsw i64 %120, 1
  store i64 %inc14, i64* %bound_exchanges5, align 8
  %ident = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 3
  %121 = ptrtoint i32* %ident to i64
  %122 = lshr i64 %121, 3
  %123 = or i64 %122, 17592186044416
  %124 = inttoptr i64 %123 to i8*
  %125 = load i8* %124
  %126 = icmp ne i8 %125, 0
  br i1 %126, label %127, label %133

; <label>:127                                     ; preds = %119
  %128 = and i64 %121, 7
  %129 = add i64 %128, 3
  %130 = trunc i64 %129 to i8
  %131 = icmp sge i8 %130, %125
  br i1 %131, label %132, label %133

; <label>:132                                     ; preds = %127
  call void @__asan_report_load4(i64 %121)
  call void asm sideeffect "", ""()
  unreachable

; <label>:133                                     ; preds = %127, %119
  %134 = load i32* %ident, align 4
  %cmp15 = icmp eq i32 %134, 2
  br i1 %cmp15, label %if.then16, label %if.else18

if.then16:                                        ; preds = %133
  %sigma_node67 = phi i32 [ %134, %133 ]
  %ident17 = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 3
  %135 = ptrtoint i32* %ident17 to i64
  %136 = lshr i64 %135, 3
  %137 = or i64 %136, 17592186044416
  %138 = inttoptr i64 %137 to i8*
  %139 = load i8* %138
  %140 = icmp ne i8 %139, 0
  br i1 %140, label %141, label %147

; <label>:141                                     ; preds = %if.then16
  %142 = and i64 %135, 7
  %143 = add i64 %142, 3
  %144 = trunc i64 %143 to i8
  %145 = icmp sge i8 %144, %139
  br i1 %145, label %146, label %147

; <label>:146                                     ; preds = %141
  call void @__asan_report_store4(i64 %135)
  call void asm sideeffect "", ""()
  unreachable

; <label>:147                                     ; preds = %141, %if.then16
  store i32 1, i32* %ident17, align 4
  br label %if.end20

if.else18:                                        ; preds = %133
  %sigma_node68 = phi i32 [ %134, %133 ]
  %ident19 = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 3
  %148 = ptrtoint i32* %ident19 to i64
  %149 = lshr i64 %148, 3
  %150 = or i64 %149, 17592186044416
  %151 = inttoptr i64 %150 to i8*
  %152 = load i8* %151
  %153 = icmp ne i8 %152, 0
  br i1 %153, label %154, label %160

; <label>:154                                     ; preds = %if.else18
  %155 = and i64 %148, 7
  %156 = add i64 %155, 3
  %157 = trunc i64 %156 to i8
  %158 = icmp sge i8 %157, %152
  br i1 %158, label %159, label %160

; <label>:159                                     ; preds = %154
  call void @__asan_report_store4(i64 %148)
  call void asm sideeffect "", ""()
  unreachable

; <label>:160                                     ; preds = %154, %if.else18
  store i32 2, i32* %ident19, align 4
  br label %if.end20

if.end20:                                         ; preds = %160, %147
  %161 = load i64* %omega_node90, align 8
  %tobool21 = icmp ne i64 %161, 0
  br i1 %tobool21, label %if.then22, label %if.end20.if.end23_crit_edge

if.end20.if.end23_crit_edge:                      ; preds = %if.end20
  %sigma_node70 = phi i64 [ %161, %if.end20 ]
  br label %if.end23

if.then22:                                        ; preds = %if.end20
  %sigma_node69 = phi i64 [ %161, %if.end20 ]
  %162 = load %struct.node** %omega_node94, align 8
  br label %if.then22.split

if.then22.split:                                  ; preds = %if.then22
  %omega_node97 = phi %struct.node* [ %162, %if.then22 ]
  %omega_node96 = phi %struct.node* [ %omega_node93, %if.then22 ]
  %omega_node95 = phi %struct.node* [ %omega_node92, %if.then22 ]
  call void @primal_update_flow(%struct.node* %omega_node95, %struct.node* %omega_node96, %struct.node* %omega_node97)
  br label %if.end23

if.end23:                                         ; preds = %if.end20.if.end23_crit_edge, %if.then22.split
  br label %if.end55

if.else24:                                        ; preds = %if.end.split
  %sigma_node65 = phi %struct.node* [ %call11, %if.end.split ]
  %163 = load i64* %omega_node91, align 8
  %tobool25 = icmp ne i64 %163, 0
  br i1 %tobool25, label %if.then26, label %if.else24.if.end27_crit_edge

if.else24.if.end27_crit_edge:                     ; preds = %if.else24
  %sigma_node72 = phi i64 [ %163, %if.else24 ]
  br label %if.end27

if.then26:                                        ; preds = %if.else24
  %sigma_node71 = phi i64 [ %163, %if.else24 ]
  br label %if.end27

if.end27:                                         ; preds = %if.else24.if.end27_crit_edge, %if.then26
  %jplus.1 = phi %struct.node* [ %omega_node92, %if.then26 ], [ %omega_node93, %if.else24.if.end27_crit_edge ]
  %iplus.1 = phi %struct.node* [ %omega_node93, %if.then26 ], [ %omega_node92, %if.else24.if.end27_crit_edge ]
  %pred = getelementptr inbounds %struct.node* %sigma_node65, i32 0, i32 3
  %164 = ptrtoint %struct.node** %pred to i64
  %165 = lshr i64 %164, 3
  %166 = or i64 %165, 17592186044416
  %167 = inttoptr i64 %166 to i8*
  %168 = load i8* %167
  %169 = icmp ne i8 %168, 0
  br i1 %169, label %170, label %171

; <label>:170                                     ; preds = %if.end27
  call void @__asan_report_load8(i64 %164)
  call void asm sideeffect "", ""()
  unreachable

; <label>:171                                     ; preds = %if.end27
  %172 = load %struct.node** %pred, align 8
  %basic_arc = getelementptr inbounds %struct.node* %sigma_node65, i32 0, i32 6
  %173 = ptrtoint %struct.arc** %basic_arc to i64
  %174 = lshr i64 %173, 3
  %175 = or i64 %174, 17592186044416
  %176 = inttoptr i64 %175 to i8*
  %177 = load i8* %176
  %178 = icmp ne i8 %177, 0
  br i1 %178, label %179, label %180

; <label>:179                                     ; preds = %171
  call void @__asan_report_load8(i64 %173)
  call void asm sideeffect "", ""()
  unreachable

; <label>:180                                     ; preds = %171
  %181 = load %struct.arc** %basic_arc, align 8
  %182 = load i64* %omega_node91, align 8
  %orientation = getelementptr inbounds %struct.node* %sigma_node65, i32 0, i32 1
  %183 = ptrtoint i32* %orientation to i64
  %184 = lshr i64 %183, 3
  %185 = or i64 %184, 17592186044416
  %186 = inttoptr i64 %185 to i8*
  %187 = load i8* %186
  %188 = icmp ne i8 %187, 0
  br i1 %188, label %189, label %195

; <label>:189                                     ; preds = %180
  %190 = and i64 %183, 7
  %191 = add i64 %190, 3
  %192 = trunc i64 %191 to i8
  %193 = icmp sge i8 %192, %187
  br i1 %193, label %194, label %195

; <label>:194                                     ; preds = %189
  call void @__asan_report_load4(i64 %183)
  call void asm sideeffect "", ""()
  unreachable

; <label>:195                                     ; preds = %189, %180
  %196 = load i32* %orientation, align 4
  %conv = sext i32 %196 to i64
  %cmp28 = icmp ne i64 %182, %conv
  br i1 %cmp28, label %if.then30, label %if.else31

if.then30:                                        ; preds = %195
  %sigma_node77 = phi i32 [ %196, %195 ]
  %sigma_node75 = phi i64 [ %conv, %195 ]
  %sigma_node73 = phi i64 [ %182, %195 ]
  br label %if.end32

if.else31:                                        ; preds = %195
  %sigma_node78 = phi i32 [ %196, %195 ]
  %sigma_node76 = phi i64 [ %conv, %195 ]
  %sigma_node74 = phi i64 [ %182, %195 ]
  br label %if.end32

if.end32:                                         ; preds = %if.else31, %if.then30
  %new_set.0 = phi i64 [ 1, %if.then30 ], [ 2, %if.else31 ]
  %197 = ptrtoint i64* %phi_node89 to i64
  %198 = lshr i64 %197, 3
  %199 = or i64 %198, 17592186044416
  %200 = inttoptr i64 %199 to i8*
  %201 = load i8* %200
  %202 = icmp ne i8 %201, 0
  br i1 %202, label %203, label %204

; <label>:203                                     ; preds = %if.end32
  call void @__asan_report_load8(i64 %197)
  call void asm sideeffect "", ""()
  unreachable

; <label>:204                                     ; preds = %if.end32
  %205 = load i64* %phi_node89, align 8
  %cmp33 = icmp sgt i64 %205, 0
  br i1 %cmp33, label %if.then35, label %if.else36

if.then35:                                        ; preds = %204
  %sigma_node79 = phi i64 [ %205, %204 ]
  %206 = load i64* %omega_node90, align 8
  %sub = sub nsw i64 1, %206
  br label %if.end37

if.else36:                                        ; preds = %204
  %sigma_node80 = phi i64 [ %205, %204 ]
  %207 = load i64* %omega_node90, align 8
  br label %if.end37

if.end37:                                         ; preds = %if.else36, %if.then35
  %new_flow.0 = phi i64 [ %sub, %if.then35 ], [ %207, %if.else36 ]
  %tail38 = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 1
  %208 = ptrtoint %struct.node** %tail38 to i64
  %209 = lshr i64 %208, 3
  %210 = or i64 %209, 17592186044416
  %211 = inttoptr i64 %210 to i8*
  %212 = load i8* %211
  %213 = icmp ne i8 %212, 0
  br i1 %213, label %214, label %215

; <label>:214                                     ; preds = %if.end37
  call void @__asan_report_load8(i64 %208)
  call void asm sideeffect "", ""()
  unreachable

; <label>:215                                     ; preds = %if.end37
  %216 = load %struct.node** %tail38, align 8
  %cmp39 = icmp eq %struct.node* %216, %iplus.1
  br i1 %cmp39, label %if.then41, label %if.else42

if.then41:                                        ; preds = %215
  %sigma_node83 = phi %struct.node* [ %iplus.1, %215 ]
  %sigma_node81 = phi %struct.node* [ %216, %215 ]
  br label %if.end43

if.else42:                                        ; preds = %215
  %sigma_node84 = phi %struct.node* [ %iplus.1, %215 ]
  %sigma_node82 = phi %struct.node* [ %216, %215 ]
  br label %if.end43

if.end43:                                         ; preds = %if.else42, %if.then41
  %phi_node = phi %struct.node* [ %sigma_node83, %if.then41 ], [ %sigma_node84, %if.else42 ]
  %new_orientation.0 = phi i64 [ 1, %if.then41 ], [ 0, %if.else42 ]
  %217 = load i64* %omega_node91, align 8
  %tobool44 = icmp ne i64 %217, 0
  %lnot45 = xor i1 %tobool44, true
  %lnot.ext = zext i1 %lnot45 to i32
  %conv46 = sext i32 %lnot.ext to i64
  %218 = load i64* %omega_node90, align 8
  %219 = load %struct.node** %omega_node94, align 8
  %220 = ptrtoint i64* %phi_node89 to i64
  %221 = lshr i64 %220, 3
  %222 = or i64 %221, 17592186044416
  %223 = inttoptr i64 %222 to i8*
  %224 = load i8* %223
  %225 = icmp ne i8 %224, 0
  br i1 %225, label %226, label %227

; <label>:226                                     ; preds = %if.end43
  call void @__asan_report_load8(i64 %220)
  call void asm sideeffect "", ""()
  unreachable

; <label>:227                                     ; preds = %if.end43
  %228 = load i64* %phi_node89, align 8
  %feas_tol = getelementptr inbounds %struct.network* %net, i32 0, i32 16
  %229 = ptrtoint i64* %feas_tol to i64
  %230 = lshr i64 %229, 3
  %231 = or i64 %230, 17592186044416
  %232 = inttoptr i64 %231 to i8*
  %233 = load i8* %232
  %234 = icmp ne i8 %233, 0
  br i1 %234, label %235, label %236

; <label>:235                                     ; preds = %227
  call void @__asan_report_load8(i64 %229)
  call void asm sideeffect "", ""()
  unreachable

; <label>:236                                     ; preds = %227
  %237 = load i64* %feas_tol, align 8
  br label %if.end43.split

if.end43.split:                                   ; preds = %236
  %omega_node103 = phi %struct.arc* [ %sigma_node, %236 ]
  %omega_node102 = phi %struct.node* [ %219, %236 ]
  %omega_node101 = phi %struct.node* [ %172, %236 ]
  %omega_node100 = phi %struct.node* [ %sigma_node65, %236 ]
  %omega_node99 = phi %struct.node* [ %jplus.1, %236 ]
  %omega_node98 = phi %struct.node* [ %phi_node, %236 ]
  call void @update_tree(i64 %conv46, i64 %new_orientation.0, i64 %218, i64 %new_flow.0, %struct.node* %omega_node98, %struct.node* %omega_node99, %struct.node* %omega_node100, %struct.node* %omega_node101, %struct.node* %omega_node102, %struct.arc* %omega_node103, i64 %228, i64 %237)
  %ident47 = getelementptr inbounds %struct.arc* %omega_node103, i32 0, i32 3
  %238 = ptrtoint i32* %ident47 to i64
  %239 = lshr i64 %238, 3
  %240 = or i64 %239, 17592186044416
  %241 = inttoptr i64 %240 to i8*
  %242 = load i8* %241
  %243 = icmp ne i8 %242, 0
  br i1 %243, label %244, label %250

; <label>:244                                     ; preds = %if.end43.split
  %245 = and i64 %238, 7
  %246 = add i64 %245, 3
  %247 = trunc i64 %246 to i8
  %248 = icmp sge i8 %247, %242
  br i1 %248, label %249, label %250

; <label>:249                                     ; preds = %244
  call void @__asan_report_store4(i64 %238)
  call void asm sideeffect "", ""()
  unreachable

; <label>:250                                     ; preds = %244, %if.end43.split
  store i32 0, i32* %ident47, align 4
  %conv48 = trunc i64 %new_set.0 to i32
  %ident49 = getelementptr inbounds %struct.arc* %181, i32 0, i32 3
  %251 = ptrtoint i32* %ident49 to i64
  %252 = lshr i64 %251, 3
  %253 = or i64 %252, 17592186044416
  %254 = inttoptr i64 %253 to i8*
  %255 = load i8* %254
  %256 = icmp ne i8 %255, 0
  br i1 %256, label %257, label %263

; <label>:257                                     ; preds = %250
  %258 = and i64 %251, 7
  %259 = add i64 %258, 3
  %260 = trunc i64 %259 to i8
  %261 = icmp sge i8 %260, %255
  br i1 %261, label %262, label %263

; <label>:262                                     ; preds = %257
  call void @__asan_report_store4(i64 %251)
  call void asm sideeffect "", ""()
  unreachable

; <label>:263                                     ; preds = %257, %250
  store i32 %conv48, i32* %ident49, align 4
  %264 = ptrtoint i64* %iterations4 to i64
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
  %272 = load i64* %iterations4, align 8
  %sub50 = sub nsw i64 %272, 1
  %rem = srem i64 %sub50, 200
  %tobool51 = icmp ne i64 %rem, 0
  br i1 %tobool51, label %if.end43.if.end54_crit_edge, label %if.then52

if.end43.if.end54_crit_edge:                      ; preds = %271
  %sigma_node85 = phi i64 [ %rem, %271 ]
  br label %if.end54

if.then52:                                        ; preds = %271
  %sigma_node86 = phi i64 [ %rem, %271 ]
  br label %if.then52.split

if.then52.split:                                  ; preds = %if.then52
  %omega_node104 = phi %struct.network* [ %net, %if.then52 ]
  %call53 = call i64 @refresh_potential(%struct.network* %omega_node104)
  %273 = ptrtoint i64* %checksum6 to i64
  %274 = lshr i64 %273, 3
  %275 = or i64 %274, 17592186044416
  %276 = inttoptr i64 %275 to i8*
  %277 = load i8* %276
  %278 = icmp ne i8 %277, 0
  br i1 %278, label %279, label %280

; <label>:279                                     ; preds = %if.then52.split
  call void @__asan_report_load8(i64 %273)
  call void asm sideeffect "", ""()
  unreachable

; <label>:280                                     ; preds = %if.then52.split
  %281 = load i64* %checksum6, align 8
  %add = add nsw i64 %281, %call53
  store i64 %add, i64* %checksum6, align 8
  br label %if.end54

if.end54:                                         ; preds = %if.end43.if.end54_crit_edge, %280
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.end23
  br label %if.end57

if.else56:                                        ; preds = %while.body.split
  %sigma_node62 = phi %struct.arc* [ %call, %while.body.split ]
  br label %if.end57

if.end57:                                         ; preds = %if.else56, %if.end55
  %opt.1 = phi i64 [ %opt.0, %if.end55 ], [ 1, %if.else56 ]
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %while.end.split

while.end.split:                                  ; preds = %while.end
  %omega_node105 = phi %struct.network* [ %net, %while.end ]
  %call58 = call i64 @refresh_potential(%struct.network* %omega_node105)
  %282 = ptrtoint i64* %checksum6 to i64
  %283 = lshr i64 %282, 3
  %284 = or i64 %283, 17592186044416
  %285 = inttoptr i64 %284 to i8*
  %286 = load i8* %285
  %287 = icmp ne i8 %286, 0
  br i1 %287, label %288, label %289

; <label>:288                                     ; preds = %while.end.split
  call void @__asan_report_load8(i64 %282)
  call void asm sideeffect "", ""()
  unreachable

; <label>:289                                     ; preds = %while.end.split
  %290 = load i64* %checksum6, align 8
  %add59 = add nsw i64 %290, %call58
  store i64 %add59, i64* %checksum6, align 8
  br label %while.end.split.split

while.end.split.split:                            ; preds = %289
  %omega_node106 = phi %struct.network* [ %omega_node105, %289 ]
  %call60 = call i64 @primal_feasible(%struct.network* %omega_node106)
  br label %while.end.split.split.split

while.end.split.split.split:                      ; preds = %while.end.split.split
  %omega_node107 = phi %struct.network* [ %omega_node106, %while.end.split.split ]
  %call61 = call i64 @dual_feasible(%struct.network* %omega_node107)
  store i64 1172321806, i64* %9
  %291 = inttoptr i64 %13 to i32*
  store i32 0, i32* %291
  %292 = add i64 %13, 4
  %293 = inttoptr i64 %292 to i32*
  store i32 0, i32* %293
  %294 = add i64 %13, 8
  %295 = inttoptr i64 %294 to i32*
  store i32 0, i32* %295
  %296 = add i64 %13, 12
  %297 = inttoptr i64 %296 to i32*
  store i32 0, i32* %297
  %298 = add i64 %13, 16
  %299 = inttoptr i64 %298 to i32*
  store i32 0, i32* %299
  %300 = add i64 %13, 20
  %301 = inttoptr i64 %300 to i32*
  store i32 0, i32* %301
  %302 = add i64 %13, 24
  %303 = inttoptr i64 %302 to i32*
  store i32 0, i32* %303
  %304 = add i64 %13, 28
  %305 = inttoptr i64 %304 to i32*
  store i32 0, i32* %305
  %306 = add i64 %13, 32
  %307 = inttoptr i64 %306 to i32*
  store i32 0, i32* %307
  ret i64 0
}

declare %struct.arc* @primal_bea_mpp(i64, %struct.arc*, %struct.arc*, i64*)

declare %struct.node* @primal_iminus(i64*, i64*, %struct.node*, %struct.node*, %struct.node**)

declare void @primal_update_flow(%struct.node*, %struct.node*, %struct.node*)

declare void @update_tree(i64, i64, i64, i64, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, i64, i64)

declare i64 @refresh_potential(%struct.network*)

declare i64 @primal_feasible(%struct.network*)

declare i64 @dual_feasible(%struct.network*)

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

declare i64 @__asan_stack_malloc(i64, i64)

declare void @__asan_stack_free(i64, i64, i64)

declare void @__asan_poison_stack_memory(i64, i64)

declare void @__asan_unpoison_stack_memory(i64, i64)

declare void @__asan_before_dynamic_init(i64, i64)

declare void @__asan_after_dynamic_init()

declare void @__asan_register_globals(i64, i64)

declare void @__asan_unregister_globals(i64, i64)

!0 = metadata !{i32 8}
!1 = metadata !{}
