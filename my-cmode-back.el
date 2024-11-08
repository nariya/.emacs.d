    (c-offsets-alist . (
			 
			 (string                . c-lineup-dont-change) ;;•ÿÿ”s‚ÿÿÿÿÿÿÿÿÿÿ¶š—ÿÿB  
			 (c                     . c-lineup-C-comments);;•ÿÿ”s‚ÿÿÿÿÿÿÿÿÿÿ—l®‚ÿÿuƒƒbƒNƒRƒƒ“ƒgB  
			 ) "Myr Programming Style") ;; ƒXƒ^ƒCƒ‹–ÿÿ


			 (defun-open            . 0);;Šÿÿ”’ÿÿ`‚ÿÿJ‚ÿÿ†ƒJƒbƒRB  
			 (defun-close           . 0);;Šÿÿ”’ÿÿ`‚ÿÿÿÿÿÿÿÿ†ƒJƒbƒRB  
			 (defun-block-intro     . +);;ÿÿÿÿÿÿefun‚ÿÿÿÿ‰‚ÿÿsB  
			 (class-open            . 0);;ƒNƒ‰ƒX’ÿÿ`‚ÿÿJ‚ÿÿ†ƒJƒbƒRB  
			 (class-close           . 0);;ƒNƒ‰ƒX’ÿÿ`‚ÿÿÿÿÿÿÿÿ†ƒJƒbƒRB  
			 
			 
;			 (inline-open           . +);ƒNƒ‰ƒX“ÿÿCƒ“ƒ‰ƒCƒ“ƒƒ\ƒbƒh‚ÿÿJ‚ÿÿ†ƒJƒbƒRB  
			 (inline-open           . 0);ƒNƒ‰ƒX“ÿÿCƒ“ƒ‰ƒCƒ“ƒƒ\ƒbƒh‚ÿÿJ‚ÿÿ†ƒJƒbƒRB  
			 (inline-close          . 0);ƒNƒ‰ƒX“ÿÿCƒ“ƒ‰ƒCƒ“ƒƒ\ƒbƒh‚ÿÿÿÿÿÿÿÿ†ƒJƒbƒRB  
			 
			 
;			 (func-decl-cont        . +);Šÿÿ”’ÿÿ`‚ÿÿÿÿ”ƒŠƒXƒg‚ÿÿÿÿÿÿÿÿÿÿÿÿefun‚ÿÿJ‚ÿÿ†ƒJƒbƒR(K&RŠÿÿ”’ÿÿ`‚ÿÿœ‚ÿÿB C‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿ’‚ÿÿRƒƒ“ƒgˆÿÿO‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿBC++‚ÿÿava‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿhrowsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿB 
			 (func-decl-cont 	. c-lineup-java-throws)
