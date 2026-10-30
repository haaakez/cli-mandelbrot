.intel_syntax noprefix
.section .rodata
clear: .ascii "\033[2J\033[?25l"
home: .ascii "\033[H"
end: .ascii "\033[0m\033[?25h\n"
stopmsg: .ascii "\nTarget zoom of approximately 1e100 reached.\n"
ramp: .ascii " .:-=+*#%@"
target0r: .asciz "-1.28833014564695151403873392719533256301212357299041509393365431930718931179968807917527390856045147079682177244601931714257839959830541146384463083728798948190746622414286300195591613431509707377254140187887060862"
target0i: .asciz "0.417753078805440483748491715484009493734748273336756671102583883423355459571685922570068534325642529427670456637044426680274715944195519106951611849256288368767431682075006966544923367847757059898235785845648558537"
target1r: .asciz "-0.52271653946437387174045397382460337721590934811118516799750017489918781987810610873272488219727965942762018248089836142811850726116568742493375587750988092792438953127068687701063333969437217188800887464973013044"
target1i: .asciz "0.703896328068469651390752187051304164983650750439058788328992856376140275129467816268745042979880564197797978791840543087443260338859816280388113253012556406347101600482566157795952770176294373968871225977638454520"
target2r: .asciz "-0.29064655090351422913111892387226188678757864623714437981114800733931854188590612963107769761362082202320562635407414130098741841722753509157017673410216429039580679994546508177555428100735218121545106301666981249"
target2i: .asciz "0.858614680933057282309995011582534649014081376762581024866504344101068908313677386645202953155562317826781151147137991686176348122188158462925679767803421379979687814051509712386466916060742526640362356164381579359"
target3r: .asciz "0.366362983422764341328932730797849058049853857302798581020042294955577332518413468412047703920294463751775862985570364430870422389781824238035327279554166809054396640210819264322642287304844582906302727569064033522"
target3i: .asciz "0.591533773261445227577493493716541981153545720382641121464347350418803619778012356652881811320323944548891548753811867677719460529594298003643656427366717980379532346172581896823117703019389221748711907629210726128"
target4r: .asciz "-0.62427217302560394465119223656422285048902007251578089548373924817848601083045493035823483143471605169756276508617804327124398135676594100084501690061699579124431219847331608924513022864504287233828091911913746053"
target4i: .asciz "0.610292159607580806985885193492885304121496487329938733862938314433061727853071423268316493457076040323263010112582774161786619880718657355688409633792101385952998053432242635043225800676004311460700208022133514483"
target5r: .asciz "-0.29802336638913132391162150167306369806036470299695375626225023187805884814325023655810773324066672485749101146921553410570779675480793034278550161653137773144805223079770390659704674591177065013091331526522949689"
target5i: .asciz "0.841250928695470878218369430169692782228697138584659866623145999325681192015392558820606849022373897529257763546205362158856577005810659043367857478134232940458244124836585449918644681978385737746092491383846645366"
target6r: .asciz "-1.16234159988403878942761658032613633036294584468515127749673699512736925864149712058159687086199791423424381542387672542855011622602483225260413049783353024138021223372634434151677535260224992918662792830512829238"
target6i: .asciz "0.292368933896586059926418976902385710367056462878498802585504198051268426932904189147356154388580333542390844478919227417192101050604549091728735556415652001891033360310221659585269108629767440582329232811051322920"
target7r: .asciz "-0.77568376800905379746948350393474104572824650461580039479495200140066601722281958989488315936878225502825229668905097250894299179080463737937506494827746685139773763998859783006009639912986589473947569709540636450"
target7i: .asciz "0.136467368294690124733274409617848765197772111592467696407800195400835665974815500875448611244178656625706823059759836009902469392551108149827753781145286649993814296666641015839865443932434240927700827323224648372"
target_table_0: .quad target0r,target0i,5,3
target_table_1: .quad target1r,target1i,5,3
target_table_2: .quad target2r,target2i,5,3
target_table_3: .quad target3r,target3i,5,3
target_table_4: .quad target4r,target4i,7,4
target_table_5: .quad target5r,target5i,7,4
target_table_6: .quad target6r,target6i,7,4
target_table_7: .quad target7r,target7i,24,2
targets = target_table_0
limit_width: .double 4.0e-100
four: .double 4.0
half: .double 0.5
startreal: .double -0.5
scale: .double 0.985
maxreference: .double 256.0
.section .bss
.align 16
.lcomm ref_real,400008
.lcomm ref_imag,400008
.lcomm qr,32
.lcomm qi,32
.lcomm qzr,32
.lcomm qzi,32
.lcomm qrr,32
.lcomm qii,32
.lcomm qri,32
.lcomm preperiod,4
.lcomm period,4
.lcomm old_w,4
.lcomm old_h,4
.lcomm re_double,8
.lcomm im_double,8
.lcomm zoom_width,8
.lcomm pitch,8
.lcomm offset_real,8
.lcomm offset_imag,8
.lcomm width,4
.lcomm height,4
.lcomm ref_len,4
.lcomm maxiter,4
.lcomm frame_no,4
.lcomm canvas,16781312
.lcomm ws,8
.section .text
.globl main
.type main,@function
main:
 push rbp
 mov rbp,rsp
 push rbx
 push r12
 push r13
 push r14
 push r15
 sub rsp,40
 mov edi,2
 lea rsi,cleanup[rip]
 call signal@PLT
 mov edi,15
 lea rsi,cleanup[rip]
 call signal@PLT
 mov eax,318
 lea rdi,[rbp-44]
 mov esi,4
 xor edx,edx
 syscall
 cmp eax,4
 je have_random
 xor edi,edi
 call time@PLT
 mov DWORD PTR [rbp-44],eax
