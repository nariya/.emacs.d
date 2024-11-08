;;;コメント


(defun my-comment-1line()
  (interactive)
;  (insert "///////////////////////////////////////////////////////////////////////////////////////////////////\n")
   (insert "//=================================================================================================\n")
)


(defun my-include-global-h()
  (interactive)
;    (insert "#include <brewbase/common.h>\n\n")
  (insert "#include \"global.h\"\n")
;  (insert "#include <global.h>\n")
)




(defun my-line-comment()
  (interactive)
  (indent-according-to-mode)
  (insert "/// "))
(defun my-line-comment-thisline()
  (interactive)
  (indent-according-to-mode)
  (insert "///< "))




;;;"[.]h(p)*$"
;;;"[.]c(p)*$"
(defun my-check-c-file-type()
  (interactive)
  (let* ((name buffer-file-name) (sub_name) (file_name) (dot_pos))
    (setq file_name (file-name-nondirectory name))
	(setq dot_pos (string-match "\.c[p]*$" file_name 0))
;;;	(setq dot_pos 4)
	(if(setq dot_pos dot_pos)
		(;;C source
		 progn
		 (setq sub_name (substring file_name 0 dot_pos))
		 (my-source-comment file_name sub_name )
						  ))
	(setq dot_pos (string-match "\.h[p]*$" file_name 0))
	(if(setq dot_pos dot_pos)
		(;;Headder
		 progn
		 (setq sub_name (substring file_name 0 dot_pos))
		 (my-headder-comment file_name sub_name )
						  ))
	(setq dot_pos (string-match "\.m[m]*$" file_name 0))
	(if(setq dot_pos dot_pos)
		(;;objective-c source
		 progn
		 (setq sub_name (substring file_name 0 dot_pos))
		 (my-source-comment file_name sub_name )
						  ))
	(setq dot_pos (string-match "\.as*$" file_name 0))
	(if(setq dot_pos dot_pos)
		(;;action script (Flash)
		 progn
		 (setq sub_name (substring file_name 0 dot_pos))
		 (my-flash-comment file_name sub_name )
						   )))
  )

(defun my-comment-func()
  (interactive)

  ;;一番前に移動...
  (beginning-of-line)
  (if (string-match "class" (current-word))
	  ;;こっちはクラス用...
	  (progn
		(insert "//------------------------------------------------------------------------------\n")
		(insert "/**\n")
		(insert " * \n * \n")
		(insert " * \n")
		(insert " * @see      \n")
		(insert " * \n")
		(insert " * @version  1.0.0\n")
		(insert " * @author  : Nariya Takemura<a href=\"mailto:takemura@platinum-egg.com\">takemura@platinum-egg.com </a>\n")
		(insert " * \n")
		(insert " */\n")
		(insert "//------------------------------------------------------------------------------\n")
		(previous-line 9)
		(end-of-line)
		)
	(if(string-match "template" (current-word))
		;;こっちはtemplate用...
		(progn
		  (insert "//------------------------------------------------------------------------------\n")
		  (insert "/**\n")
		  (insert " * \n * \n")
		  (insert " * \n")
		  (insert " * @see      \n")
		  (insert " * \n")
		  (insert " * @version  1.0.0\n")
		  (insert " * @author  : Nariya Takemura<a href=\"mailto:takemura@platinum-egg.com\">takemura@platinum-egg.com </a>\n")
		  (insert " * \n")
		  (insert " */\n")
		  (insert "//------------------------------------------------------------------------------\n")
		  (previous-line 7)
		  (end-of-line)
		  )
	  ;;こっちは関数用...
	  (progn
		(insert "//------------------------------------------------------------------------------\n")
		(insert "/**\n")
		(insert " * \n * \n")
		(insert " * @return   \n")
		(insert " * @param    \n")
		(insert " * @version  1.0.0\n")
		(insert " * @author  : Nariya Takemura<a href=\"mailto:takemura@platinum-egg.com\">takemura@platinum-egg.com </a>\n")
		(insert " *\n")
		(insert " */\n")
		(insert "//------------------------------------------------------------------------------\n")
		(previous-line 8)
		(end-of-line)
		)	)))





(defun my-c-file-comment()
  (interactive)
  (my-check-c-file-type)
)


