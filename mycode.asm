

org 100h 

.model large
.stack 1000h
.data

; Welcome page
a1 db 10,13,'      ***********************$'
a2 db 10,13,'      **      WELCOME        **$'
a3 db 10,13,'      **         TO          **$'
a4 db 10,13,'      **       ONLINE BOOK   **$'
a5 db 10,13,'      **          SHOP       **$'
a6 db 10,13,'      ***********************$'

; choose
a7 db 10,13,'      Books List----$'
a8 db 10,13,'      Enter Your Choice :$'
a19 db 10,13,'           Enter 1 to Display Books List: $'
a34 db 10,13,'              Pick Your Book: $'
a35 db 10,13,'              Enter Quantity: $'
a36 db 10,13,'         Invalid Input !! Rerun the Program $'
a37 db 10,13,'         Total Price: $'
a38 db 10,13,'      1.Books List: $'
a39 db 10,13,'      2.Exit: $'     

   
a40 db 10,13,'           Enter 2 to Add a New Book: $'

; Book List 
a9 db 10,13,'          1.English Novels$'
a10 db 10,13,'         2.Urdu Novels$'
a11 db 10,13,'         3.Islamic Books$'

; English Novels list
a12 db 10,13,'     ******** English Novels List     ********$'
a13 db 10,13,'            1.Weathering Heights 50/-$'
a14 db 10,13,'            2.Middle March 50/-$'
a15 db 10,13,'            3.Nineteen EightyFour 50/-$'
a16 db 10,13,'            4.The Lord of the Rings 50/-$'
a17 db 10,13,'            5.Diary of a Nobody 50/-$'
a18 db 10,13,'            6.His Dark Materials 50/-$'

; Urdu Novels list
a20 db 10,13,'     ******** Urdu Novels List     ********$'
a21 db 10,13,'            1.Jannat Ke Pattay 100/-$'
a22 db 10,13,'            2.Laa Haasil 100/-$'
a23 db 10,13,'            3.Aangan 100/-$'
a24 db 10,13,'            4.Peer e Kamil 100/-$'
a25 db 10,13,'            5.Mushaf 100/-$'
a26 db 10,13,'            6.Mujh Jesa 100/-$'

; Islamic Books List
a27 db 10,13,'    ******** Islamic Books List     ********$'
a28 db 10,13,'            1.Minhaj ul Muslim 200/-$'
a29 db 10,13,'            2.Mairaaj e Momin 200/-$'
a30 db 10,13,'            3.Tafseer ul Quran 200/-$'
a31 db 10,13,'            4.Qasasul Anbiya 200/-$'
a32 db 10,13,'            5.Tib e Nabwi 200/-$'
a33 db 10,13,'            6.Riyad ul Saliheen 200/-$' 



NewBookEnglish db 10,13, 'Enter the name of the new English novel: $'
NewBookUrdu db 10,13, 'Enter the name of the new English novel: $'
NewBookIslamic db 10,13, 'Enter the name of the new English novel: $'


 


.code
main proc
    mov ax, @data
    mov ds, ax  
    
      mov ah, 9          
    lea dx, NewBookEnglish 
    int 21h
    
      mov ah, 9           
    lea dx, NewBookUrdu 
    int 21h
    
      mov ah, 9           ; DOS interrupt for displaying a string
    lea dx, NewBookIslamic ; Load the address of NewBookEnglish into dx
    int 21h 

; Display welcome message
    mov ah, 9
    mov dx, offset a1
    int 21h
    mov dx, offset a2
    int 21h
    mov dx, offset a3
    int 21h
    mov dx, offset a4
    int 21h
    mov dx, offset a5
    int 21h
    mov dx, offset a6
    int 21h

;new line
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

;take input to start
mov ah,9
mov dx,offset a19
int 21h
mov ah,1
int 21h
mov bh,al
sub bh,48  

cmp bh,1
je Booklist 
cmp bh,2
je AddBook
jmp Invalid

Booklist:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah, 9
    mov dx, offset a7
    int 21h
    mov dx, offset a9
    int 21h
    mov dx, offset a10
    int 21h
    mov dx, offset a11
    int 21h

; Ask for book category choice
    mov dx, offset a8
    int 21h 
    
    mov ah, 1
    int 21h
    mov bh, al
    sub bh, 48

    cmp bh, 1
    je EnglishNovels
    
    cmp bh, 2
    je UrduNovels
    
    cmp bh, 3
    je  IslamicBooks
    
    jmp Invalid    
    
    mov ah,9
    mov dx,offset a19
    int 21h
    mov dx,offset a40
    int 21h
    mov ah,1
    int 21h
    mov bh,al
    sub bh,48  

cmp bh,1
je Booklist
cmp bh,2
je AddBook
jmp Invalid

EnglishNovels: 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h



    mov ah, 9
    mov dx, offset a12
    int 21h
 

    mov dx, offset a13
    int 21h
    mov dx, offset a14
    int 21h
    mov dx, offset a15
    int 21h
    mov dx, offset a16
    int 21h
    mov dx, offset a17
    int 21h
    mov dx, offset a18
    int 21h 
    
    
    mov dx,offset a34
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,48
    
    cmp bl,1
    je fifty   
    
    cmp bl,2
    je fifty
    
    cmp bl,3
    je fifty
    
    cmp bl,4
    je fifty  
    
    cmp bl,5
    je fifty
        
    cmp bl,6
    je fifty    
              
    jmp Invalid          