have_random:
 mov eax,DWORD PTR [rbp-44]
 xor edx,edx
 mov ecx,8
 div ecx
 mov eax,edx
 shl eax,5
 lea rbx,targets[rip]
 add rbx,rax
 mov eax,DWORD PTR [rbx+16]
 mov DWORD PTR preperiod[rip],eax
 mov eax,DWORD PTR [rbx+24]
 mov DWORD PTR period[rip],eax
 lea r12,qr[rip]
 mov r13d,7
init_mpfr:
 mov rdi,r12
 mov esi,768
 call mpfr_init2@PLT
 add r12,32
 dec r13d
 jnz init_mpfr
 lea rdi,qr[rip]
 mov rsi,QWORD PTR [rbx]
 mov edx,10
 xor ecx,ecx
 call mpfr_set_str@PLT
 lea rdi,qi[rip]
 mov rsi,QWORD PTR [rbx+8]
 mov edx,10
 xor ecx,ecx
 call mpfr_set_str@PLT
 lea rdi,qr[rip]
 xor esi,esi
 call mpfr_get_d@PLT
 movsd QWORD PTR re_double[rip],xmm0
 lea rdi,qi[rip]
 xor esi,esi
 call mpfr_get_d@PLT
 movsd QWORD PTR im_double[rip],xmm0
 lea rdi,qzr[rip]
 xor esi,esi
 xor edx,edx
 call mpfr_set_ui@PLT
 lea rdi,qzi[rip]
 xor esi,esi
 xor edx,edx
 call mpfr_set_ui@PLT
 xor r12d,r12d
reference_loop:
 lea rdi,qzr[rip]
 xor esi,esi
 call mpfr_get_d@PLT
 lea rax,ref_real[rip]
 movsd QWORD PTR [rax+r12*8],xmm0
 lea rdi,qzi[rip]
 xor esi,esi
 call mpfr_get_d@PLT
 lea rax,ref_imag[rip]
 movsd QWORD PTR [rax+r12*8],xmm0
 mov eax,DWORD PTR preperiod[rip]
 add eax,DWORD PTR period[rip]
 dec eax
 cmp r12d,eax
 je reference_repeat
 lea rdi,qrr[rip]
 lea rsi,qzr[rip]
 mov rdx,rsi
 xor ecx,ecx
 call mpfr_mul@PLT
 lea rdi,qii[rip]
 lea rsi,qzi[rip]
 mov rdx,rsi
 xor ecx,ecx
 call mpfr_mul@PLT
 lea rdi,qri[rip]
 lea rsi,qzr[rip]
 lea rdx,qzi[rip]
 xor ecx,ecx
 call mpfr_mul@PLT
 lea rdi,qri[rip]
 mov rsi,rdi
 mov edx,1
 xor ecx,ecx
 call mpfr_mul_2ui@PLT
 lea rdi,qri[rip]
 mov rsi,rdi
 lea rdx,qi[rip]
 xor ecx,ecx
 call mpfr_add@PLT
 lea rdi,qzr[rip]
 lea rsi,qrr[rip]
 lea rdx,qii[rip]
 xor ecx,ecx
 call mpfr_sub@PLT
 lea rdi,qzr[rip]
 mov rsi,rdi
 lea rdx,qr[rip]
 xor ecx,ecx
 call mpfr_add@PLT
 lea rdi,qzi[rip]
 lea rsi,qri[rip]
 xor edx,edx
 call mpfr_set@PLT
 inc r12d
 jmp reference_loop
