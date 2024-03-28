#lang scribble/html

@(require scribble/html/extra
	  "db-table.rkt")

@xhtml{

 @head{
  @title{Turing Technical Reports Series}
  @meta[name: "viewport" content: "width=device-width, initial-scale=1.0"]
  @style[@include["site.css"]]
 }

 @body{
  @header{
   The Alan Turing Institute Technical Reports Series (DRAFT)

   @p{This microsite is not official and will be replaced.}
  }

  @main{

   @h2{Table of Reports}
	
   @p{The Turing Technical Reports Series is a public, citable
    repository of technical reports. It is suitable for publication of
    long-form reports, project reports to funders, material that is
    primarily expository, case studies, position papers, and PhD
    theses.  (This list is not exhaustive.) It is not suitable for
    articles that are destined for publication in a journal or
    conference proceedings.}

   @(table-of-reports "../db/db.sexp")

   @h2{Submission instructions}

   @p{Please email @a[href:
    "mailto:tech-reports@turing.ac.uk"]|{tech-reports@turing.ac.uk}|
    from your Turing email account attaching a copy of the report you
    wish to publish (which need not be final). We will ask you to
    provide a title, abstract, and author list, and possibly other
    metadata. These should use only Unicode text.}

   @p{The editorial process is lightweight but not non-existent:}

   @ul{
    @li{
	
     @p{Technical reports are intended to be of interest to some part
      of the AI or data science community (although it is fine if that
      part consists predominantly of the Turing Institute itself).}

     @p{We expect that most reports produced by members of the Turing
      will be suitable but the series is not intended as an archive of
      @em{all} material generated in the course of our work. If there
      is any debate as to the suitability of a particular report for
      inclusion in this series, the views of the Chief Scientist and
      the relevant Science and Innovation Director will be sought.}

     }
     @li{
	 
     @p{Technical Reports should be of “publication quality,” written
      in a professional tone and prepared carefully, with attention to
      such details as references, spelling, formatting, and general
      accuracy. For example principles for scholarly work, see the
      general submission instructions from arXiv.}}

    @li{

     @p{The final report should be a pdf, formatted for A4 paper. Page
      numbering should start on page 3, as a standard cover sheet will
      be added.}
    }
   }

   @p{We expect that these instructions will change over time. Please
let the editors know if the current process could be improved or is
not working for you.}

   
  }
 }
}



