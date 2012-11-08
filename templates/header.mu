\documentclass[letterpaper,12pt]{letter}
\renewcommand{\rmdefault}{ptm}
\usepackage{scalefnt}
\usepackage{fancybox}
\usepackage{multirow}
\usepackage[final]{pdfpages}
\usepackage[margin=0.5in]{geometry}
\usepackage{graphicx}
\usepackage{array}
\usepackage{color}
\usepackage[none]{hyphenat}

\usepackage{eso-pic}
\newcommand\BackgroundPic{
\put(0,0){
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering
\includegraphics[width=\paperwidth,height=\paperheight,
{{=<% %>=}}
keepaspectratio]{<%&assets%>/background}%
<%={{ }}=%>
\vfill
}}}

\newcommand\LogoPic{
\put(0,0){
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering
\includegraphics[width=\paperwidth,height=\paperheight,
{{=<% %>=}}
keepaspectratio]{<%&assets%>/logo}%
<%={{ }}=%>
\vfill
}}}

\newcommand\BackBackgroundPic{
\put(0,0){
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering
\includegraphics[width=\paperwidth,height=\paperheight,
{{=<% %>=}}
keepaspectratio]{<%&assets%>/backbackground}%
<%={{ }}=%>
\vfill
}}}

\begin{document}
