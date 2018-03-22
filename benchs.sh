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

benchs=( "ASC_Sequoia" "BenchmarkGame" "BitBench" "CoyoteBench" "DOE_ProxyApps_C" 
  "Dhrystone" "McGill" "MiBench" "Misc"  "Shootout" "Stanford" "Fhourstones" 
  "Linpack" "mediabench" "cpu2006" "ASCI_Purple" "Fhourstones_31" 
  "SciMark2-C" "sim" "mafft" "tramp3d-v4" "llubenchmark" "nbench" "Ptrdist"
  "Trimaran" "TSVC" "PAQ8p" "NPB-serial" "VersaBench" "FreeBench"
  "MallocBench" "McCat" "Olden" "Prolangs-C");