;			 (knr-argdecl-intro     . +) ;K&R‚ÿÿˆÿÿ”’ÿÿ`‚ÿÿÿÿ‰‚ÿÿsB 
			 (knr-argdecl-intro     . -) ;K&R‚ÿÿˆÿÿ”’ÿÿ`‚ÿÿÿÿ‰‚ÿÿsB 
			 (knr-argdecl           . 0);K&R‚ÿÿˆÿÿ”’ÿÿ`‚ÿÿÿÿÿÿÿÿsB  
			 (topmost-intro         . 0);ÿÿÿÿÿÿÿÿ\ÿÿv‘f’ÿÿ`‚ÿÿÿÿ‰‚ÿÿsB  
			 (topmost-intro-cont    . 0);ÿÿÿÿÿÿÿÿÿÿ`‚ÿÿp‘ÿÿsB  
			 (member-init-intro     . +); ƒƒ“ƒo‰ŠÿÿÿÿŠƒXƒg‚ÿÿÿÿ‰‚ÿÿsB  
			 (member-init-cont      . 0); ƒƒ“ƒo‰ŠÿÿÿÿŠƒXƒg‚ÿÿp‘ÿÿsB  
			 (inher-intro           . +); ‘ÿÿdŒpÿÿŠƒXƒg‚ÿÿÿÿ‰‚ÿÿsB  
;			 (inher-cont            . c-lineup-multi-inher) ; ‘ÿÿdŒpÿÿÿÿp‘ÿÿsB  
			 (inher-cont     	. c-lineup-java-inher)


			 (block-open            . -); ƒXƒe[ƒgƒƒ“ƒgƒuƒƒbƒN‚ÿÿJ‚ÿÿ†ƒJƒbƒRB  
			 (block-close           . 0); ƒXƒe[ƒgƒƒ“ƒgƒuƒƒbƒN‚ÿÿÿÿÿÿÿÿ†ƒJƒbƒRB  
			 (brace-list-open       . 0);enum‚ÿÿtatic”z—ÿÿŠƒXƒg‚ÿÿJ‚ÿÿ†ƒJƒbƒRB  
			 (brace-list-close      . 0); enum‚ÿÿtatic”z—ÿÿŠƒXƒg‚ÿÿÿÿÿÿ†ƒJƒbƒRB  
			 (brace-list-intro      . +); enum‚ÿÿtatic”z—ÿÿŠƒXƒg‚ÿÿÿÿ‰‚ÿÿsB  
			 (brace-list-entry      . 0); enum‚ÿÿtatic”z—ÿÿŠƒXƒg‚ÿÿp‘ÿÿsB  
			 (brace-entry-open      . 0); ŠJ‚ÿÿ‡ŒÿÿÅn‚ÿÿÿÿenum‚ÿÿtatic ”z—ÿÿÿÿp‘ÿÿs
			 (statement             . 0); •’ÿÿÿÿXƒe[ƒgƒƒ“ƒgB 
			 ;; some people might prefer
			 ;;(statement             . c-lineup-runin-statements)
			 (statement-cont        . +); ƒXƒe[ƒgƒƒ“ƒg‚ÿÿp‘ÿÿsB 
			 ;; some people might prefer
			 ;;(statement-cont        . c-lineup-math)
			 
			 
			 
			 (statement-block-intro . +);V‚ÿÿÿÿXƒe[ƒgƒƒ“ƒgƒuƒƒbƒNÿÿÿÿÿÿ‰‚ÿÿsB  
			 (statement-case-intro  . +); case"ƒuƒƒbƒN"’†‚ÿÿÿÿ‰‚ÿÿsB  
			 (statement-case-open   . 0); ’†ƒJƒbƒR‚Ån‚ÿÿÿÿaseƒuƒƒbƒN’†‚ÿÿÿÿ‰‚ÿÿsB  
			 (substatement          . +); if, while, for, do, else‚ÿÿÿÿÿÿÿÿ‰‚ÿÿsB  
			 (substatement-open     . +); substatementƒuƒƒbƒN‚ÿÿJ‚ÿÿ†ƒJƒbƒRB  
			 (case-label            . 0); case‚ÿÿefaultƒ‰ƒxƒ‹B  
			 (access-label          . -); C++‚ÿÿrivate, protected, publicƒAƒNƒZƒXÿÿÿÿ‰ƒxƒ‹B  
			 (label                 . 2); •’ÿÿÿÿ‰ƒxƒ‹B 
			 (do-while-closure      . 0); do-while‚ÿÿI‚ÿÿhile\ÿÿv‘fB  
			 (else-clause           . 0); if-else\ÿÿv‘f‚ÿÿlseB  
			 (catch-clause          . 0); try/catch ’†‚ÿÿ'catch' ‚ÿÿfinally'
			 (comment-intro         . c-lineup-comment) ; ƒRƒƒ“ƒg“ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿsB  
			 (arglist-intro         . +); ˆÿÿ”ƒŠƒXƒg’†‚ÿÿÿÿ‰‚ÿÿsB 
			 (arglist-cont          . 0); ˆÿÿ”ƒŠƒXƒg‚ÿÿJ‚ÿÿ†ƒJƒbƒR‚ÿÿÿÿÿÿs‚ÿÿÿÿ”‚ÿÿÿÿÿÿÿÿÿÿÿÿ¢‚ÿÿÿÿ”ƒŠƒXƒg‚ÿÿp‘ÿÿs‚ÿÿsB  
			 (arglist-cont-nonempty . c-lineup-arglist); ˆÿÿ”ƒŠƒXƒg‚ÿÿJ‚ÿÿJƒbƒR‚ÿÿÿÿÿÿs‚ÿÿÿÿÿÿŒÿÿÿÿÿÿÿÿ”‚ÿÿÿÿÿÿ½‚ÿÿÿÿ”ƒŠƒXƒg‚ÿÿp‘ÿÿs‚ÿÿsB  
;			 (arglist-close         . +) ; ˆÿÿ”ƒŠƒXƒg‚ÿÿÿÿÿÿJƒbƒRB  
 			 (arglist-close  	. c-lineup-arglist)
			 (stream-op             . c-lineup-streamop); ƒXƒgƒŠ[ƒ€ƒIƒyƒŒ[ƒ^ƒRƒ“ƒXƒgƒ‰ƒNƒ^‚ÿÿp‘ÿÿsB  
			 (inclass               . +); ƒNƒ‰ƒX’ÿÿ`’†‚ÿÿlƒXƒg‚ÿÿÿÿRƒ“ƒXƒgƒ‰ƒNƒ^B  
			 (cpp-macro             . -1000) ; cppƒ}ƒNƒ‚Ìn‚ÿÿÿÿB 
			 (cpp-macro-cont        . c-lineup-dont-change)
			 (friend                . 0); C++‚ÿÿriend’ÿÿ`B 
			 (objc-method-intro     . -1000); ƒIƒuƒWƒFƒNƒeƒBƒuC‚ÿÿƒ\ƒbƒh’ÿÿ`‚ÿÿÿÿ‰‚ÿÿsB  
			 (objc-method-args-cont . c-lineup-ObjC-method-args); ƒIƒuƒWƒFƒNƒeƒBƒuC‚ÿÿƒ\ƒbƒh’ÿÿ`‚ÿÿp‘ÿÿsB  
			 (objc-method-call-cont . c-lineup-ObjC-method-call); ƒIƒuƒWƒFƒNƒeƒBƒuC‚ÿÿƒ\ƒbƒhŒÿÿÿÿo‚ÿÿÿÿ ‚ÿÿsB  
			 (extern-lang-open      . 0); ŠO•”ŒÿÿÿÿuƒƒbƒN‚ÿÿJ‚ÿÿ†ƒJƒbƒRB  
			 (extern-lang-close     . 0); ŠO•”ŒÿÿÿÿuƒƒbƒN‚ÿÿÿÿÿÿÿÿ†ƒJƒbƒRB  
			 (inextern-lang         . +); ŠO•”ŒÿÿÿÿuƒƒbƒN‚ÿÿ†‚ÿÿlƒXƒg‚ÿÿÿÿRƒ“ƒXƒgƒ‰ƒNƒ^B  
			 (namespace-open        . 0); c++ namespace ‚ÿÿJn
			 (namespace-close       . 0); c++ namespace ‚ÿÿI—ÿÿ			 (innamespace           . +); inextern-lang‚É—‚ÿÿÿÿÿÿÿÿAnamespace—p,, 
			 (template-args-cont    . +); template ˆÿÿ”‚ÿÿp‘ÿÿs..
			 (inlambda              . c-lineup-inexpr-block); lamda Šÿÿ”‚ÿÿwƒbƒ_A‚ÿÿÿÿÿÿÿÿ†g
			 (lambda-intro-cont     . +); lambda Šÿÿ”‚ÿÿwƒbƒ_‚ÿÿp‘ÿÿs..
			 (inexpr-statement      . 0); ®‚ÿÿxpression‚ÿÿÿÿ”‚ÿÿ ‚ÿÿ
			 (inexpr-class          . +); class ‚ÿÿexpression‚ÿÿÿÿ”‚ÿÿ ‚ÿÿ