(defun my-headder-comment(file_name sub_name)

  (let* ((start_string) (end_string) (include_string))
    (setq class_string sub_name)
    (setq start_string (downcase sub_name))
    (setq start_string (substring start_string 0 2))
    (if (string-match "pl" start_string)
	(progn
	  (setq start_string "PL_NAMESPACE_BEGIN	//namespace begin")
	  (setq end_string "PL_NAMESPACE_END	//namespace end")
	  (setq include_string "#include \"plDefine.h\"\n\n"))
	(progn
	  (setq start_string "//");USE_NV_NAME_SPACE")
	  (setq include_string "//");#include <nvDefine.h>\n\n")
	  (setq end_string "//")))
    (setq sub_name (upcase sub_name))
    (setq sub_name (concat "__" sub_name "_H__"))
    
    (insert "//")
	(insert file_name)
    (insert "\n")
	(my-comment-1line)
    (insert "//What's this file?\n")
    (insert "/** \n")
    (insert " * file ")
	(insert file_name)
    (insert " : ")
	(insert (current-time-string ))
	(insert "\n")
    (insert " * \n")
	(insert " * @author  : Nariya Takemura<a href=\"mailto:takemura@platinum-egg.com\">takemura@platinum-egg.com </a>\n")
;	(insert " * @package : nvLib\n")
	(insert " * @version  1.0.0\n")
    (insert " */\n")
	(my-comment-1line)
    (insert "\n\n\n#ifndef ")
	(insert sub_name)
    (insert "\n#define ")
	(insert sub_name)
    (insert "\n")
	(my-comment-1line)
    (insert "//include\n")
	(my-include-global-h)
    (insert "\n\n\n\n#ifdef __cplusplus\n//extern \"C\" {\n#endif // __cplusplus\n")
	(insert start_string)
	(insert "\n")
	(my-comment-1line)
    (insert "//define, macro, typedef, enum\n\n")
	(my-comment-1line)
    (insert "//class\n\n")
    (insert "\n\n\n\n\n\n\n\n\n");
    (insert "class ");
    (insert class_string);
    (insert "{\n");
	(my-comment-1line)
    (insert "//method\n");
    (insert "public:\n");
    (insert "	" class_string "();\n");
    (insert "	virtual ~" class_string "();\n");
    (insert "protected:\n");
    (insert "private:\n");
    (insert "\n");
	(my-comment-1line)
    (insert "//parameter\n");
    (insert "public:\n");
    (insert "protected:\n");
    (insert "private:\n");
    (insert "\n");
    (insert "};\n");


	(insert end_string)
	(insert "\n#ifdef __cplusplus\n//}\n#endif // __cplusplus\n")
    (insert "\n\n\n\n#endif//");; & tmp1$)
	(insert sub_name)
    (insert "\n\n//File end.\n")
;    (insert "\n\n//cvs log...\n/*\n$log$\n*/")
    (previous-line 24)
))

  
(defun my-source-comment(file_name sub_name)
  (let* ((start_string) (end_string) (include_string))
    (setq start_string (downcase sub_name))
    (setq start_string (substring start_string 0 2))
    (if (string-match "pl" start_string)
	(progn
	  (setq start_string "PL_NAMESPACE_BEGIN	//namespace begin\n")
	  (setq end_string "PL_NAMESPACE_END	//namespace end\n")
	  (setq include_string "#include \"plDefine.h\"\n\n"))
	(progn
	  (setq start_string "");USE_NV_NAME_SPACE\n")
	  (setq end_string "//\n")
	  (setq include_string "\n")));"#include <nvDefine.h>\n\n")))
    ;;
    (insert "//")
	(insert file_name)
    (insert "\n")


	(my-comment-1line)
    (insert "//What's this file?\n")
    (insert "/** \n")
    (insert " * \\file ")
	(insert file_name)
    (insert " : ")
	(insert (current-time-string ))
	(insert "\n")
    (insert " * \n")
	(insert " * @author  : Nariya Takemura<a href=\"mailto:takemura@platinum-egg.com\">takemura@platinum-egg.com </a>\n")
;	(insert " * @package : nvLib\n")
	(insert " * @version  1.0.0\n")
    (insert " */\n")
	(my-comment-1line)

	(my-comment-1line)
    (insert "//include\n")
	(my-include-global-h)
    (insert "#include \"")
	(insert sub_name)
	(insert ".h\"\n\n")
	(my-comment-1line)

    (insert start_string)
	(my-comment-1line)
    (insert "//define, macro, typedef, enum\n\n")
	(my-comment-1line)
    (insert "//local class\n\n")


	(my-comment-1line)
    (insert "//classes functions\n\n")
	

	(my-comment-1line)
    (insert "//class\n\n")

    (insert "\n\n\n\n")

	(insert sub_name "::" sub_name "(){\n\n}\n\n")
	(insert sub_name "::~" sub_name "(){\n\n}\n\n")

    (insert "\n\n\n\n\n")
	(insert end_string)

	;;	(insert sub_name)
    (insert "\n\n//File end.\n//")
	(insert file_name)
    (insert "\n")
;    (insert "\n\n//cvs log...\n/*\n$log$\n*/")
    (previous-line 20)
;;    (insert name)
))

(defun my-flash-comment(file_name sub_name)
  (let* ((start_string) (end_string))
    (setq class_string sub_name)
    (setq start_string (downcase sub_name))
    (setq start_string (substring start_string 0 2))
    ;;
    (insert "/*\n")
    (insert " * $Id: my-comment.el,v 1.2 2003/11/16 13:42:13 myr Exp $ \n")
    (insert " */ \n")
	(my-comment-1line)
    (insert "//")
	(insert file_name)
    (insert "\n")


	(my-comment-1line)
    (insert "//What's this file?\n")
    (insert "/** \n")
    (insert " * \\file ")
	(insert file_name)
	(insert "\n")
    (insert " * \n")
	(insert " * @author  : Nariya Takemura<a href=\"mailto:takemura@platinum-egg.com\">takemura@platinum-egg.com </a>\n")
;	(insert " * @package : nvLib\n")
	(insert " * @version : 1.0.0\n")
    (insert " */\n")
	(insert "//trace(\"'")
	(insert file_name)
	(insert "' start..\");\n")
	(my-comment-1line)

	(my-comment-1line)
    (insert "//include\n\n")
	(my-comment-1line)

	(my-comment-1line)
    (insert "//local values\n\n")
	(my-comment-1line)


	(my-comment-1line)
    (insert "//class\n\n")
    (insert "class ");
    (insert class_string);
    (insert " extends MovieClip{\n");
	(my-comment-1line)
    (insert "//method\n");
;    (insert "	public:\n");
    (insert "	function " class_string "(){\n\n	}\n");
    (insert "\n");
	(my-comment-1line)
    (insert "};\n");

    (insert "\n\n\n\n\n\n\n\n\n")
	(insert "//trace(\"'")
	(insert file_name)
	(insert "' finished..\");")
    (insert "\n\n//File end.\n//")
	(insert file_name)
    (insert "\n")
    (previous-line 18)
	(end-of-line)
;;    (insert name)
))