; Ask for book selection


UrduNovels:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah, 9
    mov dx, offset a20
    int 21h
    

    
    mov dx, offset a21
    int 21h
    mov dx, offset a22
    int 21h
    mov dx, offset a23
    int 21h
    mov dx, offset a24
    int 21h
    mov dx, offset a25
    int 21h
    mov dx, offset a26
    int 21h 
    
    
    mov dx, offset a34
    int 21h
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 48 
    
    cmp bl, 1
    je Hundred
    cmp bl, 2
    je Hundred
    cmp bl, 3
    je Hundred
    cmp bl, 4
    je Hundred
    cmp bl, 5
    je Hundred
    cmp bl, 6
    je Hundred
    jmp Invalid 
          
    ; for exit      
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    mov dx,offset a38
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bh,1
    jmp Exit
    



IslamicBooks: 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    mov ah, 9
    mov dx, offset a27
    int 21h
    
 
    
    mov dx, offset a28
    int 21h
    mov dx, offset a29
    int 21h
    mov dx, offset a30
    int 21h
    mov dx, offset a31
    int 21h
    mov dx, offset a32
    int 21h
    mov dx,offset a33
    int 21h             

    mov dx, offset a34
    int 21h
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 48
    
    cmp bl, 1
    je TwoHundred
    cmp bl, 2
    je TwoHundred
    cmp bl, 3
    je TwoHundred
    cmp bl, 4
    je TwoHundred
    cmp bl, 5
    je TwoHundred
    cmp bl, 6
    je TwoHundred 
    
    jmp Invalid

fifty:
    mov bl,5
    mov dx,offset a35
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    mul bl 
    
    aam 
    
    mov cx,ax
    add ch,48
    add cl,48
    
    
    mov dx,offset a37
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    mov dl,cl
    int 21h
    
    mov dl,'0'
    int 21h
    
    mov dl,47
    int 21h
    mov dl,45
    int 21h  
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    mov dx,offset a38
    int 21h
    
    mov ah,9
    mov dx,offset a39
    int 21h
    
    mov  ah,9
    mov  dx,offset a8
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    cmp al,1
    je Booklist
    
    cmp al,2
    je Exit        
              
Hundred:
    mov bl,10
    mov dx,offset a35
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    mul bl 
    
    aam 
    
    mov cx,ax
    add ch,48
    add cl,48
    
    
    mov dx,offset a37
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    mov dl,cl
    int 21h
    
    mov dl,'0'
    int 21h
    
    mov dl,47
    int 21h
    mov dl,45
    int 21h  
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov  ah,9
    mov  dx,offset a38
    int 21h
    
    mov  ah,9
    mov  dx,offset a39
    int 21h
    
    mov  ah,9
    mov  dx,offset a8
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    cmp al,1
    je Booklist
    
    cmp al,2
    je Exit 
    
    jmp Invalid     
    

TwoHundred:
    mov bl,20
    mov dx,offset a35
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    mul bl 
    
    aam 
    
    mov cx,ax
    add ch,48
    add cl,48
    
    
    mov dx,offset a37
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    mov dl,cl
    int 21h
    
    mov dl,'0'
    int 21h
    
    mov dl,47
    int 21h
    mov dl,45
    int 21h  
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov  ah,9
    mov  dx,offset a38
    int 21h
    
    mov  ah,9
    mov  dx,offset a39
    int 21h
    
    mov  ah,9
    mov  dx,offset a8
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    cmp al,1
    je Booklist
    
    cmp al,2
    je Exit 
    
    jmp Invalid  
AddBook:
   
    mov ah, 9
    mov dx, offset a8
    int 21h
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 48

    cmp bl, 1
    je AddToEnglish
    cmp bl, 2
    je AddToUrdu
    cmp bl, 3
    je AddToIslamic
    jmp Invalid

AddToEnglish:
    mov dx, offset a12
    int 21h
    mov dx, offset a34
    int 21h

    mov ah, 9
    mov dx, offset a8
    int 21h
    lea dx, NewBookEnglish
    mov ah, 0Ah
    int 21h


    mov ah, 9
    mov dx, offset NewBookEnglish
    int 21h
    jmp Booklist

AddToUrdu:
      mov dx, offset a12
    int 21h
    mov dx, offset a34
    int 21h

    mov ah, 9
    mov dx, offset a8
    int 21h
    lea dx, NewBookUrdu
    mov ah, 0Ah
    int 21h


    mov ah, 9
    mov dx, offset NewBookUrdu
    int 21h
    jmp Booklist

AddToIslamic:  
     mov dx, offset a12
    int 21h
    mov dx, offset a34
    int 21h


    mov ah, 9
    mov dx, offset a8
    int 21h
    lea dx, NewBookIslamic
    mov ah, 0Ah
    int 21h

    mov ah, 9
    mov dx, offset NewBookIslamic
    int 21h

    jmp Booklist
     
           
              
Invalid: 

    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    mov dx,offset a36
    int 21h
    jmp Exit
    
Exit:
    mov ah,4ch
    int 21h
    main endp    
end main 

              
              

                                             

                                                          
               