%=================================================================%
% CLASS: uitmthesis                                               %
% Version: 1.0.1-2021/03/26                                       %
% License: LPPL 1.3c                                              %
% Copyright (C) 2021 Rizauddin Saian <rizauddin at gmail dot com> %
%                                                                 %
% This Work may be distributed and/or modified under the          %
% conditions of the LaTeX Project Public License, in its          %
% version 1.3c. This version of this license is in                %
% http://www.latex-project.org/lppl/lppl-1-3c.txt                 %
% and the latest version of this license is in                    %
% http://www.latex-project.org/lppl.txt                           %
% and version 1.3 or later is part of all distributions of        %
% LaTeX version 2005/12/01 or later.                              %
%                                                                 %
% uitmthesis is a LaTeX class for writing                         %
% thesis/dissertation/final year project report.                  %
% This class was developed based on the                           %
% "Guidelines on Thesis/Dissertation Format" handbook             %
% by IPSis UiTM.                                                  %
%                                                                 %
% History:                                                        %
% 2021/03/16 v1.0 First release.                                  %
% 2021/03/26 v1.0.1 Remove gender bug.                            %
%=================================================================%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uitmthesis}[2021/03/01 v1.0 Universiti Teknologi MARA (UiTM) thesis class. Copyright (c) 2021 Rizauddin Saian <rizauddin at gmail dot com>]
\LoadClass[a4paper,12pt,oneside]{memoir}
\DisemulatePackage{setspace} % do not remove
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx}
\RequirePackage[english]{babel}
\RequirePackage{caption}
\RequirePackage{indentfirst}
\RequirePackage{appendix}
\let\ordinal\relax % to remove Package fmtcount Warning: \ordinal already defined use \FCordinal instead
\RequirePackage{fmtcount}
\RequirePackage{etoolbox}

%=======%
% Fonts %
%=======%
% see page 46 memman.pdf
% Class option  12pt
%\miscule       7pt
%\tiny          8pt
%\scriptsize    9pt
%\footnotesize  10pt
%\small         11pt
%\normalsize    12pt
%\large         14pt
%\Large         17pt
%\LARGE         20pt
%\huge          25pt
%\Huge          30pt
%\HUGE          36pt

%============%
% Paragraphs %
%============%
%% Indent first paragraph
\setlength{\parindent}{0.5in}

%============================================================%
% Change words List of Tables, List of Figures, Bibliography %
%============================================================%
\addto{\captionsenglish}{%
    \renewcommand{\listtablename}{LIST OF TABLES}
    \renewcommand{\listfigurename}{LIST OF FIGURES}
    %\renewcommand{\bibname}{\bfseries\large\centering{REFERENCES}}
    \renewcommand{\bibname}{REFERENCES}
}

%============%
% References %
%============%
\AtBeginEnvironment{thebibliography}{\SingleSpacing}
\AtBeginEnvironment{bibitemlist}{\vspace{\onelineskip}}

