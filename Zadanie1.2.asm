;Napisz program, ktory w sekcji .data bedzie mial zadeklarowane dwie zmienne A i B
;Oblicz kwadrat przeciwprostokątnej
;Wynik przechowaj w zmiennej pamięci zadeklarowanej w sekcji .bss

section .data
        a dq 3
        b dq 4

section .bss
        Ans1 reso 1
        Ans2 reso 1
        SUM reso 1
section .text
        global _start

_start:
        call _AnsA
        call _AnsB
        call _Sum

_end:
        mov rax, 60
        mov rdi, 0
        syscall

_AnsA:

        mov rax, qword[a]
        mul qword[a]
        mov qword[Ans1], rax
        mov qword[Ans1+8], rdx
        ret
_AnsB:
        mov rax, qword[b]
        mul qword[b]
        mov qword[Ans2], rax
        mov qword[Ans2+8], rdx
        ret
_Sum:
        mov rax, qword[Ans1]
        add rax, qword[Ans2]
        mov qword[SUM], rax
        ret
