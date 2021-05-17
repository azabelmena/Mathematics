%%
%% This files has been adapted from ufthesis.cls by Ron Smith
%%
%%
%% This program may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%%
%%
\NeedsTeXFormat{LaTeX2e}[2000/06/01]
\ProvidesClass{uprmclass}
   [2002/09/20 v2.0c UF Thesis Class (Ron Smith), Edited by Alberto Santana (2003), Edited By Cesar Aceros (2005), Edited By Luis R. Fuentes (2010)]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Defining Class options and loading required   %
%%     packages                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}
     [1996/08/02 v1.0m Standard LaTeX ifthen package (DPC)]
%% Declaring Options \& Initializing Flags
\newcommand{\RS@ptsize}{}
\newcounter{RS@ptcnt}
\DeclareOption{10pt}{\renewcommand{\RS@ptsize}{10pt}%
\setcounter{RS@ptcnt}{10}}%
\DeclareOption{11pt}{\renewcommand{\RS@ptsize}{11pt}%
\setcounter{RS@ptcnt}{11}}%
\DeclareOption{12pt}{\renewcommand{\RS@ptsize}{12pt}%
\setcounter{RS@ptcnt}{12}}%
\newboolean{RS@TOCHang}%
\setboolean{RS@TOCHang}{true}%
\DeclareOption{NoTocHang}{\setboolean{RS@TOCHang}{false}}
\newboolean{RS@BfSet}%
\setboolean{RS@BfSet}{false}%
\DeclareOption{Bold}{\setboolean{RS@BfSet}{true}}
\newboolean{RS@CPage}%
\setboolean{RS@CPage}{false}%
\DeclareOption{CPage}{\setboolean{RS@CPage}{true}}
\newboolean{RS@Draft}%
\setboolean{RS@Draft}{false}%
\DeclareOption{Draft}{\setboolean{RS@Draft}{true}}%
\newboolean{RS@Justify}%
\setboolean{RS@Justify}{false}%
\DeclareOption{Justify}{\setboolean{RS@Justify}{true}}%
\newboolean{RS@nopenalties}%
\setboolean{RS@nopenalties}{true}%
\DeclareOption{nopenalties}{\setboolean{RS@nopenalties}{false}}%
\DeclareOption*{\OptionNotUsed}
%% Executing Options \& Loading Required Packages
\ExecuteOptions{12pt}
\ProcessOptions\relax
\LoadClass[\RS@ptsize]{report}[2000/05/19 v1.4b Standard LaTeX document class]
\typeout{ }
\typeout{*****************************************}
\typeout{* Updating commands for Thesis Template *}
\typeout{*****************************************}
\RequirePackage[nodisplayskipstretch]{setspace}[2000/12/01 6.7 Contributed and Supported LaTeX2e package]%
%% Removing 3 minor commands left-over by the setspace 2000/12/01 6.7 package
\providecommand{\filename}{filenametext}%
\providecommand{\filedate}{filedatetext}%
\providecommand{\fileversion}{filevertext}%
\renewcommand{\filename}{}%
\renewcommand{\filedate}{}%
\renewcommand{\fileversion}{}%
\RequirePackage[normalem]{ulem}%
\RequirePackage{sectsty}[1999/04/12 v2.0.1 Commands to change all sectional heading styles]%
\ifthenelse{\boolean{RS@Justify}}{}{%
\RequirePackage{ragged2e}[1999/06/08 v1.02 Ragged2e Package (MS)]%
\setlength{\RaggedRightRightskip}{0pt plus 4em}%
\RaggedRight}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Page layout for UPRRP  Template              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\normalfont\small\normalsize% Make sure font size is set to normalsize
\newcounter{RS@TmpCnt}% Used to count the number of lines per page
\setcounter{RS@TmpCnt}{1}% and as a counter for handling TOC section spacing.
\newlength{\RS@TOChdent}% Used to define hanging indents.
\setlength{\RS@TOChdent}{1.0em}%
\newlength{\RS@MyHeader}% Used to set space between top of page and
\setlength{\RS@MyHeader}{0.6in}% page numbers
\newlength{\RS@NumPoints}%
\newlength{\RS@StartofHeader}%
\newlength{\RS@EndofFooter}%
\newlength{\RS@TempLength}%
%%    Setting the margin reference point
\setlength{\hoffset}{0pt}%
\setlength{\voffset}{0pt}%
%%    Setting the height of the text page
\setlength{\textheight}{\topskip}%
\addtolength{\textheight}{44\baselineskip}%
\ifthenelse{\value{RS@ptcnt}=11}{%
\addtolength{\textheight}{3\baselineskip}}{}%
\ifthenelse{\value{RS@ptcnt}=10}{%
\addtolength{\textheight}{9\baselineskip}}{}%
%%    Setting the width of the text page
\setlength{\oddsidemargin}{0.5in}%
\@settopoint{\oddsidemargin}%
\setlength{\evensidemargin}{\oddsidemargin}%
\setlength{\textwidth}{0.99\paperwidth}%
\addtolength{\textwidth}{-2in}%
\addtolength{\textwidth}{-\oddsidemargin}%
\@settopoint{\textwidth}%
\setlength{\marginparpush}{8pt}%
\setlength{\marginparwidth}{\paperwidth}%
\addtolength{\marginparwidth}{-1in}%
\addtolength{\marginparwidth}{-\hoffset}%
\addtolength{\marginparwidth}{-\evensidemargin}%
\addtolength{\marginparwidth}{-\textwidth}%
\addtolength{\marginparwidth}{-2\marginparpush}%
\@settopoint{\marginparwidth}%
\settowidth{\parindent}{\ }%
\setlength{\parindent}{6\parindent}%
\ifthenelse{\boolean{RS@Justify}}{}{%
\setlength{\RaggedRightParindent}{\parindent}}%
%%    Positioning the Header
\ifthenelse{\value{RS@ptcnt} = 10}{\setlength{\headheight}{10.0pt}}{}%
\ifthenelse{\value{RS@ptcnt} = 11}{\setlength{\headheight}{11.0pt}}{}%
\ifthenelse{\value{RS@ptcnt} = 12}{\setlength{\headheight}{12.0pt}}{}%
\@settopoint{\RS@MyHeader}%
\setlength{\topmargin}{\RS@MyHeader}%
\addtolength{\topmargin}{-1in}%
\@settopoint{\topmargin}%
\setlength{\headsep}{-\topmargin}%
\addtolength{\headsep}{-\headheight}%
%%    Positioning the Footer
\setlength{\RS@StartofHeader}{\voffset}%
\addtolength{\RS@StartofHeader}{1in}%
\addtolength{\RS@StartofHeader}{\topmargin}%
\setlength{\footskip}{0pt}%
\setlength{\RS@EndofFooter}{100pt}%
\whiledo{\lengthtest{\RS@EndofFooter > \RS@StartofHeader}}%
    {\addtolength{\footskip}{0.5pt}%
    \setlength{\RS@EndofFooter}{-\voffset}%
    \addtolength{\RS@EndofFooter}{-1in}%
    \addtolength{\RS@EndofFooter}{-\topmargin}%
    \addtolength{\RS@EndofFooter}{-\headheight}%
    \addtolength{\RS@EndofFooter}{-\headsep}%
    \addtolength{\RS@EndofFooter}{-\textheight}%
    \addtolength{\RS@EndofFooter}{-\footskip}%
    \addtolength{\RS@EndofFooter}{\paperheight}}%