%=============%
% Definitions %
%=============%
\let\@university\@empty\newcommand{\university}[1]{\def\@university{#1}}
\let\@faculty\@empty\newcommand{\faculty}[1]{\def\@faculty{#1}}
\let\@programme\@empty\newcommand{\programme}[1]{\def\@programme{#1}}
\let\@programmeT\@empty\newcommand{\programmeT}[1]{\def\@programmeT{#1}}
\let\@programmeCode\@empty\newcommand{\programmeCode}[1]{\def\@programmeCode{#1}}
\let\@supervisor\@empty\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\let\@datesubmit\@empty\newcommand{\datesubmit}[1]{\def\@datesubmit{#1}}
\let\@reportType\@empty\newcommand{\reportType}[1]{\def\@reportType{#1}}
\let\@studentid\@empty\newcommand{\studentid}[1]{\def\@studentid{#1}}
\let\@gender\@empty\newcommand{\gender}[1]{\def\@gender{#1}}
\let\@degreeAcronym\@empty\newcommand{\degreeAcronym}[1]{\def\@degreeAcronym{#1}}

%=============%
% Page Layout %
%=============%
%see Fig 2.3 on page 11 memoir class
\pagestyle{plain}
\settrimmedsize{297mm}{210mm}{*}
\setlrmarginsandblock{40mm}{26.4mm}{*} % specify both margins
\setulmarginsandblock{25.4mm}{30mm}{*}
\checkandfixthelayout

% \setlrmarginsandblock{3.5cm}{2.5cm}{*}
% \setulmarginsandblock{2.5cm}{*}{1}
% \checkandfixthelayout

%===================%
% Header and Footer %
%===================%
\setheadfoot{\baselineskip}{5mm}
\setheaderspaces{15mm}{*}{*} % above/below page header
\makepagestyle{plain}
\makeoddhead{plain}{}{}{}
\makeevenhead{plain}{}{}{}
\makeevenfoot{plain}{}{\thepage}{}
\makeoddfoot{plain}{}{\thepage}{}

% see page 46 "The memoir class" for font size
%============%
% Cover Page %
%============%
\renewcommand{\maketitle}{%
    \begin{titlingpage}
        \vspace*{10mm}  % top to uitm
        \begin{adjustwidth}{10mm}{24mm} % textwidth
            \SingleSpacing\centering
            {\bfseries\Large
            \ifx\@university\@empty
                \else\MakeUppercase\@university\par\fi}%
            \vspace*{30mm} % uitm to title
            {\bfseries\Large
                \ifx\@title\@empty
                \else\MakeUppercase\@title\par\fi}%
            \vspace*{30mm}
            {\bfseries\Large
            \ifx\@author\@empty
                \else\MakeUppercase\@author\par\fi}%
            \vfill
            {\bfseries\Large
            \@degreeAcronym\par}%
            \vspace*{30mm} % programme code to date
            {\bfseries\Large
                \@date\par}%
            \vspace*{20mm}  % date to bottom edge
        \end{adjustwidth}
    \end{titlingpage}
\cleardoublepage
%============%
% Title Page %
%============%
    \begin{titlingpage}
        \vspace*{10mm}  % top to uitm
        \begin{adjustwidth}{10mm}{24mm} % textwidth
            \SingleSpacing\centering
            {\bfseries\Large
            \ifx\@university\@empty
                \else\MakeUppercase\@university\par\fi}%
            \vspace*{30mm} % uitm to title
            {\bfseries\Large
                \ifx\@title\@empty
                \else\MakeUppercase\@title\par\fi}%
            \vfill
            {\bfseries\large
            \ifx\@author\@empty
                \else\MakeUppercase{\@author}\par\fi}%
            \vfill
            {\large
            \@reportType\ submitted in \xxx\ \\
            of the requirements for the degree of\\
            % xxx\thesistype\ submitted in xxxPARTIALxxx fullfillment\\
            % of the requirements for the degree of\\
            \bfseries\large
            \@programme\\ 
            (\@programmeT)%
            \par}%
            \vspace{20mm} % program to faculty
            {\bfseries\large
            \ifx\@faculty\@empty
                \else\@faculty\par\fi}%
            \vspace*{20mm} % faculty to date
            {\bfseries\large
                \@date\par}%
            \vspace*{20mm}  % date to bottom edge
        \end{adjustwidth}
    \end{titlingpage}
}

%===========================================%
% Fullfillment for Thesis, Report           %
% and Dissertation use Partial Fullfillment %
%===========================================%
\newcommand{\xxx}{%
    \begingroup
    \def\@Mythesis{Thesis}%
    \def\@mythesis{Thesis}%
    \ifx\@reportType\@Mythesis%
        fullfillment%
    \else
        \ifx\@reportType\@mythesis%
            fullfillment%
        \else%
            partial fullfillment%
        \fi
    \fi%
    \endgroup
}

%======================%
% Author`s Declaration %
%======================%
\newcommand{\thereporttype}{\MakeLowercase\@reportType~}
\newcommand{\declaration}{%
    \noindent
    I declare that the work in this \thereporttype was carried out in accordance with the regulations of Universiti Teknologi MARA. It is original and is the results of my own work, unless otherwise indicated or acknowledged as referenced work. This thesis has not been submitted to any other academic institution or non-academic institution for any degree or qualification.

    \bigskip\noindent 
    I, hereby, acknowledge that I have been supplied with the Academic Rules and Regulations for {\isIpsis}Universiti Teknologi MARA, regulating the conduct of my study and research.
    
    \vspace{2cm}
    \noindent
    \begin{tabular}{@{}p{.25\textwidth}cp{95mm}@{}}
    Name of Student                 &:& {\@author}\\
    Student I.D. No.                &:& {\@studentid}\\
    Programme                       &:& {\@programme\space\@programmeT} - %
                                        \@programmeCode \\
    Faculty                         &:& {\@faculty}\\
    Thesis Title                    &:& {\@title}\\

    \null\vspace{1cm} &&\\

    Signature of Student            &:& $\dots\dots\dots\dots\dots\dots\dots\dots\dots\dots\dots\dots\dots$\\
    Date                            &:& {\@date}
    \end{tabular}
    \par
}

%====================================================%
% Add `Post Graduate` or not in Author`s Declaration %
%====================================================%
\newcommand{\isIpsis}{%
    \begingroup
    \def\@myreport{Report}%
    \ifx\@reportType\@myreport
    \else
        Post Graduate,~
    \fi
    \endgroup
}

%=====================================================================%
% Confirmation by Panel of Examiners / Supservisor's Approval for FYP %
%=====================================================================%
\newcommand{\theconfirmation}{%
    \begingroup
        \def\@myreport{Report}%
        \SingleSpacing\par\noindent
        \ifx\@reportType\@myreport
            \input{frontmatter/frontSupervisorApproval} % FYP.
        \else
            \input{frontmatter/frontConfirmationExaminers} % postgraduate.
        \fi
    \endgroup
}
% \newcommand{\confirmation}{%
%     \SingleSpacing
%     \par\noindent
%     \begingroup
%         \def\@myreport{Report}%
%         \ifx\@reportType\@myreport %fyp
%             This report entitled ``{\@title}'' was prepared under the direction of supervisor, {\@supervisor}. It was submitted to the {\@faculty}, and was accepted in partial fullfillment of the requirements for the degree of \textbf{\@programme~\@programmeT}.\par
%             \vspace{2cm}\par
%             \noindent Approved by:\par
%             \vspace{2cm}\par
%             \noindent.$\dots\dots\dots\dots\dots\dots\dots\dots\dots\dots\dots\dots\dots$\par
%             \noindent{\@supervisor}\par
%             \noindent Supervisor\par
%             \vspace{1cm}
%             \noindent\@datesubmit 
%         \else %postgraduate
%          I certify that a Panel of Examiners has met on {\@date} to conduct the final examination of {\@author} on{\apply@gender} \textbf{\@programme~\@programmeT} \MakeLowercase\@reportType\ entitled ``{\@title}'' in accordance with Universiti Teknologi MARA Act 1976 (Akta 173). The Panel of Examiners recommends that the student be awarded the relevant degree. The Panel of Examiners was as follows:
%         \par        
%         \fi
%     \endgroup
% }

%============%
% his or her %
%============%
% \newcommand{\@gender}[1]{Unknown}
% \newcommand{\gender}[1]{\renewcommand{\@gender}{#1}}
\newcommand{\apply@gender}{%
    \begingroup
    \def\@male{male}
    \def\@female{female}%
    \ifx\@gender\@female
        her%
    \else
        %\ifx\@gender\@male
        his%
        %\fi
    \fi
    \endgroup
}

%==========%
% Abstract %
%==========%
\renewenvironment{abstract}
{%
\chapter{ABSTRACT}
\begin{SingleSpace}
\setlength{\parindent}{0em}
}
{\end{SingleSpace}}

%=================%
% Acknowledgement %
%=================%
\newenvironment{acknowledgement}
{%
    \chapter{ACKNOWLEDGEMENT}%
    \begin{SingleSpace}
    \setlength{\parindent}{0em}
    \setlength{\parskip}{1em}
}
{\end{SingleSpace}}

%=================================%
% Captions for Tables and Figures %
%=================================%
\captionsetup[table]{%
    justification=raggedright, %left aligned caption
    labelformat=simple, 
    singlelinecheck=false,
    labelsep=newline
}
%% table size.
\AtBeginEnvironment{tabular}{\small}
\captionsetup[figure]{%
    justification=centering, %center caption
    labelformat=simple, 
    singlelinecheck=false,
    labelsep=space
}

%===================%
% Table of Contents %
%===================%
\addto\captionsenglish{%
    \renewcommand{\contentsname}{TABLE OF CONTENTS}%
    \renewcommand{\appendixname}{APPENDIX}
}
%% remove margin before title of ToC, LoT, LoF
\renewcommand*{\chapterheadstart}{}
\renewcommand*{\chaptitlefont}{\large\bfseries\centering}
%\renewcommand{\contentsname}{TABLE OF CONTENTS}
\addtodef{\tableofcontents}{\clearpage}{}
%\renewcommand*{\tocheadstart}{\vspace*{-\topfiddle}}
%% Add 2cm spacing after TOC title and word Page on top of page numbers in TOC.
\renewcommand*{\aftertoctitle}{\thispagestyle{plain}%
  \par\nobreak\vspace*{1.5cm} % title to word 'Page'
  \mbox{}\hfill{\normalsize Page}\par\nobreak}
%% Add 2 spaces in CHAPTER ONE:xxINTRODUCTION
\renewcommand*\chapternumberline[1]{%
    CHAPTER \NUMBERstringnum{#1}:\space\space
}

% TOC Heading
%\renewcommand\printtoctitle[1]{\centering\large\bfseries #1}
%\settocdepth{paragraph}
%\renewcommand{\tocheadstart}{\clearpage} %clearpage b4 TOC
%% Add 2cm spacing after TOC title
%\renewcommand{\aftertoctitle}{\par\vspace*{1.7cm}} %

%% Remove dots between section name and page number
\renewcommand*{\cftsectionleader}{\hfill}
\renewcommand*{\cftsubsectionleader}{\hfill}
\renewcommand*{\cftsubsubsectionleader}{\hfill}
%% Remove indent from section, realign subsection and subsubsection in ToC
\setlength{\cftsectionindent}{0em}
\setlength{\cftsubsectionindent}{2.3em}
\setlength{\cftsubsubsectionindent}{5.4em}
%% Add spaces between Chapter 1 and List of Figures
\preto\chapter{%
    \if@mainmatter
        \ifnum\value{chapter}=0\addtocontents{toc}{\vspace{1.7cm}}\fi
    \fi
}
%% Add word Page on top of page numbers in TOC.
%\addtocontents{toc}{\noindent\hfill\textbf{Page}\par}

%================%
% List of Tables %
%================%
%revises the \chapter macro to put no additional spaces into the LOT, LOF and ToC
\renewcommand{\insertchapterspace}{}
%\renewcommand{\listtablename}{LIST OF TABLES}
\addtodef{\listoftables}{\clearpage}{}
%\renewcommand*{\lotheadstart}{\vspace*{-\topfiddle}}
%% Add 2cm spacing after LOT title and word Tables, Title, Page on top of page numbers in LOT.
\renewcommand*{\afterlottitle}{\thispagestyle{plain}%
  \par\nobreak\vspace*{1.5cm} % title to word 'Page'
  {\normalsize Tables \hspace{5.7mm} Title \hfill Page}\par\nobreak%
}
%% Remove dots between figure name and page number
\renewcommand{\cfttableleader}{\hfill}

%\renewcommand{\lotheadstart}{\clearpage} %clearpage b4 List of Tables
% LOT Heading
%\renewcommand\printlottitle[1]{\centering\large\bfseries #1}
%\renewcommand{\afterlottitle}{\par\vspace*{1.5cm}}
%% Remove dots between table name and page number
%\renewcommand{\cfttableleader}{\hfill}
%\renewcommand{\cfttableafterpnum}{\hfil}
% Add word Page on top of page 
%\addtocontents{lot}{\noindent\bfseries Tables\hspace{8mm}Title~\hfill~Page\par}

%=================%
% List of Figures %
%=================%
%\renewcommand{\listfigurename}{LIST OF FIGURES}
\addtodef{\listoffigures}{\clearpage}{}
%\renewcommand*{\lofheadstart}{\vspace*{-\topfiddle}}
%% Add 2cm spacing after LOF title and word Figures, Title, Page on top of page numbers in LOF.
\renewcommand*{\afterloftitle}{\thispagestyle{plain}%
  \par\nobreak\vspace*{1.5cm} % title to 'Page'
  {\normalsize Figures \hspace{5.7mm} Title \hfill Page}\par\nobreak}
%% Remove dots between figure name and page number
\renewcommand{\cftfigureleader}{\hfill}

% \renewcommand{\lofheadstart}{\clearpage} %clearpage b4 List of Figures
% % LOF Heading
% \renewcommand\printloftitle[1]{\centering\large\bfseries #1}
% \renewcommand{\afterloftitle}{\par\vspace*{1.5cm}}
% %% Remove dots between figure name and page number
% \renewcommand{\cftfigureleader}{\hfill}
% \renewcommand{\cftfigureafterpnum}{\hfill}
% %% Add word Page on top of page numbers in LOF.
% \addtocontents{lof}{\noindent\bfseries Figures\hspace{8mm}Title~\hfill~Page\par}

%=====================================================%
% Center pages below word 'Page' for ToC, LoT and LoF %
%=====================================================%
\newlength{\pnumwidthlen}
\settowidth{\pnumwidthlen}{\textbf{Page}}
\setpnumwidth{\the\pnumwidthlen}
\renewcommand{\cftchapterformatpnum}[1]{\makebox[\pnumwidthlen]{\bfseries#1}}
\renewcommand{\cftsectionformatpnum}[1]{\makebox[\pnumwidthlen]{\mdseries #1}}
\renewcommand{\cftsubsectionformatpnum}[1]{\makebox[\pnumwidthlen]{\mdseries #1}}
\renewcommand{\cftsubsubsectionformatpnum}[1]{\makebox[\pnumwidthlen]{\mdseries #1}}
\renewcommand{\cftfigureformatpnum}[1]{\makebox[\pnumwidthlen]{\mdseries #1}}
\renewcommand{\cfttableformatpnum}[1]{\makebox[\pnumwidthlen]{\mdseries #1}}

%============%
% Appendices %
%============%
\renewcommand{\appendixpagename}{APPENDICES}
\renewcommand{\appendixtocname}{APPENDICES}

%==========%
% Sections %
%==========%
%% Turn on numbering for subsection and subsubsection
%%% ToC down to subsubsections
\settocdepth{subsubsection}
%%% Numbering down to subsubsections as well
\setsecnumdepth{subsubsection}

%% Sections font size 12pt
\setsecheadstyle{\normalsize\bfseries}
\setsubsecheadstyle{\normalsize\bfseries}
\setsubsubsecheadstyle{\normalsize\bfseries}
% \setparaheadstyle{\large\bfseries}
% \setsubparaheadstyle{\large\bfseries}

%==========%
% Chapters %
%==========%
\setstretch{1.5}
%% Decrease spacing before chapter title
%% https://tex.stackexchange.com/a/63393/2405
\def\@makechapterhead#1{%
  %%%%\vspace*{50\p@}% %%% removed!
  {\parindent \z@ \raggedright \normalfont
    \centering
    \ifnum \c@secnumdepth >\m@ne
        \SingleSpacing\centering
        \ifanappendix
            {\chapnumfont{\large\MakeUppercase\appendixname\space\thechapter}
            }%
        \else%
            {\chapnumfont{\large\MakeUppercase~CHAPTER~\NUMBERstring{chapter}}
            }%
        \fi%
    \fi
    \interlinepenalty\@M
    \large \par \bfseries \MakeUppercase{#1}\par\nobreak
    \vskip 45\p@ % space between chapter and text
  }}

%\renewcommand*{\chapnamefont}{\large\bfseries}
% \renewcommand*{\chapnumfont}{\large\bfseries\centering}
% \renewcommand*{\printchaptername}{%
%     \centering\chapnamefont\MakeUppercase{\chaptername}}%
% \renewcommand{\printchapternum}{\chapnumfont\NUMBERstring{chapter}}
% \renewcommand*{\printchaptertitle}[1]{\chaptitlefont\MakeUppercase{#1}}

% \makechapterstyle{textchapterstyle}{
%     \setlength{\beforechapskip}{25mm}
%     \setlength{\midchapskip}{-2pt} % between chapter and chapter name
%     \renewcommand*{\printchaptername}{}
%     \renewcommand*{\chapnamefont}{\large\bfseries}
%     \renewcommand*{\chaptitlefont}{\large\bfseries\centering}
%     \renewcommand*{\chapnumfont}{\large\bfseries\centering}
%     \renewcommand\printchapternum{%
%         \SingleSpacing\centering
%         \ifanappendix
%             {% TODO: this line will remove Page from LOT and LOF
%             %\addtocontents{toc}{\setcounter{tocdepth}{-1}} % Hide appendix in TOC.
%             \chapnumfont\MakeUppercase\appendixname\space\thechapter}%
%         \else%
%             {\chapnumfont{CHAPTER~\NUMBERstring{chapter}}}
%         \fi%
%     }
% }
% \chapterstyle{textchapterstyle}


