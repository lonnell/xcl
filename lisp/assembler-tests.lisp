(require "ASSEMBLER")

#+x86
(defparameter *tests*
  '(((:push :eax)               #(#x50))
    ((:push :ebp)               #(#x55))
    ((:mov :esp :ebp)           #(#x89 #xe5))
    ((:mov :eax :edx)           #(#x89 #xc2))
    ((:test 3 :al)              #(#xa8 #x03))
    ((:test 3 :dl)              #(#xf6 #xc2 #x03))
    ((:test :al :al)            #(#x84 #xc0))
    ((:add :edx :eax)           #(#x01 #xd0))
    ((:add 8 :esp)              #(#x83 #xc4 #x08))
    ((:add 127 :edx)            #(#x83 #xc2 #x7f))
    ((:add 128 :edx)            #(#x81 #xc2 #x80 #x00 #x00 #x00))
    ((:add 129 :edx)            #(#x81 #xc2 #x81 #x00 #x00 #x00))
    ((:add -127 :edx)           #(#x83 #xc2 #x81))
    ((:add -128 :edx)           #(#x83 #xc2 #x80))
    ((:add -129 :edx)           #(#x81 #xc2 #x7f #xff #xff #xff))
    ((:test 3 :al)              #(#xa8 #x03))
    ((:test 3 :dl)              #(#xf6 #xc2 #x03))
    ((:test 3 :cl)              #(#xf6 #xc1 #x03))
    ((:test 3 :bl)              #(#xf6 #xc3 #x03))
    ((:testl #x100 (2 :eax))    #(#xf7 #x40 #x02 #x00 #x01 #x00 #x00))
    ((:lea (#x58 :eax) :eax)    #(#x8d #x40 #x58))
    ((:lea (#x58 :edx) :edx)    #(#x8d #x52 #x58))
    ((:mov (-4 :ebp) :eax)      #(#x8b #x45 #xfc))
    ((:mov :eax (:edx))         #(#x89 #x02))
    ((:mov :edx (:edx))         #(#x89 #x12))
    ((:mov (:eax) :eax)         #(#x8b #x00))
    ((:mov (:ecx) :ecx)         #(#x8b #x09))
    ((:mov (:edx) :edx)         #(#x8b #x12))
    ((:mov (:ebx) :ebx)         #(#x8b #x1b))
    ((:mov (0 :ebx) :ebx)       #(#x8b #x1b))
    ((:mov (:edi) :eax)         #(#x8b #x07))
    ((:mov (0 :edi) :eax)       #(#x8b #x07))
    ((:mov (:edi) :edi)         #(#x8b #x3f))
    ((:mov (0 :edi) :edi)       #(#x8b #x3f))
    ((:mov (10 :edx) :al)       #(#x8a #x42 #x0a))
    ((:mov :eax (-4 :ebp))      #(#x89 #x45 #xfc))
    ((:mov :eax (0 :esp))       #(#x89 #x04 #x24))
    ((:mov :eax (:esp))         #(#x89 #x04 #x24))
    ((:mov :edx (0 :esp))       #(#x89 #x14 #x24))
    ((:mov :edx (:esp))         #(#x89 #x14 #x24))
    ((:mov :ecx (:ecx))         #(#x89 #x09))
    ((:mov :ecx (0 :ecx))       #(#x89 #x09))
    ((:mov :ecx (4 :ecx))       #(#x89 #x49 #x04))
    ((:mov :eax (4 :esp))       #(#x89 #x44 #x24 #x04))
    ((:mov :edx (4 :esp))       #(#x89 #x54 #x24 #x04))
    ((:mov :eax (512 :esp))     #(#x89 #x84 #x24 #x00 #x02 #x00 #x00))
    ((:mov :edx (512 :esp))     #(#x89 #x94 #x24 #x00 #x02 #x00 #x00))
    ((:mov #x12345678 :eax)     #(#xb8 #x78 #x56 #x34 #x12))
    ((:mov #x12345678 :edx)     #(#xba #x78 #x56 #x34 #x12))
    ((:mov :cl (:eax))          #(#x88 #x08))
    ((:mov :al (:ecx))          #(#x88 #x01))
    ((:mov :al (:edx))          #(#x88 #x02))
    ((:mov :bl (:eax))          #(#x88 #x18))
    ((:mov :al :dl)             #(#x88 #xc2))
    ((:mov :dl :al)             #(#x88 #xd0))
    ((:mov (#x0a :edx) :ax)     #(#x66 #x8b #x42 #x0a))
    ((:movb (#x50 :edx) :cl)    #(#x8a #x4a #x50))
    ((:movzbl :al :eax)         #(#x0f #xb6 #xc0))
    ((:movzbl (10 :eax :edx) :eax)
                                #(#x0f #xb6 #x44 #x10 #x0a))
    ((:movzwl (10 :eax :edx 2) :eax)
                                #(#x0f #xb7 #x44 #x50 #x0a))
    ((:neg :eax)                #(#xf7 #xd8))
    ((:neg :ecx)                #(#xf7 #xd9))
    ((:shl :edx)                #(#xd1 #xe2))
    ((:shl 4 :eax)              #(#xc1 #xe0 #x04))
    ((:sar 4 :eax)              #(#xc1 #xf8 #x04))
    ((:sar 2 :edx)              #(#xc1 #xfa #x02))
    ((:sar :cl :eax)            #(#xd3 #xf8))
    ((:shr 8 :eax)              #(#xc1 #xe8 #x08))
    ((:and :eax :edx)           #(#x21 #xc2))
    ((:and :edx :eax)           #(#x21 #xd0))
    ((:and #xfc :al)            #(#x24 #xfc))
    ((:and 7 :dl)               #(#x80 #xe2 #x07))
    ((:and 1 :eax)              #(#x83 #xe0 #x01))
    ((:and 1 :edx)              #(#x83 #xe2 #x01))
    ((:and #x100 :edx)          #(#x81 #xe2 #x00 #x01 #x00 #x00))
    ((:xor :eax :eax)           #(#x31 #xc0))
    ((:push 0)                  #(#x6a #x00))
    ((:push 4)                  #(#x6a #x04))
    ((:push 512)                #(#x68 #x00 #x02 #x00 #x00))
    ((:push -512)               #(#x68 #x00 #xfe #xff #xff))
    ((:cmp :eax :edx)           #(#x39 #xc2))
    ((:cmp :edx :eax)           #(#x39 #xd0))
    ((:cmp :edx (6 :eax))       #(#x39 #x50 #x06))
    ((:push (-12 :ebp))         #(#xff #x75 #xf4))
    ((:push (8 :ebp))           #(#xff #x75 #x08))
    ((:push (-132 :ebp))        #(#xff #xb5 #x7c #xff #xff #xff))
    ((:cmp 1 :al)               #(#x3c #x01))
    ((:cmp 6 :dl)               #(#x80 #xfa #x06))
    ((:cmpl #x100 (2 :eax))     #(#x81 #x78 #x02 #x00 #x01 #x00 #x00))
    ((:and #x100 :eax)          #(#x25 #x00 #x01 #x00 #x00))
    ((:movb #xff (40 :eax))     #(#xc6 #x40 #x28 #xff))
    ((:movb #xff (40 :edx))     #(#xc6 #x42 #x28 #xff))
    ((:sub 12 :esp)             #(#x83 #xec #x0c))
    ((:sub :edx :eax)           #(#x29 #xd0))
    ((:sub :eax :edx)           #(#x29 #xc2))
    ((:pop (4 :ecx))            #(#x8f #x41 #x04))
    ((:pop (:ecx))              #(#x8f #x01))
    ((:setb :al)                #(#x0f #x92 #xc0))
    ((:bt :eax (#x1e :edx))     #(#x0f #xa3 #x42 #x1e))
    ((:bt :edx (#x1e :eax))     #(#x0f #xa3 #x50 #x1e))
    ((:ret)                     #(#xc3))
    ))

#+x86-64
(defparameter *tests*
  '(((:push :rax)               #(#x50))
    ((:push :rbp)               #(#x55))
    ((:push :r8)                #(#x41 #x50))
    ((:push :r9)                #(#x41 #x51))
    ((:push :r10)               #(#x41 #x52))
    ((:push :r11)               #(#x41 #x53))
    ((:push :r12)               #(#x41 #x54))
    ((:push :r13)               #(#x41 #x55))
    ((:push :r14)               #(#x41 #x56))
    ((:push :r15)               #(#x41 #x57))
    ((:push #x12345678)         #(#x68 #x78 #x56 #x34 #x12))
    ((:push #x-12345678)        #(#x68 #x88 #xa9 #xcb #xed))
    ((:pop :r8)                 #(#x41 #x58))
    ((:pop :r9)                 #(#x41 #x59))
    ((:pop :r10)                #(#x41 #x5a))
    ((:pop :r11)                #(#x41 #x5b))
    ((:pop :r12)                #(#x41 #x5c))
    ((:pop :r13)                #(#x41 #x5d))
    ((:pop :r14)                #(#x41 #x5e))
    ((:pop :r15)                #(#x41 #x5f))
    ((:mov :rsp :rbp)           #(#x48 #x89 #xe5))
    ((:mov :rax :rdx)           #(#x48 #x89 #xc2))
    ((:mov :rax :rdi)           #(#x48 #x89 #xc7))
    ((:mov :rdx :rsi)           #(#x48 #x89 #xd6))
    ((:mov :rax :r8)            #(#x49 #x89 #xc0))
    ((:mov :r8 :rax)            #(#x4c #x89 #xc0))
    ((:mov :r8 :r9)             #(#x4d #x89 #xc1))
    ((:mov (-40 :rbp) :r8)      #(#x4c #x8b #x45 #xd8))
    ((:mov (-32 :rbp) :r9)      #(#x4c #x8b #x4d #xe0))
    ((:add :rdx :rax)           #(#x48 #x01 #xd0))
    ((:add :rax :rdx)           #(#x48 #x01 #xc2))
    ((:add 6 :al)               #(#x04 #x06))
    ((:add 10 :rax)             #(#x48 #x83 #xc0 #x0a))
    ((:add 8 :rsp)              #(#x48 #x83 #xc4 #x08))
    ((:add 127 :rdx)            #(#x48 #x83 #xc2 #x7f))
    ((:add 128 :rdx)            #(#x48 #x81 #xc2 #x80 #x00 #x00 #x00))
    ((:add 129 :rdx)            #(#x48 #x81 #xc2 #x81 #x00 #x00 #x00))
    ((:add -127 :rdx)           #(#x48 #x83 #xc2 #x81))
    ((:add -128 :rdx)           #(#x48 #x83 #xc2 #x80))
    ((:add -129 :rdx)           #(#x48 #x81 #xc2 #x7f #xff #xff #xff))
    ((:add -2147483648 :r10)    #(#x49 #x81 #xc2 #x00 #x00 #x00 #x80))
    ((:add 2147483647 :r10)     #(#x49 #x81 #xc2 #xff #xff #xff #x7f))
    ((:sub 8 :rsp)              #(#x48 #x83 #xec #x08))
    ((:sub 127 :rdx)            #(#x48 #x83 #xea #x7f))
    ((:sub 128 :rdx)            #(#x48 #x81 #xea #x80 #x00 #x00 #x00))
    ((:sub 129 :rdx)            #(#x48 #x81 #xea #x81 #x00 #x00 #x00))
    ((:sub -127 :rdx)           #(#x48 #x83 #xea #x81))
    ((:sub -128 :rdx)           #(#x48 #x83 #xea #x80))
    ((:sub -129 :rdx)           #(#x48 #x81 #xea #x7f #xff #xff #xff))
    ((:sub -2147483648 :rsp)    #(#x48 #x81 #xec #x00 #x00 #x00 #x80))
    ((:sub 2147483647 :rsp)     #(#x48 #x81 #xec #xff #xff #xff #x7f))
    ((:sub -2147483648 :r10)    #(#x49 #x81 #xea #x00 #x00 #x00 #x80))
    ((:sub 2147483647 :r10)     #(#x49 #x81 #xea #xff #xff #xff #x7f))
    ((:sub :rdx :rax)           #(#x48 #x29 #xd0))
    ((:sub 6 :al)               #(#x2c #x06))
    ((:test 3 :al)              #(#xa8 #x03))
    ((:test 3 :dl)              #(#xf6 #xc2 #x03))
    ((:test 3 :cl)              #(#xf6 #xc1 #x03))
    ((:test 3 :bl)              #(#xf6 #xc3 #x03))
    ((:test 3 :sil)             #(#x40 #xf6 #xc6 #x03))
    ((:test 3 :dil)             #(#x40 #xf6 #xc7 #x03))
    ((:test :al :al)            #(#x84 #xc0))
    ((:test :rax :rax)          #(#x48 #x85 #xc0))
    ((:test :eax (:rdi))        #(#x85 #x07))
    ((:test :eax (#x1e :rdi))   #(#x85 #x47 #x1e))
    ((:test 15 :esp)            #(#xf7 #xc4 #x0f #x00 #x00 #x00))
    ((:test 15 :rsp)            #(#x48 #xf7 #xc4 #x0f #x00 #x00 #x00))
    ((:testq #x100 (6 :rax))    #(#x48 #xf7 #x40 #x06 #x00 #x01 #x00 #x00))
    ((:cmpq #x1c6 (6 :rax))     #(#x48 #x81 #x78 #x06 #xc6 #x01 #x00 #x00))
    ((:mov :edi :eax)           #(#x89 #xf8))
    ((:mov (7 :rax) :rax)       #(#x48 #x8b #x40 #x07))
    ((:mov (7 :r11) :rax)	#(#x49 #x8b #x43 #x07))
    ((:mov (7 :r11) :r11)       #(#x4d #x8b #x5b #x07))
    ((:mov (7 :rax) :r11)       #(#x4c #x8b #x58 #x07))
    ((:mov (#x8e :rax) :rax)	#(#x48 #x8b #x80 #x8e #x00 #x00 #x00))
    ((:mov (#x8e :r11) :rax)    #(#x49 #x8b #x83 #x8e #x00 #x00 #x00))
    ((:mov (#x8e :r11) :r11)    #(#x4d #x8b #x9b #x8e #x00 #x00 #x00))
    ((:mov (#x8e :rax) :r11)    #(#x4c #x8b #x98 #x8e #x00 #x00 #x00))
    ((:mov :rax (7 :rax))       #(#x48 #x89 #x40 #x07))
    ((:mov :rax (7 :r11))	#(#x49 #x89 #x43 #x07))
    ((:mov :r11 (7 :r11))	#(#x4d #x89 #x5b #x07))
    ((:mov :r11 (7 :rax))	#(#x4c #x89 #x58 #x07))
    ((:mov :rax (#x8e :rax))	#(#x48 #x89 #x80 #x8e #x00 #x00 #x00))
    ((:mov :rax	(#x8e :r11))    #(#x49 #x89 #x83 #x8e #x00 #x00 #x00))
    ((:mov :r11 (#x8e :r11))	#(#x4d #x89 #x9b #x8e #x00 #x00 #x00))
    ((:mov :r11 (#x8e :rax))	#(#x4c #x89 #x98 #x8e #x00 #x00 #x00))
    ((:mov (:rax) :rax)         #(#x48 #x8b #x00))
    ((:mov (:rcx) :rcx)         #(#x48 #x8b #x09))
    ((:mov (:rdx) :rdx)         #(#x48 #x8b #x12))
    ((:mov (:rbx) :rbx)         #(#x48 #x8b #x1b))
    ((:mov (0 :rbx) :rbx)       #(#x48 #x8b #x1b))
    ((:mov (:rdi) :rax)         #(#x48 #x8b #x07))
    ((:mov (0 :rdi) :rax)       #(#x48 #x8b #x07))
    ((:mov (:rdi) :rdi)         #(#x48 #x8b #x3f))
    ((:mov (0 :rdi) :rdi)       #(#x48 #x8b #x3f))
    ((:mov (0 :rsi) :rax)       #(#x48 #x8b #x06))
    ((:mov (:rsi) :rax)         #(#x48 #x8b #x06))
    ((:mov (:r11) :rax)         #(#x49 #x8b #x03))
    ((:mov (:r11) :r8)          #(#x4d #x8b #x03))
    ((:mov (:rax) :r11)         #(#x4c #x8b #x18))
    ((:mov (:r11) :r11)         #(#x4d #x8b #x1b))
    ((:mov :r13 :rax)           #(#x4c #x89 #xe8))
    ((:mov :rax (:rdi))         #(#x48 #x89 #x07))
    ((:mov :rbx (:rdi))         #(#x48 #x89 #x1f))
    ((:mov :rax (:rsp))         #(#x48 #x89 #x04 #x24))
    ((:mov :rcx (:rax))         #(#x48 #x89 #x08))
    ((:mov :rdx (:rax))         #(#x48 #x89 #x10))
    ((:mov :rcx (:rcx))         #(#x48 #x89 #x09))
    ((:mov :rcx (0 :rcx))       #(#x48 #x89 #x09))
    ((:mov :rcx (4 :rcx))       #(#x48 #x89 #x49 #x04))
    ((:mov :rax (:rsp))         #(#x48 #x89 #x04 #x24))
    ((:mov :rax (0 :rsp))       #(#x48 #x89 #x04 #x24))
    ((:mov :rax (8 :rsp))       #(#x48 #x89 #x44 #x24 #x08))
    ((:mov :r12 (-8 :rsp))      #(#x4c #x89 #x64 #x24 #xf8))
    ((:mov (-8 :rsp) :r12)      #(#x4c #x8b #x64 #x24 #xf8))
    ((:mov 3 :edi)              #(#xbf #x03 #x00 #x00 #x00))
    ((:mov 3 :rdi)              #(#x48 #xc7 #xc7 #x03 #x00 #x00 #x00))
    ;; (sys:value-to-ub64 most-positive-fixnum)
    ((:mov 9223372036854775804 :rax)
                                #(#x48 #xb8 #xfc #xff #xff #xff #xff #xff #xff #x7f))
    ((:mov 9223372036854775804 :r13)
                                #(#x49 #xbd #xfc #xff #xff #xff #xff #xff #xff #x7f))
    ;; (sys:value-to-ub64 most-positive-fixnum)
    ((:mov 9223372036854775808 :rax)
                                #(#x48 #xb8 #x00 #x00 #x00 #x00 #x00 #x00 #x00 #x80))
    ((:mov 9223372036854775808
           :r13)                #(#x49 #xbd #x00 #x00 #x00 #x00 #x00 #x00 #x00 #x80))
    ((:mov (#x1e :rdx) :al)     #(#x8a #x42 #x1e))
    ((:mov (#x1e :rdx) :ax)     #(#x66 #x8b #x42 #x1e))
    ((:mov (#x1e :rdx) :eax)    #(#x8b #x42 #x1e))
    ((:push (-12 :rbp))         #(#xff #x75 #xf4))
    ((:push (8 :rbp))           #(#xff #x75 #x08))
    ((:push (132 :rbp))         #(#xff #xb5 #x84 #x00 #x00 #x00))
    ((:push (-132 :rbp))        #(#xff #xb5 #x7c #xff #xff #xff))
    ((:cmp :rdx :rax)           #(#x48 #x39 #xd0))
    ((:cmp :rdx :rcx)           #(#x48 #x39 #xd1))
    ((:cmp #x12345678 :rax)     #(#x48 #x3d #x78 #x56 #x34 #x12))
    ((:cmp #x12345678 :rdi)     #(#x48 #x81 #xff #x78 #x56 #x34 #x12))
    ((:and 7 :eax)              #(#x83 #xe0 #x07))
    ((:and #x100 :rax)          #(#x48 #x25 #x00 #x01 #x00 #x00))
    ((:cmp 7 :eax)              #(#x83 #xf8 #x07))
    ((:cmp 7 :esi)              #(#x83 #xfe #x07))
    ((:cmp 7 :edi)              #(#x83 #xff #x07))
    ((:and :rdx :rax)           #(#x48 #x21 #xd0))
    ((:mov 4 :rsi)              #(#x48 #xc7 #xc6 #x04 #x00 #x00 #x00))
    ((:mov 4 :r13)              #(#x49 #xc7 #xc5 #x04 #x00 #x00 #x00))
    ((:and 7 :al)               #(#x24 #x07))
    ((:and #xfc :al)            #(#x24 #xfc))
    ((:and 7 :cl)               #(#x80 #xe1 #x07))
    ((:and 7 :dl)               #(#x80 #xe2 #x07))
    ((:and 7 :bl)               #(#x80 #xe3 #x07))
    ((:and 7 :spl)              #(#x40 #x80 #xe4 #x07))
    ((:and 7 :bpl)              #(#x40 #x80 #xe5 #x07))
    ((:and 7 :sil)              #(#x40 #x80 #xe6 #x07))
    ((:and 7 :dil)              #(#x40 #x80 #xe7 #x07))
    ((:cmp 1 :al)               #(#x3c #x01))
    ((:cmp 1 :cl)               #(#x80 #xf9 #x01))
    ((:cmp 1 :dl)               #(#x80 #xfa #x01))
    ((:cmp 1 :bl)               #(#x80 #xfb #x01))
    ((:cmp 1 :spl)              #(#x40 #x80 #xfc #x01))
    ((:cmp 1 :bpl)              #(#x40 #x80 #xfd #x01))
    ((:cmp 1 :sil)              #(#x40 #x80 #xfe #x01))
    ((:cmp 1 :dil)              #(#x40 #x80 #xff #x01))
    ((:cmp :rdx (#x0e :rax))    #(#x48 #x39 #x50 #x0e))
    ((:cmp :rax (#x0e :rdx))    #(#x48 #x39 #x42 #x0e))
    ((:lea (#x58 :rax) :rax)    #(#x48 #x8d #x40 #x58))
    ((:lea (#x58 :r12) :rax)    #(#x49 #x8d #x44 #x24 #x58))
    ((:mov :rax (:r11))         #(#x49 #x89 #x03))
    ((:mov (-8 :rbp) :r11)      #(#x4c #x8b #x5d #xf8))
    ((:mov (-256 :rbp) :r8)     #(#x4c #x8b #x85 #x00 #xff #xff #xff))
    ((:mov (8 :r11) :r11)       #(#x4d #x8b #x5b #x08))
    ((:mov (48 :r12) :rax)      #(#x49 #x8b #x44 #x24 #x30))
    ((:mov :rax (72 :r12))      #(#x49 #x89 #x44 #x24 #x48))
    ((:mov :rdx (80 :r12))      #(#x49 #x89 #x54 #x24 #x50))
    ((:mov :cl (:rax))          #(#x88 #x08))
    ((:mov :al (:rcx))          #(#x88 #x01))
    ((:mov :al (:rdx))          #(#x88 #x02))
    ((:mov :bl (:rax))          #(#x88 #x18))
    ((:mov :al :dl)             #(#x88 #xc2))
    ((:mov :dl :al)             #(#x88 #xd0))
    ((:mov (#x1e :rax :rdx 4) :eax)
                                #(#x8b #x44 #x90 #x1e))
    ((:movb 2 (64 :r12))        #(#x41 #xc6 #x44 #x24 #x40 #x02))
    ((:movb (#x50 :r12) :cl)    #(#x41 #x8a #x4c #x24 #x50))
    ((:movzbl :al :eax)         #(#x0f #xb6 #xc0))
    ((:movzbl :al :edx)         #(#x0f #xb6 #xd0))
    ((:movzbl (#x1e :rax :rdx) :eax)
                                #(#x0f #xb6 #x44 #x10 #x1e))
    ((:movzwl (#x1e :rax :rdx 2) :eax)
                                #(#x0f #xb7 #x44 #x50 #x1e))
    ((:movq -1 (8 :rsp))        #(#x48 #xc7 #x44 #x24 #x08 #xff #xff #xff #xff))
    ((:movq -1 (8 :rax))        #(#x48 #xc7 #x40 #x08 #xff #xff #xff #xff))
    ((:movq -1 (0 :rsp))        #(#x48 #xc7 #x04 #x24 #xff #xff #xff #xff))
    ((:movq -1 (:rsp))          #(#x48 #xc7 #x04 #x24 #xff #xff #xff #xff))
    ((:movq -1 (0 :rax))        #(#x48 #xc7 #x00 #xff #xff #xff #xff))
    ((:movq -1 (:rax))          #(#x48 #xc7 #x00 #xff #xff #xff #xff))
    ((:neg :rax)                #(#x48 #xf7 #xd8))
    ((:neg :rcx)                #(#x48 #xf7 #xd9))
    ((:not :rax)                #(#x48 #xf7 #xd0))
    ((:sar :rax)                #(#x48 #xd1 #xf8))
    ((:sar 1 :rax)              #(#x48 #xd1 #xf8))
    ((:sar 2 :rax)              #(#x48 #xc1 #xf8 #x02))
    ((:sar 3 :rax)              #(#x48 #xc1 #xf8 #x03))
    ((:sar 2 :rdx)              #(#x48 #xc1 #xfa #x02))
    ((:sar :cl :rax)            #(#x48 #xd3 #xf8))
    ((:sar :cl :rdx)            #(#x48 #xd3 #xfa))
    ((:sar :cl :r11)            #(#x49 #xd3 #xfb))
    ((:shl :eax)                #(#xd1 #xe0))
    ((:shl 1 :eax)              #(#xd1 #xe0))
    ((:shl 2 :eax)              #(#xc1 #xe0 #x02))
    ((:shl :rax)                #(#x48 #xd1 #xe0))
    ((:shl 1 :rax)              #(#x48 #xd1 #xe0))
    ((:shl :rdx)                #(#x48 #xd1 #xe2))
    ((:shl 1 :rdx)              #(#x48 #xd1 #xe2))
    ((:shl 3 :rax)              #(#x48 #xc1 #xe0 #x03))
    ((:shl 2 :rdx)              #(#x48 #xc1 #xe2 #x02))
    ((:shl 2 :r11)              #(#x49 #xc1 #xe3 #x02))
    ((:shl :cl :eax)            #(#xd3 #xe0))
    ((:shl :cl :rax)            #(#x48 #xd3 #xe0))
    ((:shl :cl :rdx)            #(#x48 #xd3 #xe2))
    ((:shl :cl :r11)            #(#x49 #xd3 #xe3))
    ((:shr 2 :rdx)              #(#x48 #xc1 #xea #x02))
    ((:shr 2 :r11)              #(#x49 #xc1 #xeb #x02))
    ((:shr :eax)                #(#xd1 #xe8))
    ((:shr 1 :eax)              #(#xd1 #xe8))
    ((:shr 2 :eax)              #(#xc1 #xe8 #x02))
    ((:shr :rax)                #(#x48 #xd1 #xe8))
    ((:shr 1 :rax)              #(#x48 #xd1 #xe8))
    ((:shr 2 :rax)              #(#x48 #xc1 #xe8 #x02))
    ((:shr :cl :rax)            #(#x48 #xd3 #xe8))
    ((:shr :cl :rdx)            #(#x48 #xd3 #xea))
    ((:shr :cl :r11)            #(#x49 #xd3 #xeb))
    ((:xor :eax :eax)           #(#x31 #xc0))
    ((:xor :rax :rax)           #(#x48 #x31 #xc0))
    ((:xor :rdx :rdx)           #(#x48 #x31 #xd2))
    ((:xor :rax :rdx)           #(#x48 #x31 #xc2))
    ((:xor :rdx :rax)           #(#x48 #x31 #xd0))
    ((:setne :al)               #(#x0f #x95 #xc0))
    ((:setb :al)                #(#x0f #x92 #xc0))
    ((:bt :rax (#x1e :rdi))     #(#x48 #x0f #xa3 #x47 #x1e))
    ((:bt :rsi (#x1e :rdi))     #(#x48 #x0f #xa3 #x77 #x1e))
    ((:bts :rsi (#x1e :rdi))    #(#x48 #x0f #xab #x77 #x1e))
    ((:btr :rsi (#x1e :rdi))    #(#x48 #x0f #xb3 #x77 #x1e))
    ((:ret)                     #(#xc3))
    ))

(dolist (pair *tests*)
  (let ((form (first pair)))
    (format t "~S~%" form)
    (let ((actual (assemble form))
          (expected (second pair)))
      (unless (equalp actual expected)
        (let ((*print-base* 16))
          (format t "actual = ~S expected = ~S~%" actual expected)
          (error "Error!"))))))