%%    Creating a 2 inch margin
\newlength{\BigLength}%
\setlength{\BigLength}{0pt}%
\newcommand{\BigMargin}{\hspace*{1in}\normalfont\normalsize%
\settoheight{\RS@TempLength}{()}%
\vspace*{-\baselineskip}\vspace*{-\topskip}\vspace*{1in}%
\vspace*{\RS@TempLength}\vspace*{\BigLength} \\}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Page-breaking penalties and page number  %
%%          formatting commands                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{RS@nopenalties}}{%
\clubpenalty=10000    % Do not allow orphans
\@clubpenalty \clubpenalty
\widowpenalty=10000   % Do not allow widows
}{}%
\brokenpenalty=10000  % Do not allow hyphenation across
                      % page boundaries.
\providecommand{\frontmatter}{}%
\providecommand{\mainmatter}{}%
\providecommand{\backmatter}{}%
\ifthenelse{\boolean{RS@Draft}}{%
  \renewcommand{\frontmatter}{\clearpage\pagenumbering{arabic}%
    \pagestyle{plain}}%
  \renewcommand{\mainmatter}{\clearpage%
    \pagestyle{myheadings}\markboth{}{}}}%
{ \renewcommand{\frontmatter}{\clearpage\pagenumbering{roman}%
    \pagestyle{plain}}%
  \renewcommand{\mainmatter}{\clearpage\pagenumbering{arabic}%
    \pagestyle{myheadings}\markboth{}{}}}%
\renewcommand{\backmatter}{\clearpage\GoSingle\pagestyle{empty}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Line-spacing commands                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newboolean{SetDSpace}%
\setboolean{SetDSpace}{true}%
\newcommand{\BaseDiff}{0}
\newcommand{\GoSingle}{\renewcommand{\baselinestretch}{1}%
\normalfont\tiny\normalsize}%
\ifthenelse{\value{RS@ptcnt} = 10}{%
\newcommand{\GoDouble}{\renewcommand{\baselinestretch}{1.667}%
\renewcommand{\BaseDiff}{0.667}\normalfont\tiny\normalsize}}{}%
\ifthenelse{\value{RS@ptcnt} = 11}{%
\newcommand{\GoDouble}{\renewcommand{\baselinestretch}{1.618}%
\renewcommand{\BaseDiff}{0.618}\normalfont\tiny\normalsize}}{}%
\ifthenelse{\value{RS@ptcnt} = 12}{%
\newcommand{\GoDouble}{\renewcommand{\baselinestretch}{1.655}%
\renewcommand{\BaseDiff}{0.655}\normalfont\tiny\normalsize}}{}%
\GoDouble\GoSingle%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Formatting Chapter Headings                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{2}%
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\appendixname}{APPENDIX}
\renewcommand{\@chapapp}{\chaptername}
\let\@afterindentfalse\@afterindenttrue%
\@afterindenttrue%
\newenvironment{RS@Cent}{\centering}{\par}%
\renewcommand{\chapter}{%
    \clearpage%
    \thispagestyle{plain}%
    \GoSingle%
    \global\@topnum\z@%  Keep floats from top of page
    \@afterindentfalse%
    \secdef\@chapter\@schapter}%