reference_repeat:
 inc r12d
repeat_loop:
 mov eax,r12d
 sub eax,DWORD PTR preperiod[rip]
 xor edx,edx
 div DWORD PTR period[rip]
 add edx,DWORD PTR preperiod[rip]
 lea rax,ref_real[rip]
 movsd xmm0,QWORD PTR [rax+rdx*8]
 movsd QWORD PTR [rax+r12*8],xmm0
 lea rax,ref_imag[rip]
 movsd xmm0,QWORD PTR [rax+rdx*8]
 movsd QWORD PTR [rax+r12*8],xmm0
 cmp r12d,50000
 jae reference_done
 inc r12d
 jmp repeat_loop
reference_done:
 mov DWORD PTR ref_len[rip],r12d
 movsd xmm0,QWORD PTR four[rip]
 movsd QWORD PTR zoom_width[rip],xmm0
 mov DWORD PTR maxiter[rip],1000
 mov edi,1
 lea rsi,clear[rip]
 mov edx,10
 call write@PLT
frame:
 mov DWORD PTR width[rip],80
 mov DWORD PTR height[rip],30
 mov edi,1
 mov esi,0x5413
 lea rdx,ws[rip]
 call ioctl@PLT
 test eax,eax
 jne size_ready
 movzx eax,WORD PTR ws[rip+2]
 cmp eax,1
 jb size_ready
 cmp eax,4096
 jbe width_ok
 mov eax,4096
width_ok:
 mov DWORD PTR width[rip],eax
 movzx eax,WORD PTR ws[rip]
 cmp eax,2
 jb size_ready
 sub eax,1
 cmp eax,4096
 jbe height_ok
 mov eax,4096
height_ok:
 mov DWORD PTR height[rip],eax
size_ready:
 mov eax,DWORD PTR width[rip]
 cmp eax,DWORD PTR old_w[rip]
 jne resized
 mov eax,DWORD PTR height[rip]
 cmp eax,DWORD PTR old_h[rip]
 je size_unchanged
resized:
 mov eax,DWORD PTR width[rip]
 mov DWORD PTR old_w[rip],eax
 mov eax,DWORD PTR height[rip]
 mov DWORD PTR old_h[rip],eax
 mov edi,1
 lea rsi,clear[rip]
 mov edx,4
 call write@PLT
size_unchanged:
 cvtsi2sd xmm1,DWORD PTR width[rip]
 movsd xmm0,QWORD PTR zoom_width[rip]
 divsd xmm0,xmm1
 movsd QWORD PTR pitch[rip],xmm0
 movsd xmm1,QWORD PTR zoom_width[rip]
 ucomisd xmm1,QWORD PTR limit_width[rip]
 jb precision_end
 pxor xmm0,xmm0
 movsd QWORD PTR offset_real[rip],xmm0
 movsd QWORD PTR offset_imag[rip],xmm0
 xor r12d,r12d
 lea r15,canvas[rip]
row:
 cvtsi2sd xmm11,r12d
 addsd xmm11,QWORD PTR half[rip]
 cvtsi2sd xmm0,DWORD PTR height[rip]
 mulsd xmm0,QWORD PTR half[rip]
 subsd xmm11,xmm0
 mulsd xmm11,QWORD PTR pitch[rip]
 addsd xmm11,xmm11
 addsd xmm11,QWORD PTR offset_imag[rip]
 xor r13d,r13d
pixel:
 cvtsi2sd xmm10,r13d
 addsd xmm10,QWORD PTR half[rip]
 cvtsi2sd xmm0,DWORD PTR width[rip]
 mulsd xmm0,QWORD PTR half[rip]
 subsd xmm10,xmm0
 mulsd xmm10,QWORD PTR pitch[rip]
 addsd xmm10,QWORD PTR offset_real[rip]
 pxor xmm6,xmm6
 pxor xmm7,xmm7
 xor ebx,ebx
 xor r14d,r14d
