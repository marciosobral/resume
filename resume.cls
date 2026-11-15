\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/11/14 Single-column ATS resume]
\LoadClass[a4paper,10pt]{article}

\RequirePackage{fontspec}
\RequirePackage[a4paper,hmargin=1.5cm,vmargin=1cm]{geometry}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage[hidelinks]{hyperref}

% Common ligatures (fi, fl) are off so ATS text extraction keeps whole words.
\setmainfont{texgyreheros}[
  Extension=.otf,
  UprightFont=*-regular,
  BoldFont=*-bold,
  ItalicFont=*-italic,
  BoldItalicFont=*-bolditalic,
  Ligatures=NoCommon,
]

\renewcommand\normalsize{\fontsize{10pt}{12.4pt}\selectfont}
\normalsize

\definecolor{ink}{HTML}{1F1F1F}
\definecolor{meta}{HTML}{555555}
\definecolor{rule}{HTML}{BFBFBF}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
% No hyphenation: a word split across lines breaks ATS keyword matching.
\hyphenpenalty=10000
\exhyphenpenalty=10000
\AtBeginDocument{\color{ink}\raggedright}

% The phone lives in the gitignored contact.local.tex so it never reaches the public repo.
\def\resume@phone{}
\newcommand*\phone[2]{\def\resume@phone{\href{tel:#1}{#2}}}
\IfFileExists{contact.local.tex}{\input{contact.local.tex}}{}

\newcommand\contactsep{\enspace{\color{meta}·}\enspace}
\newcommand\contactlink[2]{\href{#1}{#2}}
\newcommand\contactphone{\ifx\resume@phone\@empty\else\resume@phone\contactsep\fi}

\newcommand\resumeheader[3]{%
  \hypersetup{pdftitle={#1 - #2},pdfauthor={#1}}%
  \begin{center}
    {\fontsize{22pt}{26pt}\selectfont\bfseries #1}\par
    \vspace{2pt}
    {\large #2}\par
    \vspace{4pt}
    {\small #3}\par
  \end{center}
  \vspace{-8pt}%
}

\newcommand\cvsection[1]{%
  \par\addvspace{9pt}%
  {\large\scshape #1}\par\nobreak
  \vspace{2.5pt}%
  {\color{rule}\hrule height 0.5pt}%
  % \addvspace keeps the gap under every heading equal, whatever block comes next.
  \addvspace{6pt}%
}

\newcommand\entry[4]{%
  \par\addvspace{6pt}%
  {\bfseries #1}\enspace{\color{meta}·}\enspace #2%
  \if\relax\detokenize{#3}\relax\else{\color{meta}\enspace·\enspace #3}\fi
  \hfill{\color{meta}#4}\par
}

\newcommand\entrysummary[1]{\vspace{2pt}#1\par}

\newenvironment{bullets}{%
  \begin{itemize}[leftmargin=1.1em,label={\color{meta}•},itemsep=0.5pt,parsep=0pt,topsep=2pt,partopsep=0pt]%
}{\end{itemize}}

\newlength\skilllabelwidth
\setlength\skilllabelwidth{4.8cm}
\newcommand\skill[2]{%
  \par\addvspace{1.5pt}\makebox[\skilllabelwidth][l]{\color{meta}\footnotesize #1}#2\par
}
\newcommand\sep{\enspace{\color{meta}·}\enspace}
\newcommand\rowdate[1]{\hfill{\color{meta}#1}}

\newcommand\certificate[3]{%
  \par\addvspace{2pt}{\bfseries #1}\enspace{\color{meta}·}\enspace #2\hfill{\color{meta}#3}\par
}

\newcommand\project[3]{\par\addvspace{2pt}{\bfseries\href{#2}{#1}}: #3\par}
