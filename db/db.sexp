;; -*- mode:scheme; -*- 
;; THE ALAN TURING INSTITUTE TECHNICAL REPORTS SERIES DATABASE
;;
;; (c) The Alan Turing Institute 2024
;; Written by James Geddes <jgeddes@turing.ac.uk>
;; This file is openly licensed under CC BY-SA 4.0 

;; This file contains the metadata for all technical reports. The
;; format is a sequence of s-expressions, each of which describes one report.
;; It was inspired by the Cambridge Laboratory Technical Reports database.

;; Format
;; ------
;;
;; Each report is a list of the form
;; (report
;;   (<field-name> <field-value>)
;;   ... )
;;
;; Note that each field is list of two elements (not a pair!)
;; The <field-value> may be an atomic value or a list, depending on the field.
;;
;; The possible <field-names> are:
;;
;; number: a natural number
;; title: a string
;; authors: a list of authors, where an author is either a string (the
;;          name) or a list of a string followed by identifiers.
;; date: a list of up to three numbers, being the year, month, and day
;; keywords: a list of strings
;; doi: a string

;; TODO
;; - add abstracts
;; - add copyright date as an optional field

(report
 (number   1)
 (title    "Machine translation quality estimation literature review")
 (authors  (("Joanna Knight"   (orcid "https://orcid.org/0000-0002-2558-2815"))
	    ("Radka Jersakova" (orcid "https://orcid.org/0000-0001-6846-7158"))
	    ("James Bishop"    (orcid "https://orcid.org/0009-0003-0406-3367"))))
 (date     (2024 04))
 (keywords ("machine translation"
	    "quality estimation"
	    "pretrained language models"
	    "large language models"
	    "uncertainty quantification"
	    "explainable machine learning"))
 (doi       "10.5281/zenodo.10931558"))

(report
 (number   2)
 (title    "Autonomous cyber defence: Beyond games?")
 (authors  (("Chris Hicks" (orcid "https://orcid.org/0000-0002-6340-004X"))
	    ("Vasilios Mavroudis" (orcid "https://orcid.org/0000-0003-2667-5906"))))
 (date     (2024 04))
 (keywords ("reinforcement learning" "large language models" "autonomous agents" "cyber defence"))
 (doi      "10.5281/zenodo.10974183")
 (abstract
  "Cyber defence is one side of a dynamic and ever-evolving confrontation with attackers who seek to exploit weaknesses and cause unintended behaviour in digital systems. Historically both attackers and defenders have relied on human creativity and intellect to outdo one another, learning from each other’s tactics in a competitive,emergent, ad hoc curriculum. Modern cyber combatants increasingly rely on a variety of automated tools, machine learning; and perhaps more surprisingly, game playing in the pursuit of their goals. Whilst autonomous agents based on deep reinforcement learning have made tremendous breakthroughs playing complex strategy games such as Go, StarCraft, and Stratego, comparatively little progress has been witnessed in cyber defence games and the real-world problems they relate to. We highlight the current state of autonomous agents in cyber defence, presage their considerable future potential, and identify key research challenges both near and far.")
 )

(report
 (number   3)
 (title    "Benchmarking the performance of GPT-2 type applications on GPU-accelerated computing resources")
 (authors  (("Tomas Lazauskas" (orcid "https://orcid.org/0000-0002-8351-9857"))
	    ("David Llewellyn-Jones" (orcid "https://orcid.org/0000-0002-3836-7903"))))
 (date     (2024 08))
 (doi      "10.5281/zenodo.13349541")
 (keywords ("computer hardware"
	    "benchmarking"
	    "high-performance computing"
	    "parallel computation"
	    "distributed computation"
	    "GPU"))
 (abstract  "In this report we look at eight GPU-accelerated systems representing a cross-section of the available Tier 2 HPC systems in the UK. These include a mixture of GPU-accelerated platforms from Nvidia, AMD and Intel. For each system, we perform a set of benchmarking experiments by training a GPT-2 model using a mixture of parameters and hyperparameters. These include model size, number of GPUs,floating point data type, training data size, distribution strategies and batch size. Our interest is in performance measured by time taken to complete an epoch of training rather than convergence speed. We also measure memory usage. The overall aim is to compare systems in order to provide researchers intending to perform AI training with some benchmarks for what to expect in terms of training speed for a model in a non-optimised real-world scenario."))

(report
 (number   4)
 (title    "Practical Perspectives on Black-Box Critical Error Detection for Machine Translation")
 (authors  (("Joanna Knight"   (orcid "https://orcid.org/0000-0002-2558-2815"))
	    ("Radka Jersakova" (orcid "https://orcid.org/0000-0001-6846-7158"))
	    ("James Bishop"    (orcid "https://orcid.org/0009-0003-0406-3367"))))
 (date     (2025 01))
 (doi      "10.5281/zenodo.14639667")
 (keywords ("machine translation"
	    "quality estimation"
	    "pretrained language models"
	    "large language models")))

;; (report
;;  (number   A)
;;  (title    "RCTab: An Azure subscription management system")
;;  (authors (("Iain Stenson" (orcid "0000-0001-7848-4154"))
;; 	   ("Tomas Lazauskas" (orcid "0000-0002-8351-9857"))
;; 	   ("Oscar Giles" (orcid "0000-0002-4056-1916"))
;; 	   ("Joseph Palmer" (orcid "0000-0002-5593-9352"))
;; 	   ("Pamela Wochner" (orcid "0000-0003-4066-8614"))
;; 	   ("Eseoghene Ben-Iwhiwhu" (orcid "0000-0002-1176-866X"))))
;;  (date     (2025 01))
;;  (doi      "")
;;  (keywords "TBD"))