iterate:
 lea rax,ref_real[rip]
 movsd xmm0,QWORD PTR [rax+r14*8]
 lea rax,ref_imag[rip]
 movsd xmm1,QWORD PTR [rax+r14*8]
 movapd xmm2,xmm0
 addsd xmm2,xmm6
 movapd xmm3,xmm1
 addsd xmm3,xmm7
 movapd xmm4,xmm2
 mulsd xmm4,xmm2
 movapd xmm5,xmm3
 mulsd xmm5,xmm3
 addsd xmm4,xmm5
 movapd xmm12,xmm0
 mulsd xmm12,xmm0
 movapd xmm13,xmm1
 mulsd xmm13,xmm1
 addsd xmm12,xmm13
 movsd xmm13,QWORD PTR four[rip]
 subsd xmm13,xmm12
 movapd xmm14,xmm0
 mulsd xmm14,xmm6
 movapd xmm15,xmm1
 mulsd xmm15,xmm7
 addsd xmm14,xmm15
 addsd xmm14,xmm14
 movapd xmm15,xmm6
 mulsd xmm15,xmm6
 addsd xmm14,xmm15
 movapd xmm15,xmm7
 mulsd xmm15,xmm7
 addsd xmm14,xmm15
 ucomisd xmm14,xmm13
 ja escaped
 cmp ebx,DWORD PTR maxiter[rip]
 jae interior
 movapd xmm5,xmm6
 mulsd xmm5,xmm6
 movapd xmm8,xmm7
 mulsd xmm8,xmm7
 addsd xmm5,xmm8
 ucomisd xmm4,xmm5
 jb rebase
 cmp r14d,DWORD PTR ref_len[rip]
 jae rebase
 movapd xmm8,xmm0
 mulsd xmm8,xmm6
 movapd xmm9,xmm1
 mulsd xmm9,xmm7
 subsd xmm8,xmm9
 addsd xmm8,xmm8
 movapd xmm4,xmm6
 mulsd xmm4,xmm6
 addsd xmm8,xmm4
 movapd xmm4,xmm7
 mulsd xmm4,xmm7
 subsd xmm8,xmm4
 addsd xmm8,xmm10
 mulsd xmm0,xmm7
 mulsd xmm1,xmm6
 addsd xmm0,xmm1
 movapd xmm4,xmm6
 mulsd xmm4,xmm7
 addsd xmm0,xmm4
 addsd xmm0,xmm0
 addsd xmm0,xmm11
 movapd xmm6,xmm8
 movapd xmm7,xmm0
 inc ebx
 inc r14d
 jmp iterate
rebase:
 movapd xmm6,xmm2
 movapd xmm7,xmm3
 xor r14d,r14d
 jmp iterate
escaped:
 mov eax,ebx
 shr eax,1
 xor edx,edx
 mov ecx,18
 div ecx
 cmp edx,9
 jbe shade_ready
 mov eax,18
 sub eax,edx
 mov edx,eax
shade_ready:
 lea rax,ramp[rip]
 mov al,BYTE PTR [rax+rdx]
 jmp put_pixel
interior:
 mov al,32
put_pixel:
 mov BYTE PTR [r15],al
 inc r15
 inc r13d
 cmp r13d,DWORD PTR width[rip]
 jb pixel
 mov BYTE PTR [r15],10
 inc r15
 inc r12d
 cmp r12d,DWORD PTR height[rip]
 jb row
 mov edi,1
 lea rsi,home[rip]
 mov edx,3
 call write@PLT
 mov edi,1
 lea rsi,canvas[rip]
 mov rdx,r15
 sub rdx,rsi
 call write@PLT
 mov edi,16667
 call usleep@PLT
 movsd xmm0,QWORD PTR zoom_width[rip]
 mulsd xmm0,QWORD PTR scale[rip]
 movsd QWORD PTR zoom_width[rip],xmm0
 inc DWORD PTR frame_no[rip]
 add DWORD PTR maxiter[rip],1
 cmp DWORD PTR maxiter[rip],50000
 jbe frame
 mov DWORD PTR maxiter[rip],50000
 jmp frame
precision_end:
 mov edi,1
 lea rsi,stopmsg[rip]
 mov edx,45
 call write@PLT
 xor edi,edi
 jmp cleanup
cleanup:
 mov eax,1
 mov edi,1
 lea rsi,end[rip]
 mov edx,11
 syscall
 mov eax,60
 xor edi,edi
 syscall
.section .note.GNU-stack,"",@progbits
