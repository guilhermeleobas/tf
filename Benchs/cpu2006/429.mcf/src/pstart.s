; ModuleID = 'pstart.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.network = type { [200 x i8], [200 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double, i64, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i64 }
%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }

@__asan_mapping_offset = linkonce_odr constant i64 17592186044416
@__asan_mapping_scale = linkonce_odr constant i64 3
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 1, void ()* @asan.module_ctor }]

define i64 @primal_start_artificial(%struct.network* %net) address_safety nounwind {
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
  %incdec.ptr = getelementptr inbounds %struct.node* %8, i32 1
  %basic_arc = getelementptr inbounds %struct.node* %8, i32 0, i32 6
  %9 = ptrtoint %struct.arc** %basic_arc to i64
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
  store %struct.arc* null, %struct.arc** %basic_arc, align 8
  %pred = getelementptr inbounds %struct.node* %8, i32 0, i32 3
  %17 = ptrtoint %struct.node** %pred to i64
  %18 = lshr i64 %17, 3
  %19 = or i64 %18, 17592186044416
  %20 = inttoptr i64 %19 to i8*
  %21 = load i8* %20
  %22 = icmp ne i8 %21, 0
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %16
  call void @__asan_report_store8(i64 %17)
  call void asm sideeffect "", ""()
  unreachable

; <label>:24                                      ; preds = %16
  store %struct.node* null, %struct.node** %pred, align 8
  %child = getelementptr inbounds %struct.node* %8, i32 0, i32 2
  %25 = ptrtoint %struct.node** %child to i64
  %26 = lshr i64 %25, 3
  %27 = or i64 %26, 17592186044416
  %28 = inttoptr i64 %27 to i8*
  %29 = load i8* %28
  %30 = icmp ne i8 %29, 0
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %24
  call void @__asan_report_store8(i64 %25)
  call void asm sideeffect "", ""()
  unreachable

; <label>:32                                      ; preds = %24
  store %struct.node* %incdec.ptr, %struct.node** %child, align 8
  %sibling = getelementptr inbounds %struct.node* %8, i32 0, i32 4
  %33 = ptrtoint %struct.node** %sibling to i64
  %34 = lshr i64 %33, 3
  %35 = or i64 %34, 17592186044416
  %36 = inttoptr i64 %35 to i8*
  %37 = load i8* %36
  %38 = icmp ne i8 %37, 0
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %32
  call void @__asan_report_store8(i64 %33)
  call void asm sideeffect "", ""()
  unreachable

; <label>:40                                      ; preds = %32
  store %struct.node* null, %struct.node** %sibling, align 8
  %sibling_prev = getelementptr inbounds %struct.node* %8, i32 0, i32 5
  %41 = ptrtoint %struct.node** %sibling_prev to i64
  %42 = lshr i64 %41, 3
  %43 = or i64 %42, 17592186044416
  %44 = inttoptr i64 %43 to i8*
  %45 = load i8* %44
  %46 = icmp ne i8 %45, 0
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %40
  call void @__asan_report_store8(i64 %41)
  call void asm sideeffect "", ""()
  unreachable

; <label>:48                                      ; preds = %40
  store %struct.node* null, %struct.node** %sibling_prev, align 8
  %n = getelementptr inbounds %struct.network* %net, i32 0, i32 2
  %49 = ptrtoint i64* %n to i64
  %50 = lshr i64 %49, 3
  %51 = or i64 %50, 17592186044416
  %52 = inttoptr i64 %51 to i8*
  %53 = load i8* %52
  %54 = icmp ne i8 %53, 0
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %48
  call void @__asan_report_load8(i64 %49)
  call void asm sideeffect "", ""()
  unreachable

; <label>:56                                      ; preds = %48
  %57 = load i64* %n, align 8
  %add = add nsw i64 %57, 1
  %depth = getelementptr inbounds %struct.node* %8, i32 0, i32 11
  %58 = ptrtoint i64* %depth to i64
  %59 = lshr i64 %58, 3
  %60 = or i64 %59, 17592186044416
  %61 = inttoptr i64 %60 to i8*
  %62 = load i8* %61
  %63 = icmp ne i8 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %56
  call void @__asan_report_store8(i64 %58)
  call void asm sideeffect "", ""()
  unreachable

; <label>:65                                      ; preds = %56
  store i64 %add, i64* %depth, align 8
  %orientation = getelementptr inbounds %struct.node* %8, i32 0, i32 1
  %66 = ptrtoint i32* %orientation to i64
  %67 = lshr i64 %66, 3
  %68 = or i64 %67, 17592186044416
  %69 = inttoptr i64 %68 to i8*
  %70 = load i8* %69
  %71 = icmp ne i8 %70, 0
  br i1 %71, label %72, label %78

; <label>:72                                      ; preds = %65
  %73 = and i64 %66, 7
  %74 = add i64 %73, 3
  %75 = trunc i64 %74 to i8
  %76 = icmp sge i8 %75, %70
  br i1 %76, label %77, label %78

; <label>:77                                      ; preds = %72
  call void @__asan_report_store4(i64 %66)
  call void asm sideeffect "", ""()
  unreachable

; <label>:78                                      ; preds = %72, %65
  store i32 0, i32* %orientation, align 4
  %potential = getelementptr inbounds %struct.node* %8, i32 0, i32 0
  %79 = ptrtoint i64* %potential to i64
  %80 = lshr i64 %79, 3
  %81 = or i64 %80, 17592186044416
  %82 = inttoptr i64 %81 to i8*
  %83 = load i8* %82
  %84 = icmp ne i8 %83, 0
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %78
  call void @__asan_report_store8(i64 %79)
  call void asm sideeffect "", ""()
  unreachable

; <label>:86                                      ; preds = %78
  store i64 -100000000, i64* %potential, align 8
  %flow = getelementptr inbounds %struct.node* %8, i32 0, i32 10
  %87 = ptrtoint i64* %flow to i64
  %88 = lshr i64 %87, 3
  %89 = or i64 %88, 17592186044416
  %90 = inttoptr i64 %89 to i8*
  %91 = load i8* %90
  %92 = icmp ne i8 %91, 0
  br i1 %92, label %93, label %94

; <label>:93                                      ; preds = %86
  call void @__asan_report_store8(i64 %87)
  call void asm sideeffect "", ""()
  unreachable

; <label>:94                                      ; preds = %86
  store i64 0, i64* %flow, align 8
  %stop_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 24
  %95 = ptrtoint %struct.arc** %stop_arcs to i64
  %96 = lshr i64 %95, 3
  %97 = or i64 %96, 17592186044416
  %98 = inttoptr i64 %97 to i8*
  %99 = load i8* %98
  %100 = icmp ne i8 %99, 0
  br i1 %100, label %101, label %102

; <label>:101                                     ; preds = %94
  call void @__asan_report_load8(i64 %95)
  call void asm sideeffect "", ""()
  unreachable

; <label>:102                                     ; preds = %94
  %103 = load %struct.arc** %stop_arcs, align 8
  %104 = bitcast %struct.arc* %103 to i8*
  %arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 23
  %105 = ptrtoint %struct.arc** %arcs to i64
  %106 = lshr i64 %105, 3
  %107 = or i64 %106, 17592186044416
  %108 = inttoptr i64 %107 to i8*
  %109 = load i8* %108
  %110 = icmp ne i8 %109, 0
  br i1 %110, label %111, label %112

; <label>:111                                     ; preds = %102
  call void @__asan_report_load8(i64 %105)
  call void asm sideeffect "", ""()
  unreachable

; <label>:112                                     ; preds = %102
  %113 = load %struct.arc** %arcs, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %112
  %phi_node = phi i8* [ %sigma_node29, %for.inc ], [ %104, %112 ]
  %arc.0 = phi %struct.arc* [ %113, %112 ], [ %incdec.ptr3, %for.inc ]
  %114 = bitcast i8* %phi_node to %struct.arc*
  %cmp = icmp ne %struct.arc* %arc.0, %114
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sigma_node29 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node27 = phi %struct.arc* [ %114, %for.cond ]
  %sigma_node = phi %struct.arc* [ %arc.0, %for.cond ]
  %ident = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 3
  %115 = ptrtoint i32* %ident to i64
  %116 = lshr i64 %115, 3
  %117 = or i64 %116, 17592186044416
  %118 = inttoptr i64 %117 to i8*
  %119 = load i8* %118
  %120 = icmp ne i8 %119, 0
  br i1 %120, label %121, label %127

; <label>:121                                     ; preds = %for.body
  %122 = and i64 %115, 7
  %123 = add i64 %122, 3
  %124 = trunc i64 %123 to i8
  %125 = icmp sge i8 %124, %119
  br i1 %125, label %126, label %127

; <label>:126                                     ; preds = %121
  call void @__asan_report_load4(i64 %115)
  call void asm sideeffect "", ""()
  unreachable

; <label>:127                                     ; preds = %121, %for.body
  %128 = load i32* %ident, align 4
  %cmp1 = icmp ne i32 %128, -1
  br i1 %cmp1, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %127
  %sigma_node32 = phi i32 [ %128, %127 ]
  br label %if.end

if.then:                                          ; preds = %127
  %sigma_node31 = phi i32 [ %128, %127 ]
  %ident2 = getelementptr inbounds %struct.arc* %sigma_node, i32 0, i32 3
  %129 = ptrtoint i32* %ident2 to i64
  %130 = lshr i64 %129, 3
  %131 = or i64 %130, 17592186044416
  %132 = inttoptr i64 %131 to i8*
  %133 = load i8* %132
  %134 = icmp ne i8 %133, 0
  br i1 %134, label %135, label %141

; <label>:135                                     ; preds = %if.then
  %136 = and i64 %129, 7
  %137 = add i64 %136, 3
  %138 = trunc i64 %137 to i8
  %139 = icmp sge i8 %138, %133
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %135
  call void @__asan_report_store4(i64 %129)
  call void asm sideeffect "", ""()
  unreachable

; <label>:141                                     ; preds = %135, %if.then
  store i32 1, i32* %ident2, align 4
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %141
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %incdec.ptr3 = getelementptr inbounds %struct.arc* %sigma_node, i32 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %sigma_node30 = phi i8* [ %phi_node, %for.cond ]
  %sigma_node28 = phi %struct.arc* [ %114, %for.cond ]
  %sigma_node26 = phi %struct.arc* [ %arc.0, %for.cond ]
  %dummy_arcs = getelementptr inbounds %struct.network* %net, i32 0, i32 25
  %142 = ptrtoint %struct.arc** %dummy_arcs to i64
  %143 = lshr i64 %142, 3
  %144 = or i64 %143, 17592186044416
  %145 = inttoptr i64 %144 to i8*
  %146 = load i8* %145
  %147 = icmp ne i8 %146, 0
  br i1 %147, label %148, label %149

; <label>:148                                     ; preds = %for.end
  call void @__asan_report_load8(i64 %142)
  call void asm sideeffect "", ""()
  unreachable

; <label>:149                                     ; preds = %for.end
  %150 = load %struct.arc** %dummy_arcs, align 8
  %stop_nodes = getelementptr inbounds %struct.network* %net, i32 0, i32 22
  %151 = ptrtoint %struct.node** %stop_nodes to i64
  %152 = lshr i64 %151, 3
  %153 = or i64 %152, 17592186044416
  %154 = inttoptr i64 %153 to i8*
  %155 = load i8* %154
  %156 = icmp ne i8 %155, 0
  br i1 %156, label %157, label %158

; <label>:157                                     ; preds = %149
  call void @__asan_report_load8(i64 %151)
  call void asm sideeffect "", ""()
  unreachable

; <label>:158                                     ; preds = %149
  %159 = load %struct.node** %stop_nodes, align 8
  %160 = bitcast %struct.node* %159 to i8*
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc18, %158
  %phi_node38 = phi i8* [ %sigma_node37, %for.inc18 ], [ %160, %158 ]
  %arc.1 = phi %struct.arc* [ %150, %158 ], [ %incdec.ptr19, %for.inc18 ]
  %node.0 = phi %struct.node* [ %incdec.ptr, %158 ], [ %incdec.ptr20, %for.inc18 ]
  %161 = bitcast i8* %phi_node38 to %struct.node*
  %cmp5 = icmp ne %struct.node* %node.0, %161
  br i1 %cmp5, label %for.body6, label %for.end21

for.body6:                                        ; preds = %for.cond4
  %sigma_node37 = phi i8* [ %phi_node38, %for.cond4 ]
  %sigma_node35 = phi %struct.node* [ %161, %for.cond4 ]
  %sigma_node33 = phi %struct.node* [ %node.0, %for.cond4 ]
  %basic_arc7 = getelementptr inbounds %struct.node* %sigma_node33, i32 0, i32 6
  %162 = ptrtoint %struct.arc** %basic_arc7 to i64
  %163 = lshr i64 %162, 3
  %164 = or i64 %163, 17592186044416
  %165 = inttoptr i64 %164 to i8*
  %166 = load i8* %165
  %167 = icmp ne i8 %166, 0
  br i1 %167, label %168, label %169

; <label>:168                                     ; preds = %for.body6
  call void @__asan_report_store8(i64 %162)
  call void asm sideeffect "", ""()
  unreachable

; <label>:169                                     ; preds = %for.body6
  store %struct.arc* %arc.1, %struct.arc** %basic_arc7, align 8
  %pred8 = getelementptr inbounds %struct.node* %sigma_node33, i32 0, i32 3
  %170 = ptrtoint %struct.node** %pred8 to i64
  %171 = lshr i64 %170, 3
  %172 = or i64 %171, 17592186044416
  %173 = inttoptr i64 %172 to i8*
  %174 = load i8* %173
  %175 = icmp ne i8 %174, 0
  br i1 %175, label %176, label %177

; <label>:176                                     ; preds = %169
  call void @__asan_report_store8(i64 %170)
  call void asm sideeffect "", ""()
  unreachable

; <label>:177                                     ; preds = %169
  store %struct.node* %8, %struct.node** %pred8, align 8
  %child9 = getelementptr inbounds %struct.node* %sigma_node33, i32 0, i32 2
  %178 = ptrtoint %struct.node** %child9 to i64
  %179 = lshr i64 %178, 3
  %180 = or i64 %179, 17592186044416
  %181 = inttoptr i64 %180 to i8*
  %182 = load i8* %181
  %183 = icmp ne i8 %182, 0
  br i1 %183, label %184, label %185

; <label>:184                                     ; preds = %177
  call void @__asan_report_store8(i64 %178)
  call void asm sideeffect "", ""()
  unreachable

; <label>:185                                     ; preds = %177
  store %struct.node* null, %struct.node** %child9, align 8
  %add.ptr = getelementptr inbounds %struct.node* %sigma_node33, i64 1
  %sibling10 = getelementptr inbounds %struct.node* %sigma_node33, i32 0, i32 4
  %186 = ptrtoint %struct.node** %sibling10 to i64
  %187 = lshr i64 %186, 3
  %188 = or i64 %187, 17592186044416
  %189 = inttoptr i64 %188 to i8*
  %190 = load i8* %189
  %191 = icmp ne i8 %190, 0
  br i1 %191, label %192, label %193

; <label>:192                                     ; preds = %185
  call void @__asan_report_store8(i64 %186)
  call void asm sideeffect "", ""()
  unreachable

; <label>:193                                     ; preds = %185
  store %struct.node* %add.ptr, %struct.node** %sibling10, align 8
  %add.ptr11 = getelementptr inbounds %struct.node* %sigma_node33, i64 -1
  %sibling_prev12 = getelementptr inbounds %struct.node* %sigma_node33, i32 0, i32 5
  %194 = ptrtoint %struct.node** %sibling_prev12 to i64
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
  store %struct.node* %add.ptr11, %struct.node** %sibling_prev12, align 8
  %depth13 = getelementptr inbounds %struct.node* %sigma_node33, i32 0, i32 11
  %202 = ptrtoint i64* %depth13 to i64
  %203 = lshr i64 %202, 3
  %204 = or i64 %203, 17592186044416
  %205 = inttoptr i64 %204 to i8*
  %206 = load i8* %205
  %207 = icmp ne i8 %206, 0
  br i1 %207, label %208, label %209

; <label>:208                                     ; preds = %201
  call void @__asan_report_store8(i64 %202)
  call void asm sideeffect "", ""()
  unreachable

; <label>:209                                     ; preds = %201
  store i64 1, i64* %depth13, align 8
  %cost = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 0
  %210 = ptrtoint i64* %cost to i64
  %211 = lshr i64 %210, 3
  %212 = or i64 %211, 17592186044416
  %213 = inttoptr i64 %212 to i8*
  %214 = load i8* %213
  %215 = icmp ne i8 %214, 0
  br i1 %215, label %216, label %217

; <label>:216                                     ; preds = %209
  call void @__asan_report_store8(i64 %210)
  call void asm sideeffect "", ""()
  unreachable

; <label>:217                                     ; preds = %209
  store i64 100000000, i64* %cost, align 8
  %ident14 = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 3
  %218 = ptrtoint i32* %ident14 to i64
  %219 = lshr i64 %218, 3
  %220 = or i64 %219, 17592186044416
  %221 = inttoptr i64 %220 to i8*
  %222 = load i8* %221
  %223 = icmp ne i8 %222, 0
  br i1 %223, label %224, label %230

; <label>:224                                     ; preds = %217
  %225 = and i64 %218, 7
  %226 = add i64 %225, 3
  %227 = trunc i64 %226 to i8
  %228 = icmp sge i8 %227, %222
  br i1 %228, label %229, label %230

; <label>:229                                     ; preds = %224
  call void @__asan_report_store4(i64 %218)
  call void asm sideeffect "", ""()
  unreachable

; <label>:230                                     ; preds = %224, %217
  store i32 0, i32* %ident14, align 4
  %orientation15 = getelementptr inbounds %struct.node* %sigma_node33, i32 0, i32 1
  %231 = ptrtoint i32* %orientation15 to i64
  %232 = lshr i64 %231, 3
  %233 = or i64 %232, 17592186044416
  %234 = inttoptr i64 %233 to i8*
  %235 = load i8* %234
  %236 = icmp ne i8 %235, 0
  br i1 %236, label %237, label %243

; <label>:237                                     ; preds = %230
  %238 = and i64 %231, 7
  %239 = add i64 %238, 3
  %240 = trunc i64 %239 to i8
  %241 = icmp sge i8 %240, %235
  br i1 %241, label %242, label %243

; <label>:242                                     ; preds = %237
  call void @__asan_report_store4(i64 %231)
  call void asm sideeffect "", ""()
  unreachable

; <label>:243                                     ; preds = %237, %230
  store i32 1, i32* %orientation15, align 4
  %potential16 = getelementptr inbounds %struct.node* %sigma_node33, i32 0, i32 0
  %244 = ptrtoint i64* %potential16 to i64
  %245 = lshr i64 %244, 3
  %246 = or i64 %245, 17592186044416
  %247 = inttoptr i64 %246 to i8*
  %248 = load i8* %247
  %249 = icmp ne i8 %248, 0
  br i1 %249, label %250, label %251

; <label>:250                                     ; preds = %243
  call void @__asan_report_store8(i64 %244)
  call void asm sideeffect "", ""()
  unreachable

; <label>:251                                     ; preds = %243
  store i64 0, i64* %potential16, align 8
  %tail = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 1
  %252 = ptrtoint %struct.node** %tail to i64
  %253 = lshr i64 %252, 3
  %254 = or i64 %253, 17592186044416
  %255 = inttoptr i64 %254 to i8*
  %256 = load i8* %255
  %257 = icmp ne i8 %256, 0
  br i1 %257, label %258, label %259

; <label>:258                                     ; preds = %251
  call void @__asan_report_store8(i64 %252)
  call void asm sideeffect "", ""()
  unreachable

; <label>:259                                     ; preds = %251
  store %struct.node* %sigma_node33, %struct.node** %tail, align 8
  %head = getelementptr inbounds %struct.arc* %arc.1, i32 0, i32 2
  %260 = ptrtoint %struct.node** %head to i64
  %261 = lshr i64 %260, 3
  %262 = or i64 %261, 17592186044416
  %263 = inttoptr i64 %262 to i8*
  %264 = load i8* %263
  %265 = icmp ne i8 %264, 0
  br i1 %265, label %266, label %267

; <label>:266                                     ; preds = %259
  call void @__asan_report_store8(i64 %260)
  call void asm sideeffect "", ""()
  unreachable

; <label>:267                                     ; preds = %259
  store %struct.node* %8, %struct.node** %head, align 8
  %flow17 = getelementptr inbounds %struct.node* %sigma_node33, i32 0, i32 10
  %268 = ptrtoint i64* %flow17 to i64
  %269 = lshr i64 %268, 3
  %270 = or i64 %269, 17592186044416
  %271 = inttoptr i64 %270 to i8*
  %272 = load i8* %271
  %273 = icmp ne i8 %272, 0
  br i1 %273, label %274, label %275

; <label>:274                                     ; preds = %267
  call void @__asan_report_store8(i64 %268)
  call void asm sideeffect "", ""()
  unreachable

; <label>:275                                     ; preds = %267
  store i64 0, i64* %flow17, align 8
  br label %for.inc18

for.inc18:                                        ; preds = %275
  %incdec.ptr19 = getelementptr inbounds %struct.arc* %arc.1, i32 1
  %incdec.ptr20 = getelementptr inbounds %struct.node* %sigma_node33, i32 1
  br label %for.cond4

for.end21:                                        ; preds = %for.cond4
  %sigma_node39 = phi i8* [ %phi_node38, %for.cond4 ]
  %sigma_node36 = phi %struct.node* [ %161, %for.cond4 ]
  %sigma_node34 = phi %struct.node* [ %node.0, %for.cond4 ]
  %incdec.ptr22 = getelementptr inbounds %struct.node* %sigma_node34, i32 -1
  %incdec.ptr23 = getelementptr inbounds %struct.node* %8, i32 1
  %sibling24 = getelementptr inbounds %struct.node* %incdec.ptr22, i32 0, i32 4
  %276 = ptrtoint %struct.node** %sibling24 to i64
  %277 = lshr i64 %276, 3
  %278 = or i64 %277, 17592186044416
  %279 = inttoptr i64 %278 to i8*
  %280 = load i8* %279
  %281 = icmp ne i8 %280, 0
  br i1 %281, label %282, label %283

; <label>:282                                     ; preds = %for.end21
  call void @__asan_report_store8(i64 %276)
  call void asm sideeffect "", ""()
  unreachable

; <label>:283                                     ; preds = %for.end21
  store %struct.node* null, %struct.node** %sibling24, align 8
  %sibling_prev25 = getelementptr inbounds %struct.node* %incdec.ptr23, i32 0, i32 5
  %284 = ptrtoint %struct.node** %sibling_prev25 to i64
  %285 = lshr i64 %284, 3
  %286 = or i64 %285, 17592186044416
  %287 = inttoptr i64 %286 to i8*
  %288 = load i8* %287
  %289 = icmp ne i8 %288, 0
  br i1 %289, label %290, label %291

; <label>:290                                     ; preds = %283
  call void @__asan_report_store8(i64 %284)
  call void asm sideeffect "", ""()
  unreachable

; <label>:291                                     ; preds = %283
  store %struct.node* null, %struct.node** %sibling_prev25, align 8
  ret i64 0
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
