%
% Written by ChatGPT
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{handout}[2023/09/30 Handout Class]

\LoadClass[12pt, a4paper]{report}

% Packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{titlesec} % Added titlesec package
\RequirePackage{lipsum}

% Page Layout
\geometry{top=1in, bottom=1in, left=1in, right=1in}

% Font
\renewcommand{\rmdefault}{ptm}
\renewcommand{\sfdefault}{phv}
\renewcommand{\ttdefault}{pcr}

% Section and Chapter Formatting
\renewcommand{\chaptername}{Lecture}
\renewcommand{\thechapter}{\Roman{chapter}}
\titleformat{\chapter}[display]
{\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}

% Table of Contents
\setcounter{tocdepth}{2}

% Line Spacing
\onehalfspacing

% Custom Commands
\newcommand{\lecture}[1]{\chapter{#1}}

% Title Page
\renewcommand{\maketitle}{
  \begin{titlepage}
    \centering
    \includegraphics[width=0.4\textwidth]{cover.png}\par\vspace{1cm}
    {\scshape\Large University Name \par}
    \vspace{1cm}
    {\scshape\large Department of Something \par}
    \vspace{1cm}
    {\huge\bfseries Lecture Notes\par}
    \vspace{2cm}
    {\Large Your Name\par}
    \vspace{2cm}
    {\large Date: \today\par}
    \vfill
    {\Large\itshape Abstract\par}
    \vspace{0.5cm}
    \begin{abstract}
      \lipsum[1-2]
    \end{abstract}
    \vfill
  \end{titlepage}
}

\endinput
