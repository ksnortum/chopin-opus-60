%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

%%% Scheme

affect-TieColumn =
#(define-music-function (offsets)(list?)
#{
  \once
    \override TieColumn.after-line-breaking =
      #(lambda (grob)
        (let* ((ties (ly:grob-array->list (ly:grob-object grob 'ties)))
               (c-ps
                 (map
                   (lambda (tie) (ly:grob-property tie 'control-points))
                   ties)))

      (define (offset-control-points coords offsets)
       (if (null? offsets)
           (car c-ps)
           (map
             (lambda (x y) (coord-translate x y))
             coords offsets)))

       (define (help offs pts new-pts)
         (if (null? offs)
             (reverse new-pts)
             (help (cdr offs) (cdr pts)
               (cons (offset-control-points (car pts) (car offs)) new-pts))))

      (for-each
         (lambda (tie cpts) (ly:grob-set-property! tie 'control-points cpts))
         ties
         (help offsets c-ps '()))))
#})

%%% Definitions

tieWaitOn = \set tieWaitForNote = ##t
tieWaitOff = \set tieWaitForNote = ##f

%%% Positions and Shapes

tieColumnA =
  \affect-TieColumn #'(
                        ((0 . 0) (0 . -2) (0 . -1) (0 . 0))  ;; bottom
                        ((0 . 0) (0 . 0) (-1 . 0) (-1 . 0)) ;; top
                      )

hShiftA = \once \override NoteColumn.force-hshift = 0
hShiftB = \once \override NoteColumn.force-hshift = -0.25

%%% Music

global = {
  \time 12/8
  \key a \major
  \set Staff.extraNatural = ##f
}

rightHandUpper = \relative {
  \voiceOne 
  s1.| \break
  <cs'' es cs'>8 gs' cs,  \voiceOne \hShiftB cs4.~(  cs8 b! cs  <d, e b' d>
    <gs e' gs> <fs d' fs>) |
  
}

rightHandLower = \relative {
  \voiceFour 
  s1. | \break
  s4. \voiceOne \tieWaitOn
    << 
      { \hShiftA e'4.*1/3~ gs4^~ \tieColumnA } 
      \new Voice { \mergeDifferentlyDottedOn \voiceFour e8 gs cs, } 
    >>
    \voiceFour <e gs> \tieWaitOff <d! gs> <d fs>  s4. |
  
}

rightHand = {
  \global
  \mergeDifferentlyDottedOn
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

%%% Output

\paper {
  ragged-right = ##t
}

\score { 
  \keepWithTag #'layout
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
  >>
  \layout {}
}
