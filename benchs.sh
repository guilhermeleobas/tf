#!/bin/bash

function ASC_Sequoia() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function BenchmarkGame() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function BitBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function CoyoteBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Dhrystone() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function DOE_ProxyApps_C() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function McGill() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function MiBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Misc() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Shootout() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Stanford() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Ptrdist() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Trimaran() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function TSVC() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function NPB-serial() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function VersaBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function FreeBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function MallocBench() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function McCat() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Olden() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }
function Prolangs-C() { dirs=($( ls -d */ )); walk "${dirs[@]}" ; }

function Fhourstones() { walk "." ; }
function Fhourstones_31() { walk "." ; }
function Linpack() { walk "." ; }
function ASCI_Purple() { walk "." ; }
function SciMark2-C() { walk "." ; }
function sim() { walk "." ; }
function mafft() { walk "." ; }
function tramp3d-v4() { walk "." ; }
function llubenchmark() { walk "." ; }
function nbench() { walk "." ; }
function PAQ8p() { walk "." ; }

function mediabench() {
  dirs=("adpcm/rawcaudio" "adpcm/rawdaudio" "g721/g721encode" "jpeg/jpeg-6a" 
        "gsm/toast" "mpeg2/mpeg2dec")
  walk "${dirs[@]}" ;
}

function PolyBench(){
  dirs=("linear-algebra/kernels/2mm" "linear-algebra/kernels/3mm" "linear-algebra/kernels/atax"
        "linear-algebra/kernels/bicg" "linear-algebra/kernels/doitgen" "linear-algebra/kernels/mvt" 
        "linear-algebra/solvers/cholesky" "linear-algebra/solvers/durbin" "linear-algebra/solvers/gramschmidt"
        "linear-algebra/solvers/lu" "linear-algebra/solvers/ludcmp" "linear-algebra/solvers/trisolv"
        "linear-algebra/blas/gemm" "linear-algebra/blas/gemver" "linear-algebra/blas/gesummv"
        "linear-algebra/blas/symm" "linear-algebra/blas/syr2k" "linear-algebra/blas/syrk"
        "linear-algebra/blas/trmm"
        "datamining/correlation" "datamining/covariance"
        "medley/floyd-warshall" "medley/deriche" "medley/nussinov"
        "stencils/adi" "stencils/fdtd-2d" "stencils/heat-3d" "stencils/jacobi-1d" "stencils/jacobi-2d"
        "stencils/seidel-2d")
  walk "${dirs[@]}"
}

function cpu2006(){
  dirs=("400.perlbench/rbc/" "401.bzip2/rbc/" "403.gcc/rbc/" "429.mcf/rbc/"
        "433.milc/rbc/" "444.namd/rbc/" "445.gobmk/rbc/"
        "456.hmmer/rbc/" "458.sjeng/rbc/" "462.libquantum/rbc/" 
        "464.h264ref/rbc/" "470.lbm/rbc/") ; 
  CPU2006=1
  walk "${dirs[@]}" ;
  unset CPU2006
}

benchs=( "ASC_Sequoia" "BenchmarkGame" "BitBench" "CoyoteBench" "DOE_ProxyApps_C" 
  "Dhrystone" "McGill" "MiBench" "Misc"  "Shootout" "Stanford" "Fhourstones" 
  "Linpack" "mediabench" "ASCI_Purple" "Fhourstones_31" "PolyBench"
  "SciMark2-C" "sim" "mafft" "tramp3d-v4" "llubenchmark" "nbench" "Ptrdist"
  "Trimaran" "TSVC" "PAQ8p" "NPB-serial" "VersaBench" "FreeBench"
  "MallocBench" "McCat" "Olden" "Prolangs-C" "cpu2006");

# benchs=("cpu2006")
