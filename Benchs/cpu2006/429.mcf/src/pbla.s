; ModuleID = 'pbla.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }

@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]

define %struct.node* @primal_iminus(i64* %delta, i64* %xchange, %struct.node* %iplus, %struct.node* %jplus, %struct.node** %w) address_safety nounwind {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end43, %entry
  %iplus.addr.0 = phi %struct.node* [ %iplus, %entry ], [ %iplus.addr.1, %if.end43 ]
  %jplus.addr.0 = phi %struct.node* [ %jplus, %entry ], [ %jplus.addr.1, %if.end43 ]
  %iminus.0 = phi %struct.node* [ null, %entry ], [ %iminus.9, %if.end43 ]
  %cmp = icmp ne %struct.node* %iplus.addr.0, %jplus.addr.0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %sigma_node45 = phi %struct.node* [ %jplus.addr.0, %while.cond ]
  %sigma_node = phi %struct.node* [ %iplus.addr.0, %while.cond ]
  %depth = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 11
  %0 = ptrtoint i64* %depth to i64
  %1 = lshr i64 %0, 3
  %2 = or i64 %1, 17592186044416
  %3 = inttoptr i64 %2 to i8*
  %4 = load i8* %3
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %while.body
  call void @__asan_report_load8(i64 %0)
  call void asm sideeffect "", ""()
  unreachable

; <label>:7                                       ; preds = %while.body
  %8 = load i64* %depth, align 8
  %depth1 = getelementptr inbounds %struct.node* %sigma_node45, i32 0, i32 11
  %9 = ptrtoint i64* %depth1 to i64
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
  %17 = load i64* %depth1, align 8
  %cmp2 = icmp slt i64 %8, %17
  br i1 %cmp2, label %if.then, label %if.else19

if.then:                                          ; preds = %16
  %sigma_node49 = phi i64 [ %17, %16 ]
  %sigma_node47 = phi i64 [ %8, %16 ]
  %orientation = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 1
  %18 = ptrtoint i32* %orientation to i64
  %19 = lshr i64 %18, 3
  %20 = or i64 %19, 17592186044416
  %21 = inttoptr i64 %20 to i8*
  %22 = load i8* %21
  %23 = icmp ne i8 %22, 0
  br i1 %23, label %24, label %30

; <label>:24                                      ; preds = %if.then
  %25 = and i64 %18, 7
  %26 = add i64 %25, 3
  %27 = trunc i64 %26 to i8
  %28 = icmp sge i8 %27, %22
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %24
  call void @__asan_report_load4(i64 %18)
  call void asm sideeffect "", ""()
  unreachable

; <label>:30                                      ; preds = %24, %if.then
  %31 = load i32* %orientation, align 4
  %tobool = icmp ne i32 %31, 0
  br i1 %tobool, label %if.then3, label %if.else

if.then3:                                         ; preds = %30
  %sigma_node51 = phi i32 [ %31, %30 ]
  %32 = ptrtoint i64* %delta to i64
  %33 = lshr i64 %32, 3
  %34 = or i64 %33, 17592186044416
  %35 = inttoptr i64 %34 to i8*
  %36 = load i8* %35
  %37 = icmp ne i8 %36, 0
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %if.then3
  call void @__asan_report_load8(i64 %32)
  call void asm sideeffect "", ""()
  unreachable

; <label>:39                                      ; preds = %if.then3
  %40 = load i64* %delta, align 8
  %flow = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 10
  %41 = ptrtoint i64* %flow to i64
  %42 = lshr i64 %41, 3
  %43 = or i64 %42, 17592186044416
  %44 = inttoptr i64 %43 to i8*
  %45 = load i8* %44
  %46 = icmp ne i8 %45, 0
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %39
  call void @__asan_report_load8(i64 %41)
  call void asm sideeffect "", ""()
  unreachable

; <label>:48                                      ; preds = %39
  %49 = load i64* %flow, align 8
  %cmp4 = icmp sgt i64 %40, %49
  br i1 %cmp4, label %if.then5, label %if.then3.if.end_crit_edge

if.then3.if.end_crit_edge:                        ; preds = %48
  %sigma_node56 = phi i64 [ %49, %48 ]
  %sigma_node54 = phi i64 [ %40, %48 ]
  br label %if.end

if.then5:                                         ; preds = %48
  %sigma_node55 = phi i64 [ %49, %48 ]
  %sigma_node53 = phi i64 [ %40, %48 ]
  %flow6 = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 10
  %50 = ptrtoint i64* %flow6 to i64
  %51 = lshr i64 %50, 3
  %52 = or i64 %51, 17592186044416
  %53 = inttoptr i64 %52 to i8*
  %54 = load i8* %53
  %55 = icmp ne i8 %54, 0
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %if.then5
  call void @__asan_report_load8(i64 %50)
  call void asm sideeffect "", ""()
  unreachable

; <label>:57                                      ; preds = %if.then5
  %58 = load i64* %flow6, align 8
  %59 = ptrtoint i64* %delta to i64
  %60 = lshr i64 %59, 3
  %61 = or i64 %60, 17592186044416
  %62 = inttoptr i64 %61 to i8*
  %63 = load i8* %62
  %64 = icmp ne i8 %63, 0
  br i1 %64, label %65, label %66

; <label>:65                                      ; preds = %57
  call void @__asan_report_store8(i64 %59)
  call void asm sideeffect "", ""()
  unreachable

; <label>:66                                      ; preds = %57
  store i64 %58, i64* %delta, align 8
  %67 = ptrtoint i64* %xchange to i64
  %68 = lshr i64 %67, 3
  %69 = or i64 %68, 17592186044416
  %70 = inttoptr i64 %69 to i8*
  %71 = load i8* %70
  %72 = icmp ne i8 %71, 0
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %66
  call void @__asan_report_store8(i64 %67)
  call void asm sideeffect "", ""()
  unreachable

; <label>:74                                      ; preds = %66
  store i64 0, i64* %xchange, align 8
  br label %if.end

if.end:                                           ; preds = %if.then3.if.end_crit_edge, %74
  %iminus.1 = phi %struct.node* [ %sigma_node, %74 ], [ %iminus.0, %if.then3.if.end_crit_edge ]
  br label %if.end17

if.else:                                          ; preds = %30
  %sigma_node52 = phi i32 [ %31, %30 ]
  %pred = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 3
  %75 = ptrtoint %struct.node** %pred to i64
  %76 = lshr i64 %75, 3
  %77 = or i64 %76, 17592186044416
  %78 = inttoptr i64 %77 to i8*
  %79 = load i8* %78
  %80 = icmp ne i8 %79, 0
  br i1 %80, label %81, label %82

; <label>:81                                      ; preds = %if.else
  call void @__asan_report_load8(i64 %75)
  call void asm sideeffect "", ""()
  unreachable

; <label>:82                                      ; preds = %if.else
  %83 = load %struct.node** %pred, align 8
  %pred7 = getelementptr inbounds %struct.node* %83, i32 0, i32 3
  %84 = ptrtoint %struct.node** %pred7 to i64
  %85 = lshr i64 %84, 3
  %86 = or i64 %85, 17592186044416
  %87 = inttoptr i64 %86 to i8*
  %88 = load i8* %87
  %89 = icmp ne i8 %88, 0
  br i1 %89, label %90, label %91

; <label>:90                                      ; preds = %82
  call void @__asan_report_load8(i64 %84)
  call void asm sideeffect "", ""()
  unreachable

; <label>:91                                      ; preds = %82
  %92 = load %struct.node** %pred7, align 8
  %tobool8 = icmp ne %struct.node* %92, null
  br i1 %tobool8, label %if.then9, label %if.else.if.end16_crit_edge

if.else.if.end16_crit_edge:                       ; preds = %91
  %sigma_node58 = phi %struct.node* [ %92, %91 ]
  br label %if.end16

if.then9:                                         ; preds = %91
  %sigma_node57 = phi %struct.node* [ %92, %91 ]
  %93 = ptrtoint i64* %delta to i64
  %94 = lshr i64 %93, 3
  %95 = or i64 %94, 17592186044416
  %96 = inttoptr i64 %95 to i8*
  %97 = load i8* %96
  %98 = icmp ne i8 %97, 0
  br i1 %98, label %99, label %100

; <label>:99                                      ; preds = %if.then9
  call void @__asan_report_load8(i64 %93)
  call void asm sideeffect "", ""()
  unreachable

; <label>:100                                     ; preds = %if.then9
  %101 = load i64* %delta, align 8
  %flow10 = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 10
  %102 = ptrtoint i64* %flow10 to i64
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
  %110 = load i64* %flow10, align 8
  %sub = sub nsw i64 1, %110
  %cmp11 = icmp sgt i64 %101, %sub
  br i1 %cmp11, label %if.then12, label %if.then9.if.end15_crit_edge

if.then9.if.end15_crit_edge:                      ; preds = %109
  %sigma_node62 = phi i64 [ %sub, %109 ]
  %sigma_node60 = phi i64 [ %101, %109 ]
  br label %if.end15

if.then12:                                        ; preds = %109
  %sigma_node61 = phi i64 [ %sub, %109 ]
  %sigma_node59 = phi i64 [ %101, %109 ]
  %flow13 = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 10
  %111 = ptrtoint i64* %flow13 to i64
  %112 = lshr i64 %111, 3
  %113 = or i64 %112, 17592186044416
  %114 = inttoptr i64 %113 to i8*
  %115 = load i8* %114
  %116 = icmp ne i8 %115, 0
  br i1 %116, label %117, label %118

; <label>:117                                     ; preds = %if.then12
  call void @__asan_report_load8(i64 %111)
  call void asm sideeffect "", ""()
  unreachable

; <label>:118                                     ; preds = %if.then12
  %119 = load i64* %flow13, align 8
  %sub14 = sub nsw i64 1, %119
  %120 = ptrtoint i64* %delta to i64
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
  store i64 %sub14, i64* %delta, align 8
  %128 = ptrtoint i64* %xchange to i64
  %129 = lshr i64 %128, 3
  %130 = or i64 %129, 17592186044416
  %131 = inttoptr i64 %130 to i8*
  %132 = load i8* %131
  %133 = icmp ne i8 %132, 0
  br i1 %133, label %134, label %135

; <label>:134                                     ; preds = %127
  call void @__asan_report_store8(i64 %128)
  call void asm sideeffect "", ""()
  unreachable

; <label>:135                                     ; preds = %127
  store i64 0, i64* %xchange, align 8
  br label %if.end15

if.end15:                                         ; preds = %if.then9.if.end15_crit_edge, %135
  %iminus.2 = phi %struct.node* [ %sigma_node, %135 ], [ %iminus.0, %if.then9.if.end15_crit_edge ]
  br label %if.end16

if.end16:                                         ; preds = %if.else.if.end16_crit_edge, %if.end15
  %iminus.3 = phi %struct.node* [ %iminus.2, %if.end15 ], [ %iminus.0, %if.else.if.end16_crit_edge ]
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.end
  %iminus.4 = phi %struct.node* [ %iminus.1, %if.end ], [ %iminus.3, %if.end16 ]
  %pred18 = getelementptr inbounds %struct.node* %sigma_node, i32 0, i32 3
  %136 = ptrtoint %struct.node** %pred18 to i64
  %137 = lshr i64 %136, 3
  %138 = or i64 %137, 17592186044416
  %139 = inttoptr i64 %138 to i8*
  %140 = load i8* %139
  %141 = icmp ne i8 %140, 0
  br i1 %141, label %142, label %143

; <label>:142                                     ; preds = %if.end17
  call void @__asan_report_load8(i64 %136)
  call void asm sideeffect "", ""()
  unreachable

; <label>:143                                     ; preds = %if.end17
  %144 = load %struct.node** %pred18, align 8
  br label %if.end43

if.else19:                                        ; preds = %16
  %sigma_node50 = phi i64 [ %17, %16 ]
  %sigma_node48 = phi i64 [ %8, %16 ]
  %orientation20 = getelementptr inbounds %struct.node* %sigma_node45, i32 0, i32 1
  %145 = ptrtoint i32* %orientation20 to i64
  %146 = lshr i64 %145, 3
  %147 = or i64 %146, 17592186044416
  %148 = inttoptr i64 %147 to i8*
  %149 = load i8* %148
  %150 = icmp ne i8 %149, 0
  br i1 %150, label %151, label %157

; <label>:151                                     ; preds = %if.else19
  %152 = and i64 %145, 7
  %153 = add i64 %152, 3
  %154 = trunc i64 %153 to i8
  %155 = icmp sge i8 %154, %149
  br i1 %155, label %156, label %157

; <label>:156                                     ; preds = %151
  call void @__asan_report_load4(i64 %145)
  call void asm sideeffect "", ""()
  unreachable

; <label>:157                                     ; preds = %151, %if.else19
  %158 = load i32* %orientation20, align 4
  %tobool21 = icmp ne i32 %158, 0
  br i1 %tobool21, label %if.else28, label %if.then22

if.then22:                                        ; preds = %157
  %sigma_node64 = phi i32 [ %158, %157 ]
  %159 = ptrtoint i64* %delta to i64
  %160 = lshr i64 %159, 3
  %161 = or i64 %160, 17592186044416
  %162 = inttoptr i64 %161 to i8*
  %163 = load i8* %162
  %164 = icmp ne i8 %163, 0
  br i1 %164, label %165, label %166

; <label>:165                                     ; preds = %if.then22
  call void @__asan_report_load8(i64 %159)
  call void asm sideeffect "", ""()
  unreachable

; <label>:166                                     ; preds = %if.then22
  %167 = load i64* %delta, align 8
  %flow23 = getelementptr inbounds %struct.node* %sigma_node45, i32 0, i32 10
  %168 = ptrtoint i64* %flow23 to i64
  %169 = lshr i64 %168, 3
  %170 = or i64 %169, 17592186044416
  %171 = inttoptr i64 %170 to i8*
  %172 = load i8* %171
  %173 = icmp ne i8 %172, 0
  br i1 %173, label %174, label %175

; <label>:174                                     ; preds = %166
  call void @__asan_report_load8(i64 %168)
  call void asm sideeffect "", ""()
  unreachable

; <label>:175                                     ; preds = %166
  %176 = load i64* %flow23, align 8
  %cmp24 = icmp sge i64 %167, %176
  br i1 %cmp24, label %if.then25, label %if.then22.if.end27_crit_edge

if.then22.if.end27_crit_edge:                     ; preds = %175
  %sigma_node68 = phi i64 [ %176, %175 ]
  %sigma_node66 = phi i64 [ %167, %175 ]
  br label %if.end27

if.then25:                                        ; preds = %175
  %sigma_node67 = phi i64 [ %176, %175 ]
  %sigma_node65 = phi i64 [ %167, %175 ]
  %flow26 = getelementptr inbounds %struct.node* %sigma_node45, i32 0, i32 10
  %177 = ptrtoint i64* %flow26 to i64
  %178 = lshr i64 %177, 3
  %179 = or i64 %178, 17592186044416
  %180 = inttoptr i64 %179 to i8*
  %181 = load i8* %180
  %182 = icmp ne i8 %181, 0
  br i1 %182, label %183, label %184

; <label>:183                                     ; preds = %if.then25
  call void @__asan_report_load8(i64 %177)
  call void asm sideeffect "", ""()
  unreachable

; <label>:184                                     ; preds = %if.then25
  %185 = load i64* %flow26, align 8
  %186 = ptrtoint i64* %delta to i64
  %187 = lshr i64 %186, 3
  %188 = or i64 %187, 17592186044416
  %189 = inttoptr i64 %188 to i8*
  %190 = load i8* %189
  %191 = icmp ne i8 %190, 0
  br i1 %191, label %192, label %193

; <label>:192                                     ; preds = %184
  call void @__asan_report_store8(i64 %186)
  call void asm sideeffect "", ""()
  unreachable

; <label>:193                                     ; preds = %184
  store i64 %185, i64* %delta, align 8
  %194 = ptrtoint i64* %xchange to i64
  %195 = lshr i64 %194, 3
  %196 = or i64 %195, 17592186044416
  %197 = inttoptr i64 %196 to i8*
  %198 = load i8* %197
  %199 = icmp ne i8 %198, 0
  br i1 %199, label %200, label %201

; <label>:200                                     ; preds = %193
  call void @__asan_report_store8(i64 %194)
  call void asm sideeffect "", ""()
  unreachable

; <label>:201                                     ; preds = %193
  store i64 1, i64* %xchange, align 8
  br label %if.end27

if.end27:                                         ; preds = %if.then22.if.end27_crit_edge, %201
  %iminus.5 = phi %struct.node* [ %sigma_node45, %201 ], [ %iminus.0, %if.then22.if.end27_crit_edge ]
  br label %if.end41

if.else28:                                        ; preds = %157
  %sigma_node63 = phi i32 [ %158, %157 ]
  %pred29 = getelementptr inbounds %struct.node* %sigma_node45, i32 0, i32 3
  %202 = ptrtoint %struct.node** %pred29 to i64
  %203 = lshr i64 %202, 3
  %204 = or i64 %203, 17592186044416
  %205 = inttoptr i64 %204 to i8*
  %206 = load i8* %205
  %207 = icmp ne i8 %206, 0
  br i1 %207, label %208, label %209

; <label>:208                                     ; preds = %if.else28
  call void @__asan_report_load8(i64 %202)
  call void asm sideeffect "", ""()
  unreachable

; <label>:209                                     ; preds = %if.else28
  %210 = load %struct.node** %pred29, align 8
  %pred30 = getelementptr inbounds %struct.node* %210, i32 0, i32 3
  %211 = ptrtoint %struct.node** %pred30 to i64
  %212 = lshr i64 %211, 3
  %213 = or i64 %212, 17592186044416
  %214 = inttoptr i64 %213 to i8*
  %215 = load i8* %214
  %216 = icmp ne i8 %215, 0
  br i1 %216, label %217, label %218

; <label>:217                                     ; preds = %209
  call void @__asan_report_load8(i64 %211)
  call void asm sideeffect "", ""()
  unreachable

; <label>:218                                     ; preds = %209
  %219 = load %struct.node** %pred30, align 8
  %tobool31 = icmp ne %struct.node* %219, null
  br i1 %tobool31, label %if.then32, label %if.else28.if.end40_crit_edge

if.else28.if.end40_crit_edge:                     ; preds = %218
  %sigma_node70 = phi %struct.node* [ %219, %218 ]
  br label %if.end40

if.then32:                                        ; preds = %218
  %sigma_node69 = phi %struct.node* [ %219, %218 ]
  %220 = ptrtoint i64* %delta to i64
  %221 = lshr i64 %220, 3
  %222 = or i64 %221, 17592186044416
  %223 = inttoptr i64 %222 to i8*
  %224 = load i8* %223
  %225 = icmp ne i8 %224, 0
  br i1 %225, label %226, label %227

; <label>:226                                     ; preds = %if.then32
  call void @__asan_report_load8(i64 %220)
  call void asm sideeffect "", ""()
  unreachable

; <label>:227                                     ; preds = %if.then32
  %228 = load i64* %delta, align 8
  %flow33 = getelementptr inbounds %struct.node* %sigma_node45, i32 0, i32 10
  %229 = ptrtoint i64* %flow33 to i64
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
  %237 = load i64* %flow33, align 8
  %sub34 = sub nsw i64 1, %237
  %cmp35 = icmp sge i64 %228, %sub34
  br i1 %cmp35, label %if.then36, label %if.then32.if.end39_crit_edge

if.then32.if.end39_crit_edge:                     ; preds = %236
  %sigma_node74 = phi i64 [ %sub34, %236 ]
  %sigma_node72 = phi i64 [ %228, %236 ]
  br label %if.end39

if.then36:                                        ; preds = %236
  %sigma_node73 = phi i64 [ %sub34, %236 ]
  %sigma_node71 = phi i64 [ %228, %236 ]
  %flow37 = getelementptr inbounds %struct.node* %sigma_node45, i32 0, i32 10
  %238 = ptrtoint i64* %flow37 to i64
  %239 = lshr i64 %238, 3
  %240 = or i64 %239, 17592186044416
  %241 = inttoptr i64 %240 to i8*
  %242 = load i8* %241
  %243 = icmp ne i8 %242, 0
  br i1 %243, label %244, label %245

; <label>:244                                     ; preds = %if.then36
  call void @__asan_report_load8(i64 %238)
  call void asm sideeffect "", ""()
  unreachable

; <label>:245                                     ; preds = %if.then36
  %246 = load i64* %flow37, align 8
  %sub38 = sub nsw i64 1, %246
  %247 = ptrtoint i64* %delta to i64
  %248 = lshr i64 %247, 3
  %249 = or i64 %248, 17592186044416
  %250 = inttoptr i64 %249 to i8*
  %251 = load i8* %250
  %252 = icmp ne i8 %251, 0
  br i1 %252, label %253, label %254

; <label>:253                                     ; preds = %245
  call void @__asan_report_store8(i64 %247)
  call void asm sideeffect "", ""()
  unreachable

; <label>:254                                     ; preds = %245
  store i64 %sub38, i64* %delta, align 8
  %255 = ptrtoint i64* %xchange to i64
  %256 = lshr i64 %255, 3
  %257 = or i64 %256, 17592186044416
  %258 = inttoptr i64 %257 to i8*
  %259 = load i8* %258
  %260 = icmp ne i8 %259, 0
  br i1 %260, label %261, label %262

; <label>:261                                     ; preds = %254
  call void @__asan_report_store8(i64 %255)
  call void asm sideeffect "", ""()
  unreachable

; <label>:262                                     ; preds = %254
  store i64 1, i64* %xchange, align 8
  br label %if.end39

if.end39:                                         ; preds = %if.then32.if.end39_crit_edge, %262
  %iminus.6 = phi %struct.node* [ %sigma_node45, %262 ], [ %iminus.0, %if.then32.if.end39_crit_edge ]
  br label %if.end40

if.end40:                                         ; preds = %if.else28.if.end40_crit_edge, %if.end39
  %iminus.7 = phi %struct.node* [ %iminus.6, %if.end39 ], [ %iminus.0, %if.else28.if.end40_crit_edge ]
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.end27
  %iminus.8 = phi %struct.node* [ %iminus.7, %if.end40 ], [ %iminus.5, %if.end27 ]
  %pred42 = getelementptr inbounds %struct.node* %sigma_node45, i32 0, i32 3
  %263 = ptrtoint %struct.node** %pred42 to i64
  %264 = lshr i64 %263, 3
  %265 = or i64 %264, 17592186044416
  %266 = inttoptr i64 %265 to i8*
  %267 = load i8* %266
  %268 = icmp ne i8 %267, 0
  br i1 %268, label %269, label %270

; <label>:269                                     ; preds = %if.end41
  call void @__asan_report_load8(i64 %263)
  call void asm sideeffect "", ""()
  unreachable

; <label>:270                                     ; preds = %if.end41
  %271 = load %struct.node** %pred42, align 8
  br label %if.end43

if.end43:                                         ; preds = %270, %143
  %iplus.addr.1 = phi %struct.node* [ %144, %143 ], [ %sigma_node, %270 ]
  %jplus.addr.1 = phi %struct.node* [ %sigma_node45, %143 ], [ %271, %270 ]
  %iminus.9 = phi %struct.node* [ %iminus.4, %143 ], [ %iminus.8, %270 ]
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %sigma_node46 = phi %struct.node* [ %jplus.addr.0, %while.cond ]
  %sigma_node44 = phi %struct.node* [ %iplus.addr.0, %while.cond ]
  %272 = ptrtoint %struct.node** %w to i64
  %273 = lshr i64 %272, 3
  %274 = or i64 %273, 17592186044416
  %275 = inttoptr i64 %274 to i8*
  %276 = load i8* %275
  %277 = icmp ne i8 %276, 0
  br i1 %277, label %278, label %279

; <label>:278                                     ; preds = %while.end
  call void @__asan_report_store8(i64 %272)
  call void asm sideeffect "", ""()
  unreachable

; <label>:279                                     ; preds = %while.end
  store %struct.node* %sigma_node44, %struct.node** %w, align 8
  ret %struct.node* %iminus.0
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