\renewcommand{\@chapter}[2][?]{%
    \ifthenelse{\value{secnumdepth} > -1}{%
      \refstepcounter{chapter}%
      \typeout{***************************}%
      \typeout{\@chapapp\space\thechapter.}%
      \typeout{***************************}%
      \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}{#1}}% Alberto was here
    }{\addcontentsline{toc}{chapter}{\texorpdfstring{{#1}}{}}}% Alberto was here
    \setcounter{footnote}{0}%
    \@makechapterhead{\Large{\texorpdfstring{{#2}}{}}}}%#2}}% Alberto was here
\renewcommand{\@makechapterhead}[1]{%
    \begin{RS@Cent}%
    \BigMargin%
    \ifthenelse{\value{secnumdepth} > -1}{%
			\bfseries\Large{\@chapapp\space\thechapter\\}}{}%
    #1
    \vspace{.4in}
    \end{RS@Cent}%
    \@afterheading%
    \ifthenelse{\boolean{SetDSpace}}{\GoDouble}{}%
    }%
\renewcommand{\@schapter}[2][?]{%
    \@makeschapterhead{#2}}%
\renewcommand{\@makeschapterhead}[1]{%
    \begin{RS@Cent}%
    \BigMargin%
    #1\end{RS@Cent}%
    \@afterheading%
    \ifthenelse{\boolean{SetDSpace}}{\GoDouble}%
    {\addvspace{\BaseDiff\baselineskip}}%
    }%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Formatting Section Headings                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{RS@BfSet}}%
{\sectionfont{\normalsize\normalfont\singlespace\centering\bfseries}%
 \subsectionfont{\normalsize\normalfont\singlespace\bfseries}%
 \subsubsectionfont{\normalsize\normalfont\singlespace\bfseries}%
 \paragraphfont{\normalsize\normalfont\bfseries}%
 \renewcommand{\paragraph}[1]{\@paragraph{#1.}}%
 \newcommand{\@paragraph}{\@startsection{paragraph}{4}{\parindent}%
    {0.1ex}%
    {-1.0em}%
    {\SS@parafont}}%
 \subparagraphfont{\normalsize\normalfont\bfseries}}%
{\sectionfont{\normalsize\normalfont\singlespace\centering\underline}%
 \subsectionfont{\normalsize\normalfont\singlespace\underline}%
 \subsubsectionfont{\normalsize\normalfont\singlespace\underline}%
 \paragraphfont{\normalsize\normalfont\underline}%
 \renewcommand{\paragraph}[1]{\@paragraph{#1}.}%
 \newcommand{\@paragraph}{\@startsection{paragraph}{4}{\parindent}%
    {0.1ex}%
    {0pt}%
    {\SS@parafont}}%
 \subparagraphfont{\normalsize\normalfont\underline}}%
\renewcommand{\section}{%
    \@startsection{section}{1}{\z@}%
    {-0\baselineskip}%
    {0.1ex}%
    {\SS@sectfont}}
\renewcommand{\subsection}{%
    \@startsection{subsection}{2}{\z@}%
    {-0\baselineskip}%
    {0.1ex}%
    {\SS@subsectfont}}
\renewcommand{\subsubsection}{%
    \@startsection{subsubsection}{3}{2.0em}%
    {-0.1ex}%
    {0.1ex}%
    {\SS@subsubsectfont}}
\renewcommand{\subparagraph}{%
    \@startsection{subparagraph}{5}{\z@}%
    {0.1ex}%
    {-1.0em}%
    {\SS@subparafont}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Formatting Generated Lists -- TOC, LOF and LOT %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\@dotsep}{4.5}%
\renewcommand{\@pnumwidth}{1.55em}%
\ifthenelse{\boolean{RS@Justify}}{%
\renewcommand{\@tocrmarg}{2.55em}}{%
\renewcommand{\@tocrmarg}{2.55em plus 1.45em}}%
\renewcommand*{\l@chapter}[2]{%
  \setcounter{RS@TmpCnt}{0}%
  \ifthenelse{\value{tocdepth} > -1}{%
    \addpenalty{-\@highpenalty}%
    \vspace{\BaseDiff\baselineskip}%
    \@dottedtocline{0}{\UFdent}{\RS@chapnumwidth}{#1}{#2}%
  }{}}%
\newcommand*{\l@extrachapter}[2]{%
  \setcounter{RS@TmpCnt}{0}%
  \ifthenelse{\value{tocdepth} > -1}{%
    \addpenalty{-\@highpenalty}%
    \vspace{\BaseDiff\baselineskip}%
    \@dottedtocline{0}{0pt}{0pt}{#1}{#2}%
  }{}}%
\newcommand*{\l@extraentry}[2]{%
  \setcounter{RS@TmpCnt}{0}%
  \ifthenelse{\value{tocdepth} > -1}{%
    \addpenalty{-\@highpenalty}%
    \vspace{\BaseDiff\baselineskip}%
    \noindent #1\par%
  }{}}%
\renewcommand*{\l@section}{%
  \ifthenelse{\value{RS@TmpCnt} = 0}{%
     \setcounter{RS@TmpCnt}{1}%
     \vspace{\BaseDiff\baselineskip}}{}%
  \@dottedtocline{1}{\RS@secindent}{\RS@secnumwidth}}%
\renewcommand*{\l@subsection}{\@dottedtocline{2}{\RS@subsecindent}%
              {\RS@subsecnumwidth}}%
\renewcommand*{\l@subsubsection}{\@dottedtocline{3}{7.0em}{4.1em}}%
\renewcommand*{\l@paragraph}{\@dottedtocline{4}{10em}{5em}}%
\renewcommand*{\l@subparagraph}{\@dottedtocline{5}{12em}{6em}}%
\renewcommand*{\l@figure}{\vspace{\BaseDiff\baselineskip}%
              \@dottedtocline{-5}{\RS@figindent}{\RS@fignumwidth}}%
\renewcommand*{\l@table}{\vspace{\BaseDiff\baselineskip}%
              \@dottedtocline{-5}{\RS@tabindent}{\RS@tabnumwidth}}%
\newcommand{\leaddots}{%
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill}%
\renewcommand{\@dottedtocline}[5]{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
%%   Handling those sections that are included in TOC, but have
%%   no section numbering. Also including hanging indent when the
%%   NoTocHang option was not used. Only the following 4 lines added.
     \ifthenelse{#1 > \value{secnumdepth}}{%
     \setlength{\@tempdima}{0pt}}{}%
     \ifthenelse{#1 > \value{secnumdepth} \or \boolean{RS@TOCHang}}{%
     \addtolength{\leftskip}{\RS@TOChdent}}{}%
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaddots
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Indenting Generated Lists -- TOC, LOF and LOT  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\UFdent}%
\setlength{\UFdent}{0pt}%
\newlength{\RS@chapnumwidth}%
\setlength{\RS@chapnumwidth}{2.3em}%
\newlength{\RS@secindent}%
\setlength{\RS@secindent}{0pt}%
\AtBeginDocument{%
\addtolength{\RS@secindent}{\UFdent}%
%% Verifying that the chapters are numbered.
\ifthenelse{\value{secnumdepth} > -1}{%
\addtolength{\RS@secindent}{\RS@chapnumwidth}}{}%
}
\newlength{\RS@secnumwidth}%
\setlength{\RS@secnumwidth}{3em}%
\newlength{\RS@subsecindent}%
\setlength{\RS@subsecindent}{0pt}%
\AtBeginDocument{%
\addtolength{\RS@subsecindent}{\RS@secindent}%
%% Verifying that the sections are numbered.
\ifthenelse{\value{secnumdepth} > 0}{%
\addtolength{\RS@subsecindent}{\RS@secnumwidth}}{}%
}
\newlength{\RS@subsecnumwidth}%
\setlength{\RS@subsecnumwidth}{3em}%
\newlength{\RS@figindent}%
\settowidth{\RS@figindent}{Fig}%
\newlength{\RS@fignumwidth}%
\setlength{\RS@fignumwidth}{2.3em}%
\newlength{\RS@tabindent}%
\settowidth{\RS@tabindent}{Ta}%
\newlength{\RS@tabnumwidth}%
\setlength{\RS@tabnumwidth}{2.3em}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Table of Contents                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{2}%
\renewcommand{\contentsname}{TABLE OF CONTENTS}%
\newenvironment{simpleenv}[4]{\clearpage}{\clearpage}%
\renewcommand{\tableofcontents}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\contentsname}%
      \vspace*{-\RS@ptsize}%
      \noindent\phantom{Table}\hfill\uline{page}\par%
      \@starttoc{toc}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        List of Tables                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\listtablename}{LIST OF TABLES}%
\renewcommand{\listoftables}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\listtablename}%
      \vspace*{1cm}%
      \addcontentsline{toc}{extrachapter}{\listtablename}%
      \noindent\uline{Table}\hfill\uline{page}\par%
      \@starttoc{lot}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% List of Abbreviations and Symbols                                 %%
%% Adapted from : Peter Czoschke 						             %%
%% http://www.ctan.org/tex-archive/macros/latex/contrib/uiucthesis/  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment*{symbollist}[1][1in]{
    \begin{list}{}{\singlespacing
     \setlength{\leftmargin}{#1}
     \setlength{\labelwidth}{#1}
     \addtolength{\labelwidth}{-\labelsep}
     \setlength{\topsep}{0in}}%
     \def\makelabel##1{\hfil##1\hfil}%
    }{
    \end{list}}
\newenvironment*{symbollist*}[1][1in]{
    \begin{symbollist}[#1]
    \def\makelabel##1{##1\hfil}}
    {\end{symbollist}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        List of Figures                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\listfigurename}{LIST OF FIGURES}%
\renewcommand{\listoffigures}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\listfigurename}%
      \vspace*{1cm}%
      \addcontentsline{toc}{extrachapter}{\listfigurename}%
      \noindent\uline{Figure}\hfill\uline{page}\par%
      \@starttoc{lof}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%
\renewcommand{\appendix}{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand{\@chapapp}{\appendixname}%
  \renewcommand{\thechapter}{\@Alph\c@chapter}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        List of References                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\bibname}{REFERENCE LIST}%
\renewenvironment{thebibliography}[1]%
     {\clearpage\pagestyle{myheadings}%
      \markboth{}{}%
      \setboolean{SetDSpace}{false}%
      \chapter*{\bibname}%
      \addcontentsline{toc}{extrachapter}{\bibname}%
      \setboolean{SetDSpace}{true}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \setlength{\parsep}{\BaseDiff\baselineskip}%
            \setlength{\itemsep}{0ex}%
            \setlength{\leftmargin}{\labelwidth}%
            \addtolength{\leftmargin}{\labelsep}%
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty10000
      \@clubpenalty \clubpenalty
      \widowpenalty10000%
      \sfcode`\.=1000\relax}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist\clearpage}

%% Special Pages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Title Page                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{%
    \clearpage%
    \setboolean{SetDSpace}{false}%
    \thispagestyle{empty}%
    \GoSingle%
    \begin{RS@Cent}%
    \BigMargin%
    {\LARGE University of Puerto Rico\\
R\'io Piedras Campus\\
Faculty of Natural Sciences\\
Department of Mathematics\\}
    \vspace{3cm}
   {\Large \Title\\*[\BaseDiff\baselineskip]}%
    {\Large By \\*[\BaseDiff\baselineskip]%
    \FullName  \\*[\BaseDiff\baselineskip]}%
    \vspace{3cm}
  {\large A DISSERTATION SUBMITTED IN PARTIAL FULFILLMENT
OF THE REQUIREMENTS FOR THE DEGREE OF
DOCTOR OF PHILOSOPHY IN MATHEMATICS
AT THE UNIVERSITY OF PUERTO RICO, R\'{I}O PIEDRAS CAMPUS }\\
\vspace{3cm}
  {\Large \GradMonth}, {\Large \GradYear}%
    \end{RS@Cent}%
    \vfill

    \setboolean{SetDSpace}{true}%
    \clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Title Page                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\firma}{%
    \clearpage%
    \setboolean{SetDSpace}{false}%
    \thispagestyle{empty}%
    \GoSingle%
    \begin{RS@Cent}%
    \BigMargin%
    \vspace{-0.5in}
    {\large
APPROVED BY THE DOCTORAL DISSERTATION COMMITTEE\\
IN PARTIAL FULFILLMENT OF THE REQUIREMENTS \\
FOR THE DEGREE OF\\
DOCTOR OF PHILOSOPHY IN MATHEMATICS \\
AT THE UNIVERSITY OF PUERTO RICO }\\*[\BaseDiff\baselineskip]%
      \end{RS@Cent}%
    \vspace{3cm}
{\flushleft ADVISORS:\\%
}
\vspace{0,01cm}
%%%%%%%%%%%% Begin members of your committee %%%%%%%%%%%%
%%%%%%%%%%%%     add more if you need to     %%%%%%%%%%%%
\hspace{7cm}\parbox{8cm}{\rule{7.5cm} {0.01cm} \hfill \\%
\Namea , \Degreea \hfill \\
\Univa \\*[\BaseDiff\baselineskip]%

%%%%%%%%%%%%
\rule{7.5cm} {0.01cm} \hfill \\%
\Nameb , \Degreeb \hfill \\
\Univb \\*[\BaseDiff\baselineskip]%
%%%%%%%%%%%%
}
 \vspace{1cm}
{\flushleft READERS:\\%
}
\hspace{7cm}\parbox{8cm}{\rule{7.5cm} {0.01cm} \hfill \\%
\Namec , \Degreec \hfill \\
\Univc \\*[\BaseDiff\baselineskip]%

%%%%%%%%%%%%
\rule{7.5cm} {0.01cm} \hfill \\%
\Named , \Degreed \hfill \\
\Univd \\*[\BaseDiff\baselineskip]%

%%%%%%%%%%%%
\rule{7.5cm} {0.01cm} \hfill \\%
\Namee , \Degreee \hfill \\
\Unive \\*[\BaseDiff\baselineskip]%
}
%%%%%%%%%%%% End members of your committee %%%%%%%%%%%%

    \setboolean{SetDSpace}{true}%
    \clearpage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        APPENDICES PAGE                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makeappendicespage}{%
    \chapter*{}
    \setboolean{SetDSpace}{false}%
    \thispagestyle{empty}%
    \GoSingle%
    \vspace*{\fill}
    \begin{RS@Cent}
      \addcontentsline{toc}{extrachapter}{APPENDICES}
			\bfseries	
			\begin{center}
			\LARGE{APPENDICES}
			\end{center}
    \end{RS@Cent}
    \vfill%
    \setboolean{SetDSpace}{true}%
    \clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Copyright Page                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makecopyright}{%
    \clearpage%
    \setboolean{SetDSpace}{false}%
    \thispagestyle{empty}%
    \GoSingle%
    \vspace*{\fill}%
    \begin{RS@Cent}%
    Copyright \textcopyright ~ \GradYear \\*[\BaseDiff\baselineskip]%
    by \\*[\BaseDiff\baselineskip]%
    \FullName%
    \end{RS@Cent}%
    \vfill%
    \setboolean{SetDSpace}{true}%
    \clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Dedication                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\dedication}[1]{%
    \begin{simpleenv}{#1}{}{}{}%
      \pagestyle{empty}%
      \GoSingle%
      \BigMargin\par%
      \GoDouble%
      #1%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Acknowledgments                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\acknowledgname}{ACKNOWLEDGMENTS}%
\newcommand{\acknowledge}[1]{%
    \setboolean{SetDSpace}{true}%
    \begin{simpleenv}{#1}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\acknowledgname}%
      \addcontentsline{toc}{extrachapter}{\acknowledgname}%
      #1%
    \end{simpleenv}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Abstract  English                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\abstractengname}{ABSTRACT}%
\newenvironment{abstracte}{%
    \clearpage%
%    \pagestyle{empty}%
    \setboolean{SetDSpace}{false}%
    \ifthenelse{\boolean{RS@Draft}}{\pagestyle{empty}}{\pagestyle{plain}}%
    \GoSingle%
%    \pagestyle{empty}%
    \addcontentsline{toc}{extrachapter}{ABSTRACT}%
    \begin{RS@Cent}%
    \BigMargin%
    Abstract of \ThesisType\ Presented to the Graduate School \\%
    of the University of Puerto Rico, R\'{i}o Piedras Campus in Partial Fulfillment of the \\%
    Requirements for the Degree of \DegreeType \\*[\BaseDiff\baselineskip]%
    \Title \\*[\BaseDiff\baselineskip]%
    By \\*[\BaseDiff\baselineskip]%
    \FullName \\*[\BaseDiff\baselineskip]%
    \GradMonth\ \GradYear \\*[\BaseDiff\baselineskip]%
    \end{RS@Cent}%
   % {\raggedright Chair: \Chair \\%
   % Major Department: \Department} %
    \setboolean{SetDSpace}{true}%
    \par%
    \GoDouble}%
    {\clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Abstract Spanish                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\abstractespname}{ABSTRACT SPANISH}%
\newenvironment{abstracts}{%
    \clearpage%
 %   \pagestyle{empty}%
    \setboolean{SetDSpace}{false}%
    \ifthenelse{\boolean{RS@Draft}}{\pagestyle{empty}}{\pagestyle{plain}}%
    \GoSingle%
 %   \pagestyle{empty}%
    \addcontentsline{toc}{extrachapter}{ABSTRACT SPANISH}%
    \begin{RS@Cent}%
    \BigMargin%
    Resumen de \ThesisTypes\ Presentado a Escuela Graduada \\%
    de la Universidad de Puerto Rico como requisito parcial de los\\%
    Requerimientos  para el grado de \DegreeTypes \\*[\BaseDiff\baselineskip]%
    \Titlesp \\*[\BaseDiff\baselineskip]%
    Por \\*[\BaseDiff\baselineskip]%
    \FullName \\*[\BaseDiff\baselineskip]%
    \GradMes\ \GradYear \\*[\BaseDiff\baselineskip]%
    \end{RS@Cent}%
    {\raggedright Consejero: \Chair \\%
    Departamento: \Departmento} %
    \setboolean{SetDSpace}{true}%
    \par%
    \GoDouble}%
    {\clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Biographical Sketch                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\biographyname}{BIOGRAPHICAL SKETCH}%
\newcommand{\biography}[1]{%
    \setboolean{SetDSpace}{true}%
    \begin{simpleenv}{#1}{}{}{}%
      \ifthenelse{\boolean{RS@Draft}}{\pagestyle{empty}%
        \let\ps@plain\ps@empty}{\pagestyle{myheadings}}%
      \markboth{}{}%
      \chapter*{\biographyname}%
      \addcontentsline{toc}{extrachapter}{\biographyname}%
      #1%
    \end{simpleenv}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%          Getting personal information and       %
%%          defining other miscellaneous commands  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\SetTitle}[1]{\renewcommand*{\Title}{{{\bf #1}}}}%
\newcommand*{\Title}{No Title Given}%
\@onlypreamble{\SetTitle}%
\newcommand*{\SetTitlesp}[1]{\renewcommand*{\Titlesp}{\uppercase{{\bf #1}}}}%
\newcommand*{\Titlesp}{No Title Given}%
\@onlypreamble{\SetTitlesp}%
\newcommand*{\SetFullName}[1]{\renewcommand*{\FullName}{#1}}%
\newcommand*{\FullName}{ASantana}%
\@onlypreamble{\SetFullName}%
\newcommand*{\SetThesisType}[1]{\renewcommand*{\ThesisType}{#1}}%
\newcommand*{\ThesisType}{THESIS OR DISSERTATION}%
\@onlypreamble{\SetThesisType}%
\newcommand*{\SetThesisTypes}[1]{\renewcommand*{\ThesisTypes}{#1}}%
\newcommand*{\ThesisTypes}{TESIS OR DISERTACION}%
\@onlypreamble{\SetThesisTypes}%
\newcommand*{\SetDegreeType}[1]{\renewcommand*{\DegreeType}{#1}}%
\newcommand*{\DegreeType}{UNDEFINED DEGREE}%
\@onlypreamble{\SetDegreeType}%
\newcommand*{\SetDegreeTypes}[1]{\renewcommand*{\DegreeTypes}{#1}}%
\newcommand*{\DegreeTypes}{GRADO NO DEFINIDO}%
\@onlypreamble{\SetDegreeTypes}%
\newcommand*{\SetSpecialty}[1]{\renewcommand*{\Specialty}{#1}}%
\newcommand*{\Specialty}{UNDEFINED SPECIALTY}%
\@onlypreamble{\SetSpecialty}%
\newcommand*{\SetGradMonth}[1]{\renewcommand*{\GradMonth}{#1}}%
\newcommand*{\GradMonth}{UNDEFINED MONTH}%
\@onlypreamble{\SetGradMonth}%
\newcommand*{\SetGradMes}[1]{\renewcommand*{\GradMes}{#1}}%
\newcommand*{\GradMes}{MES NO DEFINIDO}%
\@onlypreamble{\SetGradMes}%
\newcommand*{\SetGradYear}[1]{\renewcommand*{\GradYear}{#1}}%
\newcommand*{\GradYear}{UNDEFINED YEAR}%
\@onlypreamble{\SetGradYear}%
\newcommand*{\SetDepartment}[1]{\renewcommand*{\Department}{#1}}%
\newcommand*{\Department}{UNDEFINED DEPARTMENT}%
\@onlypreamble{\SetDepartment}%
\newcommand*{\SetDepartmento}[1]{\renewcommand*{\Departmento}{#1}}%
\newcommand*{\Departmento}{DEPARTAMENTO NO DEFINIDO}%
\@onlypreamble{\SetDepartmento}%
\newcommand*{\SetChair}[1]{\renewcommand*{\Chair}{#1}}%
\newcommand*{\Chair}{UNDEFINED Chair}%
\@onlypreamble{\SetChair}%

\newcommand*{\SetNamea}[1]{\renewcommand*{\Namea}{#1}}%
\newcommand*{\Namea}{UNDEFINED Graduate Commitee a}%
\@onlypreamble{\SetNamea}%
\newcommand*{\SetDegreea}[1]{\renewcommand*{\Degreea}{#1}}%
\newcommand*{\Degreea}{UNDEFINED Degree member a}%
\@onlypreamble{\SetDegreea}%
\newcommand*{\SetUniva}[1]{\renewcommand*{\Univa}{#1}}%
\newcommand*{\Univa}{UNDEFINED Degree member a}%
\@onlypreamble{\SetUniva}%

\newcommand*{\SetNameb}[1]{\renewcommand*{\Nameb}{#1}}%
\newcommand*{\Nameb}{UNDEFINED Graduate Commitee b}%
\@onlypreamble{\SetNameb}%
\newcommand*{\SetDegreeb}[1]{\renewcommand*{\Degreeb}{#1}}%
\newcommand*{\Degreeb}{UNDEFINED Degree member b}%
\@onlypreamble{\SetDegreeb}%
\newcommand*{\SetUnivb}[1]{\renewcommand*{\Univb}{#1}}%
\newcommand*{\Univb}{UNDEFINED Degree member b}%
\@onlypreamble{\SetUnivb}%

\newcommand*{\SetNamec}[1]{\renewcommand*{\Namec}{#1}}%
\newcommand*{\Namec}{UNDEFINED Graduate Commitee c}%
\@onlypreamble{\SetNamec}%
\newcommand*{\SetDegreec}[1]{\renewcommand*{\Degreec}{#1}}%
\newcommand*{\Degreec}{UNDEFINED Degree member c}%
\@onlypreamble{\SetDegreec}%
\newcommand*{\SetUnivc}[1]{\renewcommand*{\Univc}{#1}}%
\newcommand*{\Univc}{UNDEFINED Degree member c}%
\@onlypreamble{\SetUnivc}%

\newcommand*{\SetNamed}[1]{\renewcommand*{\Named}{#1}}%
\newcommand*{\Named}{UNDEFINED Graduate Commitee d}%
\@onlypreamble{\SetNamed}%
\newcommand*{\SetDegreed}[1]{\renewcommand*{\Degreed}{#1}}%
\newcommand*{\Degreed}{UNDEFINED Degree member d}%
\@onlypreamble{\SetDegreed}%
\newcommand*{\SetUnivd}[1]{\renewcommand*{\Univd}{#1}}%
\newcommand*{\Univd}{UNDEFINED Degree member d}%
\@onlypreamble{\SetUnivd}%

\newcommand*{\SetNamee}[1]{\renewcommand*{\Namee}{#1}}%
\newcommand*{\Namee}{UNDEFINED Graduate Commitee e}%
\@onlypreamble{\SetNamee}%
\newcommand*{\SetDegreee}[1]{\renewcommand*{\Degreee}{#1}}%
\newcommand*{\Degreee}{UNDEFINED Degree member e}%
\@onlypreamble{\SetDegreee}%
\newcommand*{\SetUnive}[1]{\renewcommand*{\Unive}{#1}}%
\newcommand*{\Unive}{UNDEFINED Degree member e}%
\@onlypreamble{\SetUnive}%


%\newcommand*{\SetNameChairDep}[1]{\renewcommand*{\NameChairDep}{#1}}%
%\newcommand*{\NameChairDep}{UNDEFINED Graduate Chairperson Department}%
%\@onlypreamble{\SetNameChairDep}%
%\newcommand*{\SetDegreeChairDep}[1]{\renewcommand*{\DegreeChairDep}{#1}}%
%\newcommand*{\DegreeChairDep}{UNDEFINED Degree Chairperson Department}%
%\@onlypreamble{\SetDegreeChairDep}%
%%    Adding personal notes to your text
\newboolean{ShowNotes}% Used to display private notes.
\setboolean{ShowNotes}{false}%
\newcommand{\NOTE}[1]{%
    \ifthenelse{\boolean{ShowNotes}}{%
    \begin{spacing}{1}%
    \par\noindent\marginpar{NOTE}%
    \parbox[t]{\textwidth}{\hrulefill\\%
    #1\\*[-0.5\baselineskip]%
    \hspace*{0.1in}\hspace{-0.1in}\hrulefill\\}%
    \vspace{0.25in}\end{spacing}}{}%
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Footnotes                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\footnotesep}{0.7\baselineskip}%
\addtolength{\footnotesep}{\BaseDiff\baselineskip}%
\setlength{\skip\footins}{2.5\baselineskip}%
\renewcommand{\footnoterule}{%
   \kern -3\p@
   \kern +8pt
   \hrule \@width 2in
   \kern -8pt
   \kern +2.6\p@}
\renewcommand{\@makefnmark}{%
  \hbox{\@textsuperscript{\normalfont\@thefnmark}}~}%
\renewcommand\@makefntext[1]{%
    \normalsize%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Figures and Tables                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\thefigure}{%
  {\ifnum \c@chapter>\z@ \thechapter--\fi \@arabic\c@figure}}%
\renewcommand{\thetable}{%
  {\ifnum \c@chapter>\z@ \thechapter--\fi \@arabic\c@table}}%
\newlength{\abovefigcaptskip}%
\newlength{\belowfigcaptskip}%
\newlength{\abovetabcaptskip}%
\newlength{\belowtabcaptskip}%
\newcommand{\mylen}{0.8} %%% This adjusts the spacing between caption and Figure/Table
\setlength{\abovefigcaptskip}{-5pt}%\abovecaptionskip}%
\setlength{\belowfigcaptskip}{-12pt}%\belowcaptionskip}%
\setlength{\abovetabcaptskip}{-10pt}%\belowcaptionskip}%
\setlength{\belowtabcaptskip}{\mylen\abovecaptionskip}%
\renewenvironment{table}
     {\setlength{\abovecaptionskip}{\abovetabcaptskip}%
      \setlength{\belowcaptionskip}{\belowtabcaptskip}%
      \@float{table}}
     {\end@float}
\renewenvironment{figure}
     {\setlength{\abovecaptionskip}{\abovefigcaptskip}%
      \setlength{\belowcaptionskip}{\belowfigcaptskip}%
      \@float{figure}}
     {\end@float}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  UPRM Thesis Multiple Index Generation          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\printindex}[4][\jobname]{%
    \IfFileExists{#1.ind}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{#1}{#2}{#3}{#4}%
      \pagestyle{plain} %
      \addcontentsline{toc}{extrachapter}{#2}%
      \chapter*{#3}{\GoDouble{#4}\par\GoSingle}%
      \input{#1.ind}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}
    {\typeout{No file #1.ind found.}}}%
\newcommand{\see}[2]{\emph{see} #1}%
\renewcommand{\makeindex}[1][\jobname]{\begingroup
  \makeatletter
  \if@filesw \expandafter\newwrite\csname #1@idxfile\endcsname
  \expandafter\immediate\openout \csname #1@idxfile\endcsname #1.idx\relax
  \typeout{Writing index file #1.idx }\fi \endgroup}
\@onlypreamble{\makeindex}%
\renewcommand{\index}[2][\jobname]{\@bsphack\begingroup
               \def\protect##1{\string##1\space}\@sanitize
               \@wrindex{#1}{#2}}
\renewcommand{\@wrindex}[2]{\let\thepage\relax
   \xdef\@gtempa{\@ifundefined{#1@idxfile}{}{\expandafter
      \write\csname #1@idxfile\endcsname{\string
      \indexentry{#2|RSpset}{\thepage}}}}\endgroup\@gtempa
   \if@nobreak \ifvmode\nobreak\fi\fi\@esphack}
\newcommand{\indxspace}{\par\vspace{\BaseDiff\baselineskip}}
\newcommand{\IndexSet}{%
\renewcommand{\@idxitem}{\par\setlength{\leftskip}{0pt}%
                         \setlength{\hangindent}{\RS@TOChdent}}%
\renewcommand{\subitem}{\par\setlength{\leftskip}{0.25in}%
                         \setlength{\hangindent}{\RS@TOChdent}}%
\renewcommand{\subsubitem}{\par\setlength{\leftskip}{0.5in}%
                         \setlength{\hangindent}{\RS@TOChdent}}%
\renewcommand{\indexspace}{}
\renewcommand{\indxspace}{\par\vspace{\BaseDiff\baselineskip}}
\renewenvironment{theindex}{%
                \setlength{\parindent}{\z@}%
                \parskip\z@ \@plus .3\p@\relax
                \setlength{\rightskip}{\@tocrmarg}%
                \setlength{\parfillskip}{-\rightskip}%
                \let\item\@idxitem}
} %% End of the IndexSet definition
\newcommand{\RSpnum}[1]{\makebox[\@pnumwidth][r]{#1}}
\newcommand{\RSnopnum}[1]{\makebox[\@pnumwidth][r]{}}
\newcommand{\RSpset}[1]{\RSpnum{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Fixing the enumerate and itemize environments  %
%%  by updating the general list parameters.       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\@listi}{\leftmargin\leftmargini
      \setlength{\topsep}{0in}%
      \setlength{\partopsep}{0in}%
      \setlength{\parsep}{0in}%
      \setlength{\leftmargin}{0.3in}%
      \setlength{\itemsep}{0in}}
\let\@listI\@listi
\@listi
\renewcommand*{\@listii}{\leftmargin\leftmarginii
      \labelwidth\leftmarginii
      \advance\labelwidth-\labelsep
      \setlength{\topsep}{0in}%
      \setlength{\parsep}{0in}%
      \setlength{\itemsep}{\parsep}}
\renewcommand*{\@listiii}{\leftmargin\leftmarginiii
      \labelwidth\leftmarginiii
      \advance\labelwidth-\labelsep
      \setlength{\topsep}{0in}%
      \setlength{\parsep}{0in}%
      \setlength{\partopsep}{0in}%
      \setlength{\itemsep}{\parsep}}
\ifthenelse{\boolean{RS@CPage}}{%
  \renewcommand{\ps@myheadings}{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\hfil\thepage\hfil}%
      \def\@oddhead{\hfil\thepage\hfil}%
      \let\@mkboth\@gobbletwo
      \let\chaptermark\@gobble
      \let\sectionmark\@gobble
      }
  }{}
%% Disabling some unused commands
\renewcommand{\author}{}
\renewcommand{\date}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  UPRRP Thesis Local Configuration                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\InputIfFileExists{ufthesis.cfg}{%
\typeout{***************************************}
\typeout{* Local config file ufthesis.cfg used *}
\typeout{***************************************}}{}
\typeout{ }
\typeout{*****************************************}
\typeout{*\space \space Finished with Thesis Template}
\typeout{*****************************************}
\typeout{ }
\AtBeginDocument{%
\typeout{**************************************}
\typeout{* Executing Begin Document Statement *}
\typeout{**************************************}
}
\endinput
%%
%% End of file `ufthesis.cls'.
