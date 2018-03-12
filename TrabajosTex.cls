\ProvidesClass{TrabajosTex}[2018/03/05 v1 TrabajosClass]

\LoadClass[pdftex, a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[spanish]{babel}
\usepackage{graphicx}
\usepackage{wrapfig}
\usepackage{listings}
\usepackage{lipsum}
\usepackage{xparse}
\usepackage{empheq}


% ==================================================================================
% Tipos
% ==================================================================================
\usepackage[light,condensed,math]{kurier}


% ==================================================================================
%  Símbolos matemáticos
% ==================================================================================

\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amsthm}

\def\N{\ensuremath{\mathbb{N}}}
\def\Z{\ensuremath{\mathbb{Z}}}
\def\Q{\ensuremath{\mathbb{Q}}}
\def\R{\ensuremath{\mathbb{R}}}
\def\C{\ensuremath{\mathbb{C}}}


% ==================================================================================
%  Colores
% ==================================================================================

\usepackage[pdftex]{xcolor}

\definecolor{azulUCA}{cmyk}{1.00, 0.00, 0.00, 0.51}
\definecolor{naranjaUCA}{cmyk}{0.00, 0.51, 1.00, 0.00}
\definecolor{grisUCA}{cmyk}{0.00, 0.00, 0.00, 0.65}
\definecolor{charcoal}{rgb}{0.21, 0.27, 0.31}
\definecolor{darkjose}{HTML}{4a4a4a}
% ==================================================================================
%  Diseño del documento
% ==================================================================================

\usepackage[paperwidth=180mm, paperheight=250mm, top=30mm, bottom=40mm, inner=25mm, outer=20mm]{geometry}

\parskip 5pt

\usepackage[pagestyles]{titlesec}
\titleformat{\chapter}[display]%
{\huge\bfseries}%
{\color{azulUCA}\usefont{T1}{put}{b}{n}\fontsize{70}{80}\selectfont\filleft\thechapter}%
{-60pt}%
{\color{grisUCA}}[\color{grisUCA}]
\usepackage{scrpage2}
\pagestyle{scrheadings}

\clearscrheadfoot                 % deletes header/footer
\pagestyle{scrheadings}           % use following definitions
\cofoot[\pagemark]{\pagemark}     % odd   page, center position
\rohead{\color{grisUCA}{\@author}}
% ==================================================================================
%  Algunos diseños
% ==================================================================================
\usepackage{epigraph}

\def\raya{
	\par \hbox to
	\linewidth{\hss \vrule width \textwidth height 0.2pt depth 0.5pt}
	\par}

\makeatletter

\usepackage[theorems,breakable]{tcolorbox}

\tcbuselibrary{theorems}


% ==================================================================================
%  Definiciones
% ==================================================================================

\makeatletter

\let\oldquote\quote
\let\endoldquote\endquote

\RenewDocumentEnvironment{quote}{om}
{\oldquote}
{\par\nobreak\smallskip
	\hfill(#2\IfValueT{#1}{~---~#1})\endoldquote 
	\addvspace{\bigskipamount}}


\def\cita#1{\gdef\@cita{#1}}
\def\autorcita#1{\gdef\@autorcita{#1}}

\autorcita{ }
\def\@maketitle{
	\begin{center}
		\LARGE{\color{azulUCA}{\@title}}
	\end{center}

	\ifx\@cita\@emptyauthor

	\else% \author is supplied
		\raya
		
		\begin{quote}{\@autorcita}
			\color{charcoal}{\@cita}
		\end{quote}
		\raya
	\fi
	
	\normalsize
	
	\newpage
}
\makeatother

\usepackage{hyperref}
\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=black
}

\usepackage{titlesec}

\titleformat*{\section}{\LARGE\color{azulUCA}}
\titleformat*{\subsection}{\Large\color{charcoal}}


\setlength{\parindent}{0cm}


% Cajas para ejercicios

\definecolor{myblue}{rgb}{.8, .8, 1}

\newlength\mytemplen
\newsavebox\mytempbox

\makeatletter
\newcommand\mybluebox{%
	\@ifnextchar[%]
	{\@mybluebox}%
	{\@mybluebox[0pt]}}

\def\@mybluebox[#1]{%
	\@ifnextchar[%]
	{\@@mybluebox[#1]}%
	{\@@mybluebox[#1][0pt]}}

\def\@@mybluebox[#1][#2]#3{
	\sbox\mytempbox{#3}%
	\mytemplen\ht\mytempbox
	\advance\mytemplen #1\relax
	\ht\mytempbox\mytemplen
	\mytemplen\dp\mytempbox
	\advance\mytemplen #2\relax
	\dp\mytempbox\mytemplen
	\colorbox{myblue}{\hspace{1em}\usebox{\mytempbox}\hspace{1em}}}

\makeatother


\usepackage{listings}
\lstloadlanguages{[5.2]Mathematica}

