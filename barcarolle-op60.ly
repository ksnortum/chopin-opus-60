%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

#(set-global-staff-size 18)

\header {
  title = "Barcarolle"
  composer = "Frédéric Chopin"
  opus = "Op. 60"
  maintainer = "Knute Snortum"
  maintainerEmail = "knute (at) snortum (dot) net"
  source = "https://vmirror.imslp.org/files/imglnks/usimg/f/f5/IMSLP54943-PMLP02633-0Chopin_Berceuse_Barcarolle_etc_Op_60_Peters_scan.pdf"
  copyright = \markup { 
    \center-column {
      "Copyright © 2024 Knute Snortum. This work is licensed under the" 
      \with-url #"https://creativecommons.org/licenses/by-sa/4.0/" 
      "Creative Commons Attribution-ShareAlike 4.0 International License."
    }
  }
}

%%% Scheme

beamBreak =
#(define-music-function (music) (ly:music?)
  #{
    \set stemRightBeamCount = #1
    #music 
    \set stemLeftBeamCount = #1
  #})

%%% Definitions

sd = \sustainOn
su = \sustainOff

staffUp   = \change Staff = "upper"
staffDown = \change Staff = "lower"

strictGraceOn = {
  \override Score.SpacingSpanner.strict-note-spacing = ##t
  \newSpacingSection
}

strictGraceOff = {
  \revert Score.SpacingSpanner.strict-note-spacing
  \newSpacingSection
}

hideNoteHeadOn = {
  \omit Stem
  \omit Dots
  \omit Flag
  \hideNotes
  \override NoteColumn.ignore-collision = ##t
}

hideNoteHead = \once \hideNoteHeadOn

hideNoteHeadOff = {
  \undo \omit Stem
  \undo \omit Dots
  \undo \omit Flag
  \unHideNotes
  \revert NoteColumn.ignore-collision
}

subdivideEighths = {
  \set subdivideBeams = ##t
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = 2,2,2,2
}

subdivideOff = {
  \set subdivideBeams = ##f
  \unset baseMoment
  \unset beatStructure
}

hairpinNoBreak = \override Hairpin.after-line-breaking = ##f
hairpinNoBar = \override Hairpin.to-barline = ##f
trillUnderSlur = \tweak avoid-slur #'inside \etc
trillSpanUnderSlur = \tweak outside-staff-priority ##f \etc
spannerStyleNone = \once \override DynamicTextSpanner.style = #'none
tieWaitOn = \set tieWaitForNote = ##t
tieWaitOff = \set tieWaitForNote = ##f
slashFlag = \once \override Flag.stroke-style = "grace"
positioningDone = \once \override TieColumn.positioning-done = ##t

%%% Positions and Shapes

slurShapeA = \shape #'((0 . -0.5)(0 . -0.5)(0 . -0.5)(0 . -0.5)) \etc 
slurShapeB = \shape #'((0 . 0.5)(0 . 0.5)(0 . 0.5)(0 . 0.5)) \etc 
slurShapeC = \shape #'((0 . 0.5)(0 . 0.7)(0 . 0.7)(0 . 0.5)) \etc 
slurShapeD = \shape #'((-0.2 . 0.3) (-0.2 . 0) (-0.2 . 0) (-0.2 . 0)) \etc
slurShapeE = \shape #'((0.1 . 0.4) (0.1 . 0.4) (0.2 . 0.3) (0.2 . 0.3)) \etc
slurShapeF = 
  \shape #'((-0.2 . -0.2) (-0.2 . -0.2) (0.2 . -0.3) (0.2 . -0.3)) \etc
slurShapeG = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . -2))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                      ) \etc
slurShapeH = \shape #'((0 . -1) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeI = \shape #'((0 . -2) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeJ = \shape #'((0 . 0) (0 . -2) (0 . -1) (0 . 2)) \etc
slurShapeK = \shape #'((0 . 2) (0 . -1) (0 . -1) (0 . 3)) \etc
slurShapeL = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . -1) (0 . 0) (0 . 0))
                      ) \etc
slurShapeM = \shape #'((0 . 1) (0 . -1) (0 . 0) (0 . 0)) \etc
slurShapeN = \shape #'((0 . 0) (0 . -2) (0 . 1) (0 . 0)) \etc
slurShapeO = \shape #'(
                        ((0 . 2) (0 . 2) (0 . 2) (0 . 2))
                        ((0 . 2) (1 . 2) (0.5 . 0.5) (0 . 0))
                      ) \etc
slurShapeP = \shape #'((0 . 0) (0 . -1) (0 . 1) (0 . 0)) \etc
slurShapeQ = \shape #'((0 . 2) (0 . 2) (0 . 2) (0 . 2)) \etc
slurShapeR = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0.5 . 0) (0 . 0) (0 . 1) (0 . -1))
                      ) \etc
slurShapeS = \shape #'((0 . -2.5) (-0.5 . -0.5) (0 . -0.5) (0 . 0)) \etc
slurShapeT = 
  \shape #'((-0.25 . -3) (-0.9 . -2) (-0.5 . -1.25) (-0.5 . -1)) \etc
slurShapeU = \shape #'(
                        ((0 . -1) (0 . 0) (0 . 1) (0 . 1))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                      ) \etc
slurShapeV = \shape #'((0 . 0) (0 . 1.5) (0 . 2) (0 . 0)) \etc
slurShapeW = \shape #'(
                        ((0 . 3) (0 . 3) (0 . 3) (0 . 3))
                        ((0 . 5) (0 . 5) (0 . 2) (0 . 0))
                      ) \etc
slurShapeX = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . -0.75)) \etc
slurShapeY = \shape #'((0 . 0) (0 . 0.5) (0 . 0) (0 . 0)) \etc
slurShapeZ = \shape #'(
                        ((0 . 0.4) (0 . 0.25) (0 . 0.25) (0 . 0.4))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                      ) \etc
slurShapeAA = \shape #'((0 . 0) (0 . 1) (0 . 1) (0 . 0)) \etc
slurShapeAB = \shape #'((0 . 0) (0 . 1) (0 . 1) (0 . 0)) \etc
slurShapeAC = \shape #'((0 . 0) (0 . 0) (0 . 0.5) (0 . 0)) \etc
slurShapeAD = \shape #'((0 . 0) (0 . 0) (0 . 1.5) (0 . 0)) \etc
slurShapeAE = \shape #'((0 . 0) (0 . 0.5) (0 . 1) (0 . 0)) \etc
slurShapeAF = \shape #'((0 . 0) (0 . 0.5) (0 . 1.5) (0 . 0)) \etc
slurShapeAG = \shape #'((0 . 0) (0 . 0) (0 . 0) (3 . 0)) \etc
slurShapeAH = \shape #'(
                         ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                         ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                         ((0 . 0) (0 . 0) (0 . 0) (3 . 0))
                       ) \etc
slurShapeAI = \shape #'((-1.5 . 0.25) (-1 . 0) (0 . 0.75) (0 . 0)) \etc
slurShapeAJ = \shape #'((0 . -2) (0 . 1) (0 . 0) (0 . 0)) \etc
slurShapeAK = \shape #'((0 . -0.3) (0 . 0.1) (0 . 0) (0 . 0)) \etc
slurShapeAL = \shape #'(
                         ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                         ((0.5 . 0) (0 . 0) (0 . 0) (0 . 0))
                       ) \etc
slurShapeAM = \shape #'(
                         ((-1 . 4.25) (-1 . 4.25) (0 . 4.25) (0 . 4.25))
                         ((0.25 . 0) (0.25 . 0) (0 . 0) (0 . 0))
                       ) \etc

tieShapeA = \shape #'((0 . 0) (0 . 0) (1 . 0) (1 . 0)) \etc
tieShapeB = \shape #'((0 . 0) (0 . -0.25) (0 . -1) (0 . 0)) \etc
tieShapeC = \shape #'((0.25 . -0.5) (0 . -0.5) (0 . -0.5) (-0.25 . -0.5)) \etc
tieShapeD = 
  \shape #'((0.5 . 1.25) (0.5 . 1.25) (-1.5 . 1.75) (-1.5 . 1.75)) \etc
tieShapeE = \shape #'((0.5 . 0.75) (0.5 . 0.9) (-2 . 0.9) (-2 . 0.75)) \etc

rotateHairpinA = \once \override Hairpin.rotation = #'(10 -1 0)
rotateHairpinB = \once \override Hairpin.rotation = #'(15 -1 0)

moveHairpinA = \tweak Y-offset 4 \etc
moveHairpinB = \tweak Y-offset 2.5 \etc
moveHairpinC = \tweak Y-offset 3 \etc
moveHairpinD = \tweak Y-offset 3 \etc
moveAccentA = \offset Y-offset -0.5 \etc
moveTrillA = \tweak Y-offset 5 \etc
moveTrillB = \tweak Y-offset 6 \etc
moveNoteA = \once \override NoteColumn.force-hshift = -0.5
moveNoteB = \once \override NoteColumn.force-hshift = 1.5
moveNoteC = \once \override NoteColumn.X-offset = 0.75
moveNoteD = \once \override NoteColumn.force-hshift = -0.5
moveNoteE = \once \override NoteColumn.force-hshift = 0
moveNoteF = \once \override NoteColumn.force-hshift = -0.25
moveClefA = \once \override Staff.Clef.extra-offset = #'(0.5 . 0)
moveDotA = \tweak Dots.extra-offset #'(0 . 1) \etc
moveOttavaA = \once \override Staff.OttavaBracket.extra-offset = #'(0 . 1)

%%% Markup

cantabile = \markup \large \italic cantabile
rallent = \markup \large \italic rallent.
ten = \markup \large \italic ten.
sotoVoce = \markup \large \italic "soto voce"
sempreP = \markup { \large sempre \dynamic p }
sempreF = \markup { \large sempre \dynamic f }
legato = \markup \large \italic legato
sempreLegato = \markup \large \italic "sempre legato"
trillSharp = \markup \teeny \sharp
trillNatural = \markup \teeny \natural
pocoPiuMosso = \markup \large \italic "poco più mosso"
dolceSfogato = \markup \large \italic "dolce sfogato"
ritenuto = \markup \large \italic ritenuto
calando = \markup \large \italic calando
leggiero = \markup \large \italic leggiero
mg = \markup \large \italic m.g.
dimMarkup = \markup \large \italic dim.

%%% Music

global = {
  \time 12/8
  \key fs \major
  \set Staff.extraNatural = ##f
}

rightHandUpper = \relative {
  \hairpinNoBreak \hairpinNoBar
  r4 r8 \voiceOne gs''2.~(  gs8 fs gs |
  fs8 es fs  ds4 es8  ds cs ds  b ds cs |
  b8 as b  gs b as) \oneVoice r2. |
  R1. * 2 |
  r4 r8 \once \stemUp <as cs>4.~(^\cantabile q8 <gss bs> <as cs> \acciaccatura
    { es' } <b ds> <as cs>^\< <fs as> |
  <ds' fs>8\! <fs, as> <b ds>  <as cs> <cs, fs> <gs' b>  \voiceOne as2. |
  \oneVoice <ds, b' fs'>8-.)\arpeggio r r \acciaccatura { fs } <ds' fs>4.~
    -\slurShapeG ( q8 <css es!> <ds fs>  \acciaccatura { as' } <es gs>
    <ds fs>^\< <b ds> |
    
  \barNumberCheck 9
  <gs' b>8\! <b, ds> <cs! es>  <ds fs> <fs, b> <gss bs>  \voiceOne ds'8 cs4 
    as4. |
  \oneVoice \acciaccatura { <ds, fs as>8 } fs'-.) r r  <as, fs'>4.~( q8
    \slashedGrace { <b\=1 -\slurShapeA ( gs'\=2 -\slurShapeB ^(> } <as\=1)
    fs'\=2)> <gs es'>  q8 \slashedGrace { <as\=1 -\slurShapeA ( 
    fs'\=2 -\slurShapeB ^(> } <gs\=1) es'\=2)>^\< <fs ds'> |
  \voiceOne ds'4.)\! \after 4. \! as2.(^\>  gs8\trill fss16 gs bs as |
  gs4) cs8( cs4 cs8 cs4 cs8  cs8\trill bs16^\< cs gs' fs\! |
  fs8 es ds  es ds8. es16  cs4 cs8  cs16-\trillUnderSlur \trill bs-. cs-. ds-.
    es-. fs-. |
  gs8-.)\arpeggio \oneVoice r r <es cs'>4.(  <ds bs'>16-.)^\leggiero <bs gs'>-.
    <cs as'>-. <as fs'>-. <bs gs'>-. <gs es'>-.  <as fs'>-. <fs ds'>-.
    <gs es'>-. <es cs'>( <fs ds'> <gs, gs'> |
  <es' cs'>4) r8 <fs ds'>16(^\> <ds bs'> <fs ds'> <cs as'> <fs ds'> <gs, gs'>\!
    <es' cs'>4) r8 <fs ds'>16(^\> <ds bs'> <fs ds'> <cs as'> <fs ds'> 
    <gs, gs'>\! |
  <es' cs'>4) r8  \acciaccatura { fs } <es gs cs>4.-\moveAccentA ->^(
    \acciaccatura { fs8 } <es gs cs>4.-\moveAccentA -> \acciaccatura { fs8 }
    <es gs cs>4.-\moveAccentA -> |
    
  \barNumberCheck 17
  \acciaccatura { fs8 } <e gs cs>4.->)  q8.( <fs ds'>16 <gs cs e>8
    <b, e gs>4.)  \strictGraceOn \grace { gs'16[ as] } \slashedGrace { b8 }
    \strictGraceOff \afterGrace 15/16 <e, as>4.(\startTrillSpan 
    { gs16\stopTrillSpan as } |
  <ds, b'>4) r8  <e cs'>16(^\> <cs as'> <e cs'> <b gs'> <e cs'> <fs, fs'>\!
    <ds' b'>4)  r8  <e cs'>16(^\> <cs as'> <e cs'> <b gs'> <e cs'> 
    <fs, fs'>\! |
  <ds' b'>4.)  \voiceOne as'8.( b16 fs8  \grace { fs16[ gs] } 
    \slashedGrace { as8 }  \afterGrace 15/16 gs2.-\trillSpanUnderSlur
    \startTrillSpan { fs16\stopTrillSpan gs } |
  <css, as'>8-.) r s \voiceOne ds' s4  s es8-\slurShapeO (  \slashedGrace {
    es } \afterGrace 15/16 ds4.-\trillSpanUnderSlur \startTrillSpan { 
    es16\stopTrillSpan ds } |
  <es, as css>8-.) r s \voiceOne ds' s4  s es8-\slurShapeQ (  \slashedGrace {
    es } \afterGrace 15/16 ds4.-\trillSpanUnderSlur \startTrillSpan { 
    es16\stopTrillSpan ds } |
  \oneVoice <es, as css>8-.) r <es as>^(  <fs ds'>16 <ds b'> <fs ds'>
    <cs! as'> <fs ds'> <b, gs'>  <as as'>8-.) r <es' as>-\slurShapeAL ^\(
    <fs ds'>16 <ds b'> <fs ds'> <cs as'> <fs ds'> <b, gs'> |
  \acciaccatura { as8*1/4 } \afterGrace 5/6 as'2.-\trillSpanUnderSlur 
    -\moveTrillA \startTrillSpan { <b\=1 -\slurShapeA ( ds\=2 -\slurShapeB ^(>8
    \stopTrillSpan } \stemUp <as\=1) css\=2)>2.-\trillSpanUnderSlur
    -\moveTrillB \startTrillSpan |
  \slashedGrace { <b\=1 -\slurShapeD ( ds\=2 -\slurShapeC ^(>8\)\stopTrillSpan
    } \afterGrace 15/16 <as\=1) cs!\=2)>2.~\(\startTrillSpan
    { <as\=1 -\slurShapeF ( cs\=2 -\slurShapeE ^(>8\stopTrillSpan } 
    <as\=1) cs\=2)>8 <gss bs> <as cs> \acciaccatura { es' } <b! ds>
    <as cs>^\< <fs as> |
    
  \barNumberCheck 25
  \stemNeutral <ds' fs>8.\! <cs es>16 <b ds> <cs es>  q <b ds> <as cs> <b ds>
    q <as cs>  \voiceOne as2. \oneVoice |
  \acciaccatura { <ds, b'>8 } fs'8\) r r \afterGrace 15/16 { <ds fs>2.~(
    \startTrillSpan q4. } { <css es>16\stopTrillSpan <ds fs> } |
  <gs b>8. <fs as>16 <es gs> <fs as>  q <as, cs> <es' gs> <gs, b> <ds' fs>
    <gss, bs>  <b ds>8 <as cs> <cs, gs'>  <fs as>4. |
  \acciaccatura { <e as>8 } gs'8-.) r r <as, e' gs>4.~( q8 <as ds fs>
    <gs as e'>  <fs b ds>16 <e fs cs'> <ds fs b>8) r |
  \acciaccatura { <fs bs>8 } as'8-. r r <bs, fs' as>4.~-\slurShapeAK (  q8 
    <bs es! gs> <as bs fs'>  \stemDown <gs cs es>16 <fs gs ds'> <es gs cs>8)
    <gs cs es>\( |
  \slashedGrace { <gs es'>8~ } <es' b'!>4.->  \tieDown \slashedGrace 
    { <gs, e'>8~ } <e' b'>4.->  \slashedGrace { <gs, ds'>8~^( } <ds' b'>)
    \slashedGrace { <e\=1 -\slurShapeA ( cs'\=2^(> } <ds\=1) b'\=2)>8.
    <cs as'>16  q8 \slashedGrace { <ds\=1 -\slurShapeA ( b'\=2 -\slurShapeB
    ^(>^~ } <cs\=1) ds as'\=2)> <as cs ds> |
  \voiceOne <gs ds' gs>4.\) <fss ds'>( <ds ds'>4 es'!8  fs!\trill es16 fs 
    ds gs |
  \oneVoice <cs,, fs gs>8-.) <fs gs b>-.( <fs gs cs>-.  <fs gs b ds>-.
    <gs b ds es>-. <gs b ds fs>-.  <b ds fs gs>-. <b ds fs as>-. <ds fs gs b>-.
    <fs gs b cs>-. <fs gs b ds>16-.) r\fermata <es, b' cs es>8( |
    
  \barNumberCheck 33
  \acciaccatura { <b' cs>8~ } <fs as cs fs>4.)  \stemDown <b gs'>16(^\>
    <gs es'> <b gs'>  <fs ds'> <b gs'> <cs, cs'>\!  <as' fs'>4) r8
    <b gs'>16(^\> <gs es'> <b gs'>  <fs ds'> <b gs'> <cs, cs'>\! |
  \acciaccatura { b'8 } <as cs fs>4.) \acciaccatura { b8 } <as cs fs>4.(
    \acciaccatura { b8 } <as cs fs>4. \acciaccatura { b8 } <as cs fs>4. |
  \acciaccatura { b8 } <a cs fs>4.*1/3) \hideNoteHead \stemNeutral cs,4
    -\slurShapeR ^( r r8  cs fs d  cs b d |
  cs8 fs d  cs b d  cs fs d  cs cs' fs, |
  gs8 fs e  fs e d  e d cs  d cs b |
  \voiceOne cs8 fs cs  d fs b,  cs fs a,  b fs' cs |
  \bar "||"
  \key a \major
  <a a'>1.)~^\ten |
  a'2.~(  a8 fs gs  a fs gs |
  
  \barNumberCheck 41
  \acciaccatura { b8^\< } a4 gs8  a4 b8  cs4.)\! cs~(^\> |
  cs4.~  cs8\! bs8. gs16  gs2.*1/2)^\ten  gs,4 as8 |
  \oneVoice bs16\( ds gs bs ds gs  \slashedGrace { gs8-\slurShapeT ^( } 
    gs'8-.)\)\noBeam ds,,^(^\> as  bs ds as  bs ds as\! |
  \voiceOne gs'4.~  gs8 es fss  gs es fss  gs es fss |
  \acciaccatura { as8^\< } gs4 fss8  gs4 as8  b4.)\!  b~(^\> |
  b4.~  b8\! as8. fs16  fs2.*1/2) fs,4 gs8 |
  \oneVoice as16\( cs fs as cs fs  \slashedGrace { fs8-\slurShapeT ^( } 
    fs'8-.)\)\noBeam \clef bass s4  s4 \voiceOne fs,,8( e!4 fs8 |
  d!2. cs4) cs8-\slurShapeU (  e!4 fs8 |
    
  \barNumberCheck 49
  d1. |
  \oneVoice <es, cs'>8) gs( cs  \clef treble \voiceOne es gs cs \appoggiatura
    { cs16 ds } <e, gs cs>8 <ds bs'> <e cs'>  <gs cs e!> <fs d'> <d gs b> |
  \oneVoice \acciaccatura { <cs a' cs>8) } a''8-. e4~\startTrillSpan
    \afterGrace 7/8 e4._( { ds16\stopTrillSpan e) }  <a, cs a'>8( <fs e' fs>
    <gs b gs'>  <a cs a'> <fs e' fs> <gs b gs'> |
  \voiceOne <a a'>4 <gs gs'>8 <a a'>4 <b b'>8)  <cs cs'>4.*2/3( \hideNoteHead
    a8)  <cs cs'>4.*2/3( \hideNoteHead fss,8) |
  <cs' cs'~>4.( q8 <bs bs'>8. <gs -\tieShapeA _~ gs'>16  
    << { \hideNoteHead gs4. } \new Voice { \voiceOne <ds' gs>4. } >>  
    <\moveDotA ds, gs>4.*2/3 \hideNoteHead gs,8) |
  \omit TupletBracket
  \subdivideEighths
  \oneVoice gs16[( gs' \tuplet 3/2 8 { bs, ds gs  gs gs' gs] } gs'8-.)\noBeam
    \subdivideOff ds,,8( as  bs ds <as as'>  <bs bs'> <ds ds'> as' |
  <gs bs gs'>8-.) ds'4~^\trillSharp\startTrillSpan \afterGrace 7/8 ds4._( 
    { css16\stopTrillSpan ds) }  <gs, bs gs'>8( <es ds' es> <fss as fss'>
    <gs bs gs'> <es ds' es> <fss as fss'> |
  \voiceOne <gs gs'>4 <fss fss'>8  <gs gs'>4 <as as'>8  <b b'>4.*2/3)(
    \hideNoteHead gs8)  <b b'>4.*2/3( \hideNoteHead gs8) |
    
  \barNumberCheck 57
  <b b'~>4.(  q8 <as as'>8. <fs_~ fs'>16
    << { \hideNoteHead fs4. } \new Voice { \voiceOne <cs' fs>4. } >>
    <cs, fs>4.*2/3 \hideNoteHead fs,8) |
  \subdivideEighths
  \oneVoice fs16[( fs' \tuplet 3/2 8 { as, cs fs  fs fs' fs] } 
    \subdivideOff \moveNoteC fs'8-.)\noBeam \moveClefA \clef bass s4  s4 
    \voiceOne fs,,8(^\< e!4 fs8)\! |
  \after 8 \! d!2.-\slurShapeV (^\> \hideNoteHead cs4) \clef treble <cs cs'>8(
    <e! e'!>4 <fs fs'>8 |
  <d d'>2. \subdivideEighths \oneVoice bs16[ d a' bs \tuplet 3/2 { d a' a] }
    \subdivideOff a'8-.) r <bs,,, fs' bs>8^( |
  <cs es cs'>8 gs' cs,)  \voiceOne \moveNoteF cs'4.~(  cs8 b! cs  <d, e b' d>
    <gs e' gs> <fs d' fs>) |
  \oneVoice <e cs' e>4(^\pocoPiuMosso <ds bs' ds>8  <d b' d>4 <gs bs>8
    <cs, a' cs>4) <e cs' e>8(  <a cs a'>4 <gs e' gs>8 |
  \stemDown <fs d' fs>8 <e cs' e> <d b' d>  <fs d' fs>4 \stemNeutral <gs b>8
    <cs, a' cs>4.) <e cs' e>~( |
  q4 <ds bs' ds>8~  q8 <d b' d> <gs bs>  \stemDown <cs, a' cs> <e cs' e>
    <a cs a'>  <a fs' a>4 <gs e' gs>8) |
    
  \barNumberCheck 65
  q8( <fs d' fs> <e cs' e>  <fs d' fs>4 \stemNeutral <gs b>8  <cs, a' cs>4.)
    <cs e cs'>4.->~^( |
  q8 <bs ds bs'> <e gs e'>~  q4 <ds fs ds'>8  <cs e cs'> <ds fs ds'> <e gs e'>)
    <e as e'>4.~( |
  <e e'>8 <ds ds'> <e gs e'>  <fs a! fs'> <gs b gs'> <a cs a'>~  <a fs' a>
    <gs e' gs> <a fs' a>  <gs e' gs> <fs d' fs> < gs e' gs> |
  <fs d' fs>8 <e cs' e> <ds bs' ds>  <d b' d>4 <gs bs>8  <cs, a' cs>4)
    \stemDown <e cs' e>8(  <a cs a'>4 <gs e' gs>8 |
  <gs e' gs>8 <fs d' fs> <e cs' e>  <fs d' fs>4 \stemNeutral <gs b>8
    <cs, a' cs>4.) \strictGraceOn \grace { e16^( <cs' e> e_~ } \strictGraceOff
    <e_~ cs'-\tieShapeC ^~ e^~>4.)( \positioningDone |
  q8 <ds bs' ds>8. <d b' d>16  q8 <cs a' cs> <bs gs' bs>  <cs e' cs>
    <e cs' e>8. <a cs a'>16  q8-.) r e, -\slurShapeW ^( |
  \afterGrace 15/16 e1.-\trillSpanUnderSlur \startTrillSpan { ds16
    \stopTrillSpan e gs g } |
  \voiceOne fs2.)~(^\>  fs4\! f8~  f^\< \acciaccatura { \once \slurDown g }
    f e\! |
    
  \barNumberCheck 73
  g4) fs!8~(  fs4.~  fs8 b f~  f \acciaccatura { \once \slurDown g! } f e |
  g4) fs!8->~(  fs4.~  fs4 f8  f4 f8 |
  f2.~ f4) f8->~(  f4 f8->~ |
  f4 es8  fs4 \clef bass \oneVoice <fs, bs>8  <es cs'>) r \clef treble
    <gs cs gs'>8^(  <as cs fss>4 <gs bs fs'>8 |
  <gs cs es>8) r8 <gs cs gs'>8(  <a! cs a'!>4 <a d! fs>8  <a ef' f>4 
    <gs d' es>8  <fs! cs'! fs!>4 \clef bass <fs bs>8 |
  <es cs'>8) r r \clef treble gs''4.( \tuplet 10/12 { fss16[ gs es' 
    \beamBreak ds cs es, fs gs bs as] } |
  gs8 fs8. es16  es8 ds es  ds cs8. bs16  bs8 as bs |
  as4 gs8)  fss16( gs as bs cs ds  es fs! gs as bs cs  ds es fs gs \ottava 1
    es' ds |
    
  \barNumberCheck 81
  cs as fs gs bs as  fs ds as bs es ds  \ottava 0 cs as! fs gs bs! as  fs ds as
    bs es ds) |
  \grace { bs16[^( cs] } \slashedGrace { ds8 } cs4.~\startTrillSpan 
    cs8\stopTrillSpan bs16 cs es ds  bs cs es, fs bs, cs  es fs bs cs es ds |
  bs cs fs, fss bs, cs  fs fss bs cs es ds  bs32-> cs es ds
    \grace { bs16*1/16[ cs] } \slashedGrace { ds } cs4~\startTrillSpan
    \voiceOne cs4.*2/3 \hideNoteHead gs8)\stopTrillSpan |
  \bar "||"
  \key fs \major
  \oneVoice \stemUp \acciaccatura { <b ds>8 } <as cs>2.~^(\startTrillSpan
    q8\stopTrillSpan <gss bs> <as cs>  \appoggiatura { q16 es' } <b ds>8
    <as cs> <fs as> |
  <ds' fs>8 <fs, as> <b ds>  <as cs> <cs, fs> <gs' b> \voiceOne as2. |
  \oneVoice <ds, b' fs'>8-.)\arpeggio r r <fs ds' fs>4.->~\( q8 <es! css' es!>
    <fs ds' fs>  \slashedGrace { as'^( } <gs, es' gs>) <fs ds' fs> <b ds> |
  <ds b' ds>8 <cs as' cs> <fs, ds' fs>  <b gs' b> <b ds> <as fs' as>
    <gs es' gs> <fs ds' fs> <ds b' ds>  \voiceOne <as' cs>4. |
  \oneVoice <e as gs'>8-.\)\arpeggio r r <as e' gs>4.~( q8 <as ds fs>
    <gs as e'>  <fs b ds>16 <e fs cs'> <ds fs b>8) r |
    
  \barNumberCheck 89
  <fs bs as'>8-.\arpeggio r r  <bs fs' as>4.->~ -\slurShapeY (  q8 <bs es! gs>
    <as bs fs'>  \stemDown <gs cs es>16 <fs gs ds'> <es! gs cs>8) <gs cs es>( |
  \stemNeutral <gs es' b'>4.->)\arpeggio <gs e' b'>->\arpeggio
    <gs ds' b'>8->\(\arpeggio \slashedGrace { <e'\=1 -\slurShapeA ( cs'\=2^(> }
    <ds\=1) b'\=2)>8. <cs as'>16\) <cs ds as'>8\( \slashedGrace { 
    <ds\=1 -\slurShapeA ( b'\=2^(>~ } <cs\=1) ds as'\=2)> <fss, cs' ds> |
  \voiceOne <gs ds' gs>4.\) <fss ds'>->\(  <ds ds'>4( es'!8)
    \oneVoice <gs, ds' fs!>-\trillUnderSlur \trill <gs ds' es>16-. 
    <gs ds' fs>-. <gs ds'>-. <gs ds' gs>-. |
  <cs, fs gs>8-.\) <cs fs gs b>-.( <fs gs cs>-.  <fs gs b ds>-. <gs b ds es>-.
    <gs b ds fs>-.  <gs b ds fs gs>-. <b ds fs as>-. <ds fs gs b>-.
    <ds fs gs cs>-. <ds fs gs b ds>16-.) r\fermata <es b' cs es>8( |
  <fs as fs'>8-.) r <bs, gss' bs>8(  <b gs' b>4 <gs es' gs>8  <as fs' as>4)
    <cs as' cs>8(  <fs as fs'>4 <es cs' es>8 |
  <ds b' ds>8 <cs as' cs> <b gs' b>  <ds b' ds>4 <gs, es' gs>8  <as fs' as>4.)
    <cs fss cs'>4.->~-\slurShapeZ ( |
  <cs cs'>8 <bs bs'>8. <b b'>16  <b gs' b>8 <as fs' as> <gss es' gss> 
    <as fs' as> <cs as' cs> <fs as fs'>  q4 <es cs' es>8) |
  q8( <ds b' ds> <cs as' cs>  <ds b' ds>4 <gs, es' gs>8  <as fs' as>4.)
    <as dss as'>->~ -\slurShapeZ ( |
    
  \barNumberCheck 97
  <as as'>8 <gss gss'> <cs cs'>~  <cs es cs'>4 <bs ds bs'>8  <as cs as'> 
    <bs ds bs'> <cs es cs'>)  <cs fss cs'>4.->~( |
  <cs cs'>8 <bs bs'> <cs cs'>  <ds fs gs ds'> <es gs es'> <fs as fs'>~
    <fs ds' fs> <es cs' es> <fs ds' fs>  <es cs' es> <ds b' ds> <es cs' es> |
  <ds b' ds>8 <cs as' cs> <bs gss' bs>  <b gs' b>4 <gs es' gs>8  <as fs' as>4)
    <cs as' cs>8( <fs as fs'>4 <es cs' es>8 |
  q8 <ds b' ds> <cs as' cs>  <ds b' ds>4 <gs, es' gs>8  <as fs' as>4.)
    <cs fss cs'>4.->~ -\slurShapeZ ( |
  <cs cs'>8 <bs bs'>8. <b b'>16  <b g' b>8 <bf d bf'> <a fs' a>)  <as fs' as>(
    <cs fs cs'> <fs as fs'>  q) r gs,!^(
  % gs2.\startTrillSpan \slashedGrace { fss8\stopTrillSpan } <bs, fs' gs>-.)
%     <fs' bs es>( <fs bs fs'>  <gs b ds fs gs>[ <ds' fs ds'>] <es, b' cs es> |
  \afterGrace 15/16 gs2.\startTrillSpan { \slashFlag fss8\stopTrillSpan }
    <bs, fs' gs>-.) <fs' bs es>( <fs bs fs'>  <gs b ds fs gs>[ <ds' fs ds'>]
    <es, b' cs es> |
  <fs as fs'>4.) 
    << 
      { \voiceOne fs'4.-> -\slurShapeAA ( } 
      \new Voice { \voiceThree as,8 b bs } 
    >>
    <cs fs>-> <cs es>8. cs16  <gs cs>4.*2/3 s16 \hideNoteHead cs,) |
  << 
    { e'4.-> -\slurShapeAB ( e-> } 
    \new Voice { \voiceThree gs,8 as b!  as ds cs } 
  >>
    <cs e>-> <b ds>8. b16  <fs b>4.*2/3 s16 \hideNoteHead b,) |
  
  \barNumberCheck 105
  <g' d'>4.->(\arpeggio <b d>-. \oneVoice <d, b' d>8-> <cs as'> <b b'>
    <b g'> <a fs'> <g es'!> |
  \slashedGrace { fs8 } \afterGrace 15/16 fs'4.)^\(^\trillSharp\startTrillSpan
    { es16[(\stopTrillSpan fs]) fss[( gs] \slashFlag as!8 } \afterGrace 7/8 
    gs4.)\startTrillSpan { fss16(\stopTrillSpan gs) } \afterGrace 7/8 a4.
    ^\trillNatural\startTrillSpan { gs16(\stopTrillSpan a) } \afterGrace 7/8
    <es as>4.^\trillSharp\startTrillSpan { gss16(\stopTrillSpan as)\) } |
  \voiceOne gs'8->-\slurShapeAD ( s4 
    << 
      { \voiceOne gs4.-> } 
      \new Voice { \voiceThree <bs, ds>8 <cs e> <ds fs> } 
    >>
    <ds fs a>-> <e gs>8. e16  <cs e>4.*2/3 s16 \hideNoteHead e,) |
  << 
    { <e' g>4.->-\slurShapeAE ( q-> } 
    \new Voice { \voiceThree b!8 <as! cs> <b d>  bf <a c> <as cs> } 
  >> <d g>-> <d fs>8. d16  <b d>4.*2/3 s16 \hideNoteHead d,) |
  <as' es'!>4.->-\slurShapeAF (\arpeggio <gs! es'>  <d es b'>8-> <cs a'>8.
    <b g'>16  q8 <a fs'> <g es'>) |
  \subdivideEighths <g es'>16*1/2[-\slurShapeAG ( \magnifyMusic #2/3 {
    as c b  cs e d e  fss es as c  b cs e d  e fss es as  c b cs e
    \ottava 1 d e fss es  as c b cs  e d b g  es! d! b g  \ottava 0 es! d! b g
    es! d! b g!]
  }
  \subdivideOff \oneVoice <fs fs'>4)^\calando r8  \stemDown <b' gs'!>16(^\>
    <gs! es'!> <b gs'> <fs ds'!> <b gs'> <cs, cs'>\!  <as' fs'>4.)
    <b gs'>16(^\> <gs es'> <b gs'> <fs ds'> <b gs'> <cs, cs'>\! |
  <as' fs'>4) r8 \stemNeutral gs16^(^\> <gs, es'> gs' <fs, ds'> gs'
    <es, cs'>\! <as fs'>4) r8  gs'16^(^\> <gs, es'> gs' <fs, ds'> gs' 
    <es, cs'>\! |
    
  \barNumberCheck 113
  <as fs'>4) r8  r16 ds32[-\slurShapeAH (^\leggiero es]  fs[ gs as b]
    bs[ cs fs ds]  cs[ ds cs as]  gs[ as gs fs]  ds[ fs ds cs]  b![ ds es fs]
    gs[ as bs cs]  ds[ es fs b] |
  as32[ fs es ds]  fs[ ds cs b]  as[ gs fs as]  b[ cs ds es]  fs[ gs as b]
    bs[ cs fs ds]  cs[ ds cs as]  gs[ as gs fs]  ds[ fs ds cs]  b![ ds fs as]
    b[ cs ds es]  \moveOttavaA \ottava 1 fs[ gs as b] |
  \omit TupletNumber
  \tuplet 57/12 { \magnifyMusic #2/3 {
    bs8[ cs fs ds  cs b as gs  fs as fs es  ds fs ds \ottava 0 cs b as gs fs
    as fs es ds  fs ds cs b  as gs fs as  fs es ds fs  ds cs \staffDown 
    \stemUp \clef bass b as  gs fs as fs  es ds cs b  as gs fs es
    ds cs b as gs])
  } }
  \staffUp \stemNeutral \clef treble r4 <cs''' cs'>8-.[  <fs fs'>->] r
    <cs, cs'>-. <fs fs'>4-> r8 r4 r8 |
  \bar "|."
}

rightHandLower = \relative {
  s4. \voiceFour ds''4.~ ds4 es8  cs ds as |
  b8 cs gs  as b fs  gs as es  fs gs ds |
  es8 fs cs  ds es b s2. |
  s1. * 3 |
  s2. fs'4. e |
  s1. |
  
  \barNumberCheck 9
  s2. b'!8 as cs,  fs4 <css gs'!>8 |
  s1. |
  fs8( es8. ds16  ds4 b8 as4.) bs |
  cs4. as' es fs |
  gs4. as es fs |
  <es cs'>8\arpeggio s4 s4. s2. |
  s1. * 2 |
  
  \barNumberCheck 17
  s1. * 2 |
  s4. ds4 ds8 ds2. |
  s4 <as' as'>8^~-\slurShapeN ^( as'16 bs <es, cs'!> <fs ds'> <gs es'> <as fs'>
    <cs es> as es cs) b! as  gs8 fs gs |
  s4 <as as'>8^~-\slurShapeP ^( as'16 bs <es, cs'!> <fs ds'> <gs es'> <as fs'>
    <cs es> as es css) b! as  gs8. fs16 gs8 |
  s1. |
  s2. \hideNoteHeadOn as2.\startTrillSpan |
  as2. \grace { as8\stopTrillSpan } as2. \hideNoteHeadOff |
  
  \barNumberCheck 25
  s2. fs4.(  ds16 e fs e gs fs |
  \hideNoteHeadOn \grace { ds8) } s4.  \afterGrace 15/16 { ds'2.\startTrillSpan
    ds4.} { css16\stopTrillSpan ds } \hideNoteHeadOff |
  s1. * 4 |
  cs8 \slurUp \acciaccatura { ds } cs b  b \acciaccatura { cs } b as 
    \moveNoteA as gs4 <gs ds'> gs8 |
  s1. |
  
  \barNumberCheck 33
  s1. * 5 |
  s4 cs,8  d4 b8  cs4 a8  b4 cs8 |
  \key a \major
  s1. |
  cs8 e b  cs e b  cs e b  cs e b |
  
  \barNumberCheck 41
  cs8 e b  cs gs' fs  e a cs,  ds fss cs |
  ds8 gs cs,  ds gs cs,~  cs bs8. gs16  gs8 ds' as |
  s1. |
  bs8 ds as  bs ds as  bs ds as  bs ds as |
  bs8 ds as  b fs'! e!  ds fs b,  cs es gs, |
  cs8 fs b,  cs fs b,~  b as8. fs16  fs8 cs' gs |
  s4. s8 \clef bass cs\>^\legato gs  a cs\! gs  a cs gs |
  a8 bs gs  a a' fs,  es gs cs  a cs fs, |
  
  \barNumberCheck 49
  a8 bs gs  a bs fs  a bs gs  a a' fs, |
  s4. \clef treble es'4.*1/3 gs4 s2. |
  s1. |
  cs8 e b  cs gs' fs  e a a,  ds fss fss, |
  ds'8 gs gs,  ds' gs8. cs,16 <gs cs>8 bs8. gs16  \moveNoteB cs,8 bs8. gs16 |
  s1. * 2 |
  bs'8 ds as  b fs' e!  ds fs gs,  cs es gs, |
  
  \barNumberCheck 57
  cs8 fs fs,  cs' fs8. b,16  <fs b>8 as8. fs16  b,8 as8. fs16 |
  s4. s8 \clef bass cs'_( gs  a cs gs  a cs gs |
  a8 bs gs  a a' fs,  <es cs'> gs) \clef treble s  a' cs a |
  a8 bs gs  a bs fs  s2. |
  s4. \voiceOne \tieWaitOn
    << 
      { \moveNoteE e4.*1/3-\tieShapeB _~ gs4^~ \positioningDone }
      \new Voice { \mergeDifferentlyDottedOn \voiceFour e8 gs cs, } 
    >>
    \voiceFour <e gs> \tieWaitOff <d! gs> <d fs>  s4. |
  s1. * 3 |
  
  \barNumberCheck 65
  s1. * 2 |
  b'4 s8 s4. s2. |
  s1. * 4 |
  r4 <as, cs>8-.  <b d>4-. <a d>8-.  <gs d'>4-. q8-.  <a d>4-. <b d>8-. |
  
  \barNumberCheck 73
  <as cs>4-. q8-.  <b d>4-. <a d>8-.  q4-. <gs! d'>8-.  <a d>4-. <b d>8-. |
  <as cs>4 q8  <b d>4 <a d>8  <gs! d'>4 q8  q4 q8 |
  <gs d'>4 <a c>8  q4 q8  q4 <gs c>8  q4 <gs b>8 |
  <gs b>4 q8-\slurShapeX (  a4 \clef bass s8 \hideNoteHead es8) s4 s4. |
  s1. * 4 |
  
  \barNumberCheck 81
  s1. * 2 |
  s2. s4. b''8 fs gs |
  \key fs \major
  \grace { s8 } \hideNoteHeadOn as2.\startTrillSpan as8\stopTrillSpan 
    \hideNoteHeadOff s4 s4. |
  s2. fs4. e-> |
  s1. |
  s2. s4. cs4 ds8 |
  s1. |
  
  \barNumberCheck 89
  s1. * 2 |
  cs'8( \acciaccatura { ds } cs b)  b( \acciaccatura { cs } b as)  \moveNoteD
    as8 gs4 s4. |
  s1. * 3 |
  \voiceThree gs'4. s s2. |
  s1. |
  
  \barNumberCheck 97
  ds!4. s s2. |
  <fs-\tieShapeE _~ gs-\tieShapeD _~>4. \positioningDone \hideNoteHead q8 
    s4 s2. |
  s1. |
  s2. s4. \hideNoteHead fss4.~ |
  fss4. s s2. |
  s1. |
  s4. \voiceFour fs,4.  gs4 fs8  fs es8. cs16 |
  e4 e8  e4 gs8  fs4 e8  e ds8. b16 |
  
  \barNumberCheck 105
  b8(\arpeggio cs d  d g b,) s2. |
  s1. |
  <ds gs bs gs'>8->\arpeggio ds' gs,  gs4.  <a bs>4 <gs cs>8  a gs8. e16 |
  g4. g <g as>4 <fs as>8  g fs8. d16 |
  d8(\arpeggio e es  es e ds)  s2. |
}

rightHand = {
  \global
  \mergeDifferentlyDottedOn
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  s1. * 8 |
  
  \barNumberCheck 9
  s1. * 8 |
  
  \barNumberCheck 17
  s1. * 4
  s4 <gs as es'>8(  \voiceThree es'8 fs ds  \oneVoice <as, es' 
    cs'!>8)\arpeggio r as^(  \voiceThree cs' ds b! |
  <as,, as'>8-.) s4 s4. s2. |
  s1. * 2 |
  
  \barNumberCheck 25
  s1. * 8 |
  
  \barNumberCheck 33
  s1. * 5 |
  s4. d'4 b8  cs4 a8  b4 cs8 |
  \key a \major
  s1. * 2 |
  
  \barNumberCheck 41
  s1. * 8 |
  
  \barNumberCheck 49
  s1. * 8 |
  
  \barNumberCheck 57
  s1. * 2 |
  s2. s4. fs,8 fs' cs, |
  s1. * 5 |
  
  \barNumberCheck 65
  s1. * 8 |
  
  \barNumberCheck 73
  s1. * 8 |
  
  \barNumberCheck 81
  s1. * 8 |
  
  \barNumberCheck 89
  s1. * 8 |
  
  \barNumberCheck 97
  s1. * 6 |
  s8 cs'4  s4.  s8 cs4  s4. |
  s8 cs4  s4.  s8 ds4  s4. |
  
  \barNumberCheck 105
  s8 d4  s4.  s8 d4. d4 |
  s1. |
  s8 ds4  s4.  s8 e4  s4. |
  s8 e4  s4.  s8 d4  s4. |
  s8 d4  s4.  s8 d4. d4 |
  s1. * 2 |
  s4. b' s b |
  
  \barNumberCheck 113
}

leftHandLower = \relative {
  <cs,, cs'>4->\f r8 \clef treble b''''4.~_( b8 gs cs,  as' fs cs |
  \clef bass gs'8 es cs,)  fs'( ds cs,)  es'( cs cs,)  ds'( b cs,) |
  \stemDown cs'8( as cs,,)  b''( gs cs,,) r2. |
  fs8( cs' gs'  fs16 gs as8 cs,)  fs,-\slurShapeH ( cs' gs'  fs16 gs as8 cs) |
  fs,,8( cs' gs'  fs16 gs as8 cs,)  fs,-\slurShapeH ( cs' gs'  fs16 gs as8 
    cs) |
  fs,,8( cs' gs'  fs16 gs as8 cs,)  fs,-\slurShapeH ( cs' gs'  fs16 gs as8
    cs) |
  fs,,8( cs' es  fs16 gs as8 cs,)  fs,-\slurShapeH ( cs' gs'  fs16 gs as8 cs) |
  fs,,8( fs' cs'  b16 cs ds8 fs,)  fs,-\slurShapeI ( fs' cs'  b16 cs ds8 fs) |
  
  \barNumberCheck 9
  fs,,8( fs' cs'  b16 cs ds8 fs,)  fs,-\slurShapeJ ( cs' gs'  fs16 gs as8 
    es,) |
  ds8( as' gs'  fs16 gs as8 as,)  ds,( as' gs'  css,16 b' as8 as,) |
  ds,8( as' gs'  fs16 gs as8 as,)  \stemNeutral ds,( as' fs')  ds,( gs fs') |
  es,8( cs' gs')  fs,( cs' cs')  gs,( cs cs')  as,( cs cs') |
  gs,8( cs cs')  fs,,( cs' cs')  gs,( cs cs')  as,( cs cs') |
  gs,8-. gs'( cs  gs' cs, gs)  gs,,-.\noBeam \stemDown gs'( fs'  bs fs gs,) |
  \stemNeutral \rotateHairpinA cs,8(\< gs' gs'\!  gs4\> gs,8)\!
    \rotateHairpinA cs,8(\< gs' gs'\!  gs4\> gs,8)\!
  cs,8( gs' gs'~)  gs gs,-\slurShapeK ( cs,~  cs gs' gs'~)  gs gs,-\slurShapeL
    ( cs,~ |
  
  \barNumberCheck 17
  cs8 gs' gs'~)  gs gs,-\slurShapeM ( cs,~  cs gs' gs'  fs fs, fs,) |
  \rotateHairpinA b8(\< fs' fs'\!  fs4\> fs,8)\!  \rotateHairpinA b,(\< fs'
    fs'\!  fs4\> fs,8)\! |
  b,8( fs' fs'~  fs fs, b,)~  b( fs' es!  es'! es, b |
  <as as'>8-.) r <gs'' as es'>( <fs as es'>4 <fs as ds>8 
    <as, es' cs'!>8)\arpeggio r q(\arpeggio <as ds fs cs'>4 <as ds fs b!>8 |
  <as, as'>8-.) r s \voiceTwo <fs'' as>4 q8  s4.  <ds fs>4 q8 |
  s8 \oneVoice r <gs css>[(  <fs ds'>]) r as,,~[^( <as as'>-.]) r 
    <es'' cs'!>[(  <ds b'>]) r as,~-\slurShapeAM ^( |
  <as as'>-.) r <css' es as css>8[( q]) r <as, as'>-.[ q-.] r <es'' as es'>[(
    q]) r <gs,,  gs'>-. |
  <fs fs'>8-.\noBeam \stemDown cs''( gs'  fs16 gs as8 cs,)  fs,( cs' gs'
    fs16 gs as8 cs) |
    
  \barNumberCheck 25
  fs,,8( cs' gs'  fs16 gs as8 cs,)  fs,( cs' gs'  fs16 gs as8 cs) |
  \grace { s8 } \stemNeutral fs,,,8-\slurShapeAI (\noBeam fs'' cs'  b16 cs ds8
    fs,)  fs,-\slurShapeAJ ( fs' cs'  b16 cs ds8 fs) |
  fs,,8( fs' cs'  b16 cs ds8 fs,)  \stemDown fs,( cs' gs'  fs16 gs as8 cs,) |
  \grace { s8 } \stemNeutral fs,,8\noBeam cs''( gs'  fs16 gs as8 cs,)
    fs,( cs' <fs cs'>)  b,,( fs' fs') |
  <gs,, gs'>8( ds'' as'  gs16 as bs8 ds,)  gs,( ds' <gs ds'>)
    cs,,( gs' gs') |
  cs,,8( gs' gs')  css,,( gs' gs')  ds,( ds' <gs ds'>)  ds,( ds' <fss ds'>) |
  gs,8( ds' <gs ds'>)  as,( ds <cs' ds>)  b,( ds <gs ds'>)
    bs,( gs' <ds' fs>) |
  cs,,8\noBeam <cs' gs' b>-._( <gs' b cs>-.  <gs b ds>-. <gs b ds es>-.
    <gs b ds fs>-.  \clef treble <b ds fs gs>-. <b ds fs as>-. <ds fs gs b>-.
    <fs gs b cs>-. <fs gs b ds>16-.) r\fermata \moveClefA \clef bass 
    <cs,, cs'>8( |
    
  \barNumberCheck 33
  <fs, fs'>-.)\noBeam cs''(\< cs'  cs4\> cs,8)\!  \rotateHairpinB fs,(\< cs'
    cs'\!  cs4\> cs,8)\! |
  fs,,8-.\noBeam cs''( cs')~  cs cs,( cs')~  cs \acciaccatura { ds, } cs( cs')~
    cs \acciaccatura { ds, } cs( cs')~ |
  cs8 cs, fs  gs a b  r2. |
  R1. * 2 |
  r4 \voiceTwo cs,8(  d fs b,  cs fs a,  b fs' cs |
  \key a \major
  \oneVoice <a, a'>4) e'8(  <a, a'>4) e'8(  a4) <e e'>8(  a4) <e e'>8( |
  a4) <e e'>8(  a4) <e e'>8(  a4) <e e'>8(  a4) <e e'>8( |
  
  \barNumberCheck 41
  a4) <e e'>8(  a4) <e e'>8(  a4) <e e'>8(  a4) <ds, ds'>8( |
  gs4) <ds ds'>8(  gs4) <ds ds'>8(  gs4) <ds ds'>8(  gs4) <ds ds'>8( |
  <gs, gs'>8) r <ds' ds'>(  gs4) <ds ds'>8(  gs4) <ds ds'>8(  gs4) <ds ds'>8( |
  <gs, gs'>4) <ds' ds'>8(  gs4) <ds ds'>8(  gs4) <ds ds'>8(  gs4) <ds ds'>8( |
  gs4) <ds ds'>8(  gs4) <ds ds'>8(  gs4) <ds ds'>8(  gs4) <cs, cs'>8( |
  <fs, fs'>8) r <cs' cs'>(  fs4) <cs cs'>8(  fs4) <cs cs'>8(  fs4) <cs cs'>8( |
  <fs, fs'>8) r <cs' cs'>(  fs4) <cs cs'>8(  fs4) <cs cs'>8(  fs4) <cs cs'>8( |
  fs4) <cs cs'>8(  fs4) <cs cs'>8(  gs'4) <cs, cs'>8(  fs4) <cs cs'>8( |
  
  \barNumberCheck 49
  fs4) <cs cs'>8(  fs4) <cs cs'>8(  fs4) <cs cs'>8(  fs4) <cs cs'>8( |
  gs'4) <cs, cs'>8(  gs' es' cs,  gs' e' cs,)  e( b' gs') |
  a,,8( e'' e,  a e' e,  a e' e,  a e' e,) |
  <a, a'>8 e''( e,  a e' e,)  <a, a'> e''( e,  a ds ds,) |
  <gs, gs'>8 ds''( ds,  gs ds' ds,  gs ds' ds,  gs ds' ds, |
  <gs, gs'>8) ds''( ds,  gs ds' ds,  gs ds' ds,  gs ds' ds, |
  <gs, gs'>8) ds''_\sempreLegato ds,  gs ds' ds,  gs ds' ds,  gs ds' ds, |
  <gs, gs'>8 ds'' ds,  gs ds' ds,  gs ds' ds, gs cs cs, |
  
  \barNumberCheck 57
  <fs, fs'>8 cs'' cs,  fs cs' cs,  fs cs' cs,  fs cs' cs, |
  <fs, fs'>8 cs'' cs,  fs cs' cs,  fs cs' cs,  fs cs' cs, |
  fs cs' cs,  fs cs' cs,  gs' es' cs,  \voiceTwo fs4 s8 |
  \oneVoice fs8 fs' cs,  fs fs' cs,  fs fs' cs,  fs a' cs,, |
  gs'8( es' cs,)  gs'( e' cs,)  e( b' gs')  <b gs'> r r |
  <a,, a'>8\noBeam e''( fs  gs e d')  a,( e' a,  e' a cs) |
  a,( e' a,  e' gs d')  a,( e' a,  e' a cs) |
  a,( e' a,  e' gs d')  a,( e' a,  e' a cs) |
  
  \barNumberCheck 65
  e,,8( b' gs'  e gs d')  a,( e' a,  e' fss cs') |
  gs,,8-. gs'( fs'  gs bs gs,)  cs,( gs' gs')  c,,( fs fs') |
  b,,8-. b'( fs'  a! ds b,)  e,( b' b')  fs,( d'! a') |
  gs,8( e' gs,  e' e' e,)  a,( e' a,  e' a cs) |
  a,8( e' a,  e' gs d')  a,( e' a,  e' a cs) |
  a,8( e' a,  e' gs d')  a,( e' cs'  \clef treble <e cs'>) r r |
  R1.  |
  r4 \clef bass <e,, e'>8-.  q4-. q8-.  q8-. r <e, e'>-.  q4-. q8-. |
  
  \barNumberCheck 73
  q8-. r <e' e'>-.  q4-. q8-.  q8-. r <e, e'>-.  q4-. q8-. |
  q8-. r <e' e'>-.  q4-. q8-.  q4-. q8-.  q4-. q8-. |
  q4-. q8-.  q4-. <d d'>8-.  q4-. q8-.  q4-. q8-. |
  q4-. <cs cs'>8(  <fs cs'>4 gs8  cs,8) r es'(  e4 ds8 |
  cs8) r es(  e4 d8  c4 b8  a4 gs8) |
  \stemDown \tuplet 7/6 { cs,8[( gs' cs es16*2 gs16*2 cs16*2 gs16*2] } gs'4.)
    r4 r8 |
  \tuplet 7/6 { cs,,,8[( gs' fs' gs16*2 bs16*2 gs16*2 bs16*2] } fs'4.) r4 r8 |
  \stemNeutral cs,,8( gs' es'  \tuplet 5/3 { gs cs es cs gs } gs'4.) r4 r8 |
  
  \barNumberCheck 81
  cs,,,8( gs' fs'  gs bs gs  fs'4.) r4 r8 |
  cs,,8( gs' es'  gs es') r  ds,,8( fs fs'  ds <fs fs'>) r |
  e,!8( cs' fss  e! <cs' fss>) r  \stemDown es,,( cs' b'!  gs cs cs,) |
  \key fs \major
  \grace { s8 } \stemNeutral <fs,, fs'>8 <cs' cs'>( <gs' gs'>  <fs fs'>16 
    <gs gs'> <as as'>8) <cs, cs'>  <fs, fs'> <cs' cs'>( <gs' gs'>  <fs fs'>16
    <gs gs'> <as as'>8) <cs cs'> |
  <fs,, fs'>8 <cs' cs'>( <gs' gs'>  <fs fs'>16 <gs gs'> <as as'>8) <cs, cs'>
    <fs, fs'> <cs' cs'>( <gs' gs'>  <fs fs'>16 <gs gs'> <as as'>8) <cs cs'> |
  <fs,, fs'>8 <fs' fs'>( <cs' cs'>  <b b'>16 <cs cs'> <ds ds'>8) <fs, fs'>
    <fs, fs'> <fs' fs'>( <cs' cs'>  <b b'>16 <cs cs'> <ds ds'>8) <fs fs'> |
  <fs,, fs'>8 <fs' fs'>( <cs' cs'>  <b b'>16 <cs cs'> <ds ds'>8) <fs, fs'>
    <fs, fs'> <cs' cs'>( <es es'>  <fs fs'>16 <gs gs'> <as as'>8) <cs, cs'> |
  <fs, fs'>8-> <cs' cs'>( <gs' gs'>  <fs fs'>16 <gs gs'> <as as'>8) <cs, cs'>
    <fs, fs'> <cs' cs'> <fs fs'>  <b, b'>-> <fs' fs'> <b b'> |
    
  \barNumberCheck 89
  <gs, gs'>8-> <ds' ds'>( <as' as'>  <gs gs'>16 <as as'> <bs bs'>8) <ds, ds'>
    <gs, gs'> <ds' ds'> <gs gs'>  <cs, cs'>-> <gs' gs'> <cs cs'> |
  <cs, cs'>8-> <cs' gs'> <gs' es'>  <d, d'>-> <d' gs> <gs e'>  <ds, ds'>->
    <ds' gs b> <ds ds'!>  <ds, ds'>-> <ds' fss cs'> <as' cs ds> |
  <gs,, gs'>8-> <ds'' gs b> <gs b ds>  <as,, as'>-> <ds' fss cs'> <fss cs' ds>
    <b,, b'>-> <b' ds gs> <ds gs ds'>  <bs, bs'>-> <bs' fs' gs> <fs' gs ds'> |
  <cs,, cs'>->\noBeam <cs'' gs' b>-.( <cs gs' cs>-. <cs gs' ds'>-.
    <gs' b ds es>-. <gs b ds fs>-. \clef treble q-. <b ds fs as>-.
    <ds fs gs b>-.  <ds fs gs cs>-. <ds fs gs b>16-.) r\fermata \clef bass
    <cs,, cs'>8( |
  <fs, fs'>8)\noBeam <cs'' cs'>( <ds ds'>  <es gs cs es>) <cs cs'>(
    <b' cs es>)  <fs, fs'>-> <fs' as cs>( <cs fs as>  <fs as fs'> <fs as cs>
    <cs fs as>) |
  <cs, cs'>8-> <cs' gs' b>( <gs' b es>  <b cs gs'> <gs b cs es> <cs, gs' b>)
    <fs, fs'>-> <cs' fs as>( <fs as cs>)  <ds, ds'>-> <ds' as' cs>(
    <as' cs ds fss>) |
  <gs, gs'>8-> <ds' gs ds'>( <b'! ds gs>)  <cs,, cs'>-> <cs' b'>( <b' es>)
    <fs, fs'>-> <cs' fs as>( <fs as cs>  <cs' fs as> <as cs fs> 
    <cs, as' cs>) |
  \stemDown <cs, cs'>-> <cs' gs' b>( <gs' b es> \clef treble <cs es b'>
    <gs cs es>) \clef bass <cs, cs'>(  <fs, fs'>->) <cs' as' cs>( <fs as fs'>)
    <bs,, bs'>-> <fss'' as bs>( <as bs fss'>) |
    
  \barNumberCheck 97
  <es, es'>8-> <es' ds'>( <gss ds' es>  <ds' gss> <gss, ds' es> <es gss ds'>)
    <as,, as'>-> <es'' as cs>( <as cs es>)  <a,, a'>-> <ds' fss cs'>( 
    <fss cs' fss>) |
  <gs,, gs'>8-> <ds'' gs ds'>( <gs ds' fs> \stemNeutral \clef treble
    <ds' fs bs> <gs, ds' fs> \clef bass <ds gs bs>)  <cs, cs'>-> <es' gs cs>(
    <gs cs es>)  <ds, ds'>-> <ds' fs b>( <fs b fs'>) |
  <es, es'>8-> <cs' gs' b>( <gs' cs es>  <b cs gs'> <gs cs es>) <cs,, cs'>->(
    <fs fs'>->) <cs' as' cs>( <as' cs as'>)  <ds,, ds'>-> <fs' as ds>( 
    <as ds fs>) |
  <gs, gs'>8-> <ds' gs b>( <gs b fs'>)  <cs,, cs'>-> <cs' gs' b>( <gs' b es>)
    <e, e'>-> <e' fs cs'>( <fs cs' fs>  <e cs'> <a cs fss> <e a cs>) |
  <ds, ds'>8-> <ds' as'! cs>( <fss cs' fss>)  <d, d'>-> <d' g d'>( <d fs b>)
    <cs, cs'>-> <cs' as' cs> <as' cs as'>  <bs,, bs'>-> r r |
  <gs'' ds' fs>4. r4 r8  <gs,, gs'>->\noBeam <fs'' gs bs es>( <fs gs bs ds>)
    <cs, cs'>->\noBeam <b'' ds fs as>( <cs, gs' cs>) |
  \voiceTwo \slurUp <fs,, fs'>8( cs'' <fs cs'>  q cs fs,)  <fs, fs'>( cs''
    <gs' cs>  q cs, fs,) |
  <fs, fs'>8( cs'' <gs' cs> <fs cs'> cs fs,)  <fs, fs'>( ds'' <fs b> q ds 
    fs,) |
    
  \barNumberCheck 105
  <fs, fs'>8( d'' <g b>  q d fs,)  <fs, fs'>( d'' <g d'>  q d b') |
  <fs,, fs'>8-\slurShapeAC ( cs'' as'!  <ds, bs'> gs fs,)  <css' bs'>( fs 
    <css bs'>)  <cs cs'!>( <es as> <cs cs'>) |
  <fs,, fs'>8( ds'' <gs bs ds>  q ds fs,)  <fs, fs'>( e'' <gs cs e>  q e 
    fs,) |
  <fs, fs'>8( e'' <g b e>  <g c e> e fs,)  <fs, fs'>( d'' <fs as! d>  <fs b d>
    d fs,) |
  <fs, fs'>8( d'' <es! as d>  <es b' d> d fs,)  <fs, fs'>( d'' d'  d d, b') |
  <fs,, fs'>8( d'' g  <g es'!>4. \oneVoice \clef treble <d' es! b'>) 
    r\fermata |
  \clef bass \stemDown \rotateHairpinB fs,,,8(\< cs'' cs'  \grace { bs16 ds! }
    cs4-\moveHairpinA \> \once \stemUp cs,8)\!  \rotateHairpinA fs,(\< cs' cs'
    \grace { bs16 ds } cs4-\moveHairpinB \> \once \stemUp cs,8)\! |
  \rotateHairpinB fs,,8(\< cs'' as'  b!4-\moveHairpinC \> cs,8)\!
    \rotateHairpinB fs,(\< cs' as'  b4-\moveHairpinD \> cs,8)\! |
    
  \barNumberCheck 113
  \stemNeutral <fs,, fs'>8 r <cs'' fs as>(  <ds fs b>4 <cs fs as>8
    <b fs' gs>4 <cs fs as>8  <ds fs b>4 <fs b ds>8 |
  <fs as cs>4) <cs cs'>8(  <fs ds'>4 <cs as' cs>8  \clef treble <as' cs as'>4
    <as cs fs>8  <gs ds' fs>4 <cs es b'>8 |
  <fs, cs' as'>4)\arpeggio r8  r4 r8  r2. |
  \clef bass fs,,8_\mg r <cs'' cs'>-.[  <fs fs'>->] r <cs, cs'>-. <fs, fs'>4->
    r8 r4 r8 |
}

leftHand = {
  \global
  \clef bass
  \mergeDifferentlyDottedOn
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override TextScript.Y-offset = -0.5
  s4. s\f s\> s4 s8\! |
  s1.\dim |
  s4. s4 s8\! s2. |
  s1.\p |
  s1. |
  s4. s\p\> s s8 s4\! |
  s4. s8 s4-\tweak to-barline ##f \< s2. |
  s8\! s4 s4.\> s4 s8\! s4. |
  
  \barNumberCheck 9
  s4. s4 s8\< s4. s8 s4\! |
  s4.\mf s2.\> s4 s8\! |
  s2. s4.\< s4 s16 s\! |
  s4 \spannerStyleNone s8\cresc s4. s2. |
  s2. s4.\< s4 s16 s\! |
  s4.\f s\> s2.\dim |
  s4 s8\! s4. s2. |
  s1. |
  
  \barNumberCheck 17
  s4. s\< s4 s8\! s4\> s8\! |
  s1.\p |
  s2. s4.\< s4 s16 s\! |
  s4\mf s8\> s4 s8\! s2. |
  s4 s16 s-\tweak Y-offset 1 \> s4 s8\! s2. |
  s4 s8\<  s4\> s16 s\!  s4 s8\<  s4\> s16 s\! |
  s2.\cresc s4. s4 s8\! |
  s4.\f  s4\dim s8\> s4. s4 s8\! |
  
  \barNumberCheck 25
  s8. s\>  s4 s16 s\!  \hairpinNoBar \hairpinNoBreak s2.\< |
  s8\! s4  s2.\< s4 s8\! |
  s2.\> s4 s8\!  s4. |
  \spannerStyleNone s4.\cresc s\> s4 s8\! s4. |
  \spannerStyleNone s4.\cresc s\> s8 s4\!  s4\< s8\! |
  s2. s4.\> s8\! s\< s\! |
  s4\> s8\!  s4\> s8\!  s4.\< s4 s8\! |
  s8\f s4\dim  s2.\>  s8 s16\! s s8\< |
  
  \barNumberCheck 33
  s2.\f s\dim |
  s4. s4 s8\! s2.^\rallent
  s8 s4\pp s4. s2. |
  s4. s2.\< s4 s8\! |
  s2.\> s4 s8\! s4. |
  s1. |
  % key of a major
  s2.\> s4. s4 s8\! |
  s1.^\sotoVoce |
  
  \barNumberCheck 41
  s1. * 2 |
  \rotateHairpinA s4\< s16 s\!  s8 \tag layout { s4^\sempreP } 
    \tag midi { s4\p } s2. |
  s1. * 3 |
  \rotateHairpinA s4\< s16 s\!  s4. s2. |
  s1. |
  
  \barNumberCheck 49
  s4.\>  s4 s8\! s2. |
  s2.\< s4. s4 s8\! |
  s4.\f\<  s4 s8\!  s2. |
  s4.\< s4 s8\!  s4\> s8\!  s4\> s8\! |
  s4.\> s4 s8\!  s4\> s8\!  s4-\tweak Y-offset -1 \> s8\! |
  \rotateHairpinA s4\< s16. s32\!  s4.\fp  s\<  s4 s8\! |
  s8\f s4\<  s4 s16. s32\!  s2. |
  s4.\< s4 s8\!  s4\> s8\!  s4\> s8\! |
  
  \barNumberCheck 57
  s4.\> s4 s8\!  s4\> s8\!  s4-\tweak Y-offset -1.5 \> s8\! |
  \rotateHairpinA s4\< s16. s32\!  s4.\fp  s2. |
  s2. s4 \spannerStyleNone s8\cresc  s4. |
  s4.\> s4 s8\!  \rotateHairpinA s4\< s16. s32\!  s4. |
  s4. s2.\<  s8.\!  s\> |
  s4. s4 s8\!  s4.\< s4 s8\! |
  s4.\> s4 s8\!  s4. s\> |
  s4. s8 s4\!  s4.\<  s4 s8\! |
  
  \barNumberCheck 65
  s4.\> s4 s8\!  s2. |
  s2.\< s4 s8\!  s4. |
  s4.\< s4 s8\!  s8 s4\>  s4 s8\! |
  s8\p s4\>  s4 s8\!  s4.\< s4 s8\! |
  s4.\> s4 s8\!  s4.\< s4 s8\! |
  s8 \spannerStyleNone s4\dim  s2. s4.\! |
  s1. |
  s4 s8\p  s4. s2. |
  
  \barNumberCheck 73
  s1. |
  s4. s\<  s4 s8\!  s4. |
  s2.\> s\! |
  s1. * 2 |
  s1.^\dolceSfogato
  s2. s4 s16 s\<  s4 s8\! |
  s4\> s8\! s2.\< s4 s16 s\! |
  
  \barNumberCheck 81
  s2.\> s4. s4 s16 s\! |
  \spannerStyleNone s4.\cresc s4\< s16 s\! s8\> s16\! s s8\<  s4 s16 s\! |
  s8\> s4\!  s4\< s16 s\!  s8 \spannerStyleNone s4\cresc  s4. |
  % Tempo I, fs major
  s1.\f |
  s2. s4.\cresc s4 s16 s\! |
  s1. |
  s2. \hairpinNoBar \hairpinNoBreak s\< |
  s8\! s4 s4. s2. |
  
  \barNumberCheck 89
  s1. * 2 |
  s4\> s8\!  s4\> s8\!  s4.  s4\< s16 s\! |
  \spannerStyleNone s1.\cresc |
  s4\ff s8\>  s4 s8\!  s4.\< s4 s8\! |
  s4.\> s2.\! s4.\> |
  s4. s8 s4\!  s4.\< s4 s8\! |
  s4.\>  s4 s8\!  s2. |
  
  \barNumberCheck 97
  s1. |
  s4.\< s4 s8\! s2.\> |
  s4. s\! s\< s4 s8\! |
  s2.\> s4.\! \hairpinNoBar \hairpinNoBreak s\> |
  s8\! s s\< s2. s4.\! |
  s2.\ff\> \grace { s8\! } s16 s^\ritenuto s4 s4. |
  s1.^\sempreF |
  s1. |
  
  \barNumberCheck 105
  s1. |
  s2.\< s4. s4 s8\! |
  s1. * 2 |
  s2. s4.\< s4 s8\! |
  s1. |
  s1.\fp |
  \spannerStyleNone s1.^\dimMarkup |
  
  \barNumberCheck 113
  s4. s\pp s2. |
  s1. |
  s4. s8. \spannerStyleNone s-\tweak Y-offset -1 \cresc s2. |
  s4 s8\ff s4. s2. |
}

pedal = {
  s2.-\tweak X-offset -4 -\tweak extra-offset #'(0 . -3) \sd s4 s8\su s4. |
  s4.\sd  s8 s\su s\sd  s s\su s\sd  s s\su s\sd |
  s8 s\su s-\tweak Y-offset -1 \sd  s s\su s-\tweak Y-offset -1 \sd  s2.\su |
  s4\sd s8\su  s4 s8\sd  s4 s8\su s4 s8\sd |
  s4 s8\su  s4 s8\sd  s4 s8\su s4 s8\sd |
  s4 s8\su  s4 s8\sd  s4 s8\su s4 s8\sd |
  s4 s8\su  s4 s8\sd  s4 s8\su s4 s8\sd |
  s4 s8\su  s4 s8\sd  s4 s8\su s4 s8\sd |
  
  \barNumberCheck 9
  s4 s8\su  s4 s8\sd  s4 s8\su s4. |
  \tag layout { \grace { s8 } s4\sd }
  \tag midi   { \grace { s8\sd } s4 }
    s8\su  s4 s8\sd  s4 s8\su  s4 s8\sd |
  s4 s8\su  s4 s8\sd  s4 s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4.\sd s4 s8\su  s4.\sd s4 s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s s\sd s\su  s s\sd s\su  s s\sd s\su |
  
  \barNumberCheck 17
  s8 s\sd s\su s  s\sd s\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4.  s4\sd s8\su  s8\sd s4\su |
  s4-\tweak Y-offset -2 \sd s8\su  s4.  s4\sd s8\su  s4\sd s8\su |
  s4.-\tweak Y-offset -2 \sd  s8\su s4  s8-\tweak Y-offset -2 \sd s4 s8\su s4 |
  s2.-\tweak Y-offset -1 \sd s4. s8 s4\su |
  s4-\tweak Y-offset -1 \sd s8\su  s4 s8\sd  s4 s8\su  s4 s8\sd |
  
  \barNumberCheck 25
  s8. s\su  s4 s8\sd  s8 s4\su  s4. |
  \tag layout { \grace { s8 } s4-\tweak Y-offset -1 \sd }
  \tag midi   { \grace { s8\sd } s4 }
    s8\su  s4 s8\sd  s4 s8\su  s4 s8\sd | 
  s4 s8\su  s4 s8\sd  s4 s8\su  s4 s8\sd |
  s4 s8\su  s4 s8\sd  s4.  s4\su\sd s8\su |
  s4\sd s8\su  s4 s8\sd  s4.  s4\su\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4.\sd  s4\su\sd s8\su  s4\sd s8\su |
  s2.\sd s4. s8 s16 s\su s8 |
  
  \barNumberCheck 33
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4. s2. |
  s4.\sd  s4 s8\su  s2. |
  s1. * 3 |
  % key of a major
  s2.\sd s\su |
  s1. |
  
  \barNumberCheck 41
  s1. |
  s4.\sd  s8 s4\su  s2. |
  s4.\sd s\su s2. |
  s4\sd s8\su s4. s2. |
  s2. s4. s4\sd s8\su |
  s4.\sd s8 s4\su s2. |
  s4.\sd s\su s2. |
  s4.\sd s4 s8\su  s4\sd s8\su  s4\sd s8\su |
  
  \barNumberCheck 49
  s2.\sd s4. s4 s8\su |
  s4.\sd s4 s8\su  s4\sd s8\su  s4\sd s8\su |
  s4.\sd s4 s8\su  s2. |
  s4.\sd s4 s8\su  s4\sd s8\su  s4\sd s8\su |
  s4.\sd s8 s4\su  s4\sd s8\su  s4. |
  s4.\sd s8 s4\su  s2. |
  s2.\sd s8 s4\su  s4. |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  
  \barNumberCheck 57
  s4.\sd  s8 s4\su  s4\sd s8\su  s4. |
  s4.\sd  s8 s4\su  s2. |
  s4.\sd  s4 s8\su  s4\sd s8\su  s4\sd s8\su |
  s4.\sd  s4 s8\su  s4.\sd  s4 s8\su |
  s4\sd s8\su  s4\sd s8\su s4.\sd  s8 s4\su |
  s4-\tweak Y-offset -2 \sd s8\su  s4. s\sd s4 s8\su |
  s4.\sd s4 s8\su  s4.\sd s4 s8\su |
  s4.\sd s4 s8\su  s4.\sd s4 s8\su |
  
  \barNumberCheck 65
  s4.\sd s4 s8\su  s4.\sd s4 s8\su |
  s4.-\tweak Y-offset -1 \sd s4 s8\su  s4\sd s8\su  s4\sd s8\su |
  s4.-\tweak Y-offset -0.5 \sd s4 s8\su  s4\sd s8\su  s4\sd s8\su |
  s4.\sd s4 s8\su  s4.\sd s4 s8\su |
  s4.\sd s4 s8\su  s4.\sd s4 s8\su |
  s4.\sd s4 s8\su  s2.-\tweak Y-offset -1 \sd |
  s1.\su |
  s1. |
  
  \barNumberCheck 73
  s8-\tweak Y-offset -2 \sd s4\su  s4.  s8\sd s4\su  s4. |
  s8-\tweak Y-offset -2 \sd s4\su  s4.  s2.\sd |
  s2.\su  s4 s8\sd s4.\su |
  s2. s4-\tweak Y-offset -1 \sd s8\su s4. |
  s1. |
  s2.-\tweak Y-offset -2 \sd s4. s\su |
  s2.-\tweak Y-offset -2 \sd  s4 s8\su  s4. |
  s2.\sd s4. s4 s16 s\su |
  
  \barNumberCheck 81
  s2.\sd s4. s4 s16 s\su |
  s4.\sd s4 s8\su  s4.\sd s4 s8\su |
  s4.\sd s4 s8\su  s4.\sd s4 s8\su |
  % Tempo I, fs major
  s4\sd s8\su s4.  s4\sd s8\su  s4. |
  s4\sd s8\su s4.  s4\sd s8\su  s4. |
  s4\sd s8\su s4.  s4\sd s8\su  s4. |
  s4\sd s8\su s4.  s4\sd s8\su  s4. |
  s4\sd s8\su s4.  s4\sd s8\su  s4\sd s8\su |
  
  \barNumberCheck 89
  s4-\tweak Y-offset -1 \sd s8\su s4.  s4\sd s8\su  s4\sd s8\su |
  s4-\tweak Y-offset -1 \sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s2.-\tweak Y-offset -2 \sd s4. s8. s\su |
  s8.-\tweak Y-offset -1 \sd s\su  s4\sd s8\su  s4.\sd  s4 s8\su |
  s4.\sd  s4 s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4.\sd  s8. s\su  s4\sd s8\su  s4\sd s8\su |
  
  \barNumberCheck 97
  s4.\sd  s4 s8\su  s4\sd s8\su  s4\sd s8\su |
  s4.\sd  s4 s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s8\sd s4\su |
  s4.\sd s\su  s4\sd s8\su  s8\sd s4\su |
  s8.\sd s\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  
  \barNumberCheck 105
  s4.\sd  s4 s8\su  s4.\sd s\su |
  s4-\tweak Y-offset -2 \sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4-\tweak Y-offset -2 \sd s8\su  s4\sd s8\su  s4-\tweak Y-offset -2 \sd
    s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  s4\sd s8\su  s4\sd s8\su  s4.\sd  s8 s4\su |
  s4\sd s8\su  s2.\sd s4 s16 16\su |
  s4-\tweak Y-offset -2 \sd s8-\tweak Y-offset -1 \su  s4\sd s8\su  
    s4\sd s8\su  s4\sd s8\su |
  s4-\tweak Y-offset -1 \sd s8\su  s4\sd s8\su  s4\sd s8\su  s4\sd s8\su |
  
  \barNumberCheck 113
  s4\sd s8\su s4. s2. |
  s1. |
  s2.\sd  s4 s8\su  s4. |
  s4.-\tweak Y-offset -1 \sd s\su s-\tweak Y-offset -1 \sd  s4 s8\su |
}

tempi = {
  \set Score.tempoHideNote = ##t
  \tempo "Allegretto." 4. = 60
  s1. * 8  |

  \barNumberCheck 9
  s1. * 8  |
  
  \barNumberCheck 17
  s1. * 8  |
  
  \barNumberCheck 25
  s1. * 7  |
  s2. s4. s8 \tempo 4. = 20 s \tempo 4. = 60 s |
  
  \barNumberCheck 33
  s1. * 2 |
  s4. \tempo "Poco più mosso." 4. = 66 s s2. |
  s1. * 5  |
  
  \barNumberCheck 41
  s1. * 8  |
  
  \barNumberCheck 49
  s1. * 8  |
  
  \barNumberCheck 57
  s1. * 5  |
  \tempo 4. = 72 s1.
  s1. * 2 |
  
  \barNumberCheck 65
  s1. * 7  |
  \tempo "Meno mosso." 4. = 66 s1. |
  
  \barNumberCheck 73
  s1. * 8 |
  
  \barNumberCheck 81
  s1. * 3 |
  \tempo "Tempo I." 4. = 60 s1. |
  s1. * 4 |
  
  \barNumberCheck 89
  s1. * 3 |
  s2. s4. s8 \tempo 4. = 20 s \tempo 4. = 60 s |
  \tempo "Più mosso." 4. = 66 s1. |
  s1. * 3 |
  
  \barNumberCheck 97
  s1. * 6 |
  \tempo "Tempo I." 4. = 60 s1. |
}

%%% Output

\paper {
  ragged-right = ##f
  ragged-last-bottom = ##f
  min-systems-per-page = 5
  
  system-system-spacing =
    #'((basic-distance . 8) 
       (minimum-distance . 4)
       (padding . 2)
       (stretchability . 60)) % defaults: 12, 8, 1, 60
  
  last-bottom-spacing = 
    #'((basic-distance . 6)
       (minimum-distance . 4)
       (padding . 3)
       (stretchability . 30)) % defaults 1, 0, 1, 30
    
  top-system-spacing.minimum-distance = 10
    
  #(set-paper-size "letter")
  
  two-sided = ##t
  inner-margin = 12\mm
  outer-margin = 8\mm
}

\layout {
  \context {
    \Score
    \omit BarNumber
    \override Slur.details.free-head-distance = 0.5
  }
  \context {
    \Voice
    \override Tie.minimum-length = 2.5
  }
  % Helps keep dynamics from intersecting the span bar line.
  \context { 
    \Dynamics
    \consists Pure_from_neighbor_engraver
    \remove Bar_engraver
  }
  \context {
    \Staff
    \consists Span_arpeggio_engraver
    connectArpeggios = ##t
  }
}

\midi {
  \context {
    \Score
    midiMinimumVolume = #0.35
    midiMaximumVolume = #0.99
  }  
}

forceBreaks = {
  % page 1
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\pageBreak
  
  % page 2
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  \grace { s8 } s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\pageBreak
  
  % page 3
  s1.\noBreak s1.\break\noPageBreak
  \grace { s8 } s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  \grace { s8 } s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  \grace { s8 } s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\pageBreak
  
  % page 4
  \grace { s8 } s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  \grace { s8 } s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\pageBreak
  
  % page 5
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\pageBreak
  
  % page 6
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\pageBreak
  
  % page 7
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\pageBreak
  
  % page 8
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\pageBreak
  
  % page 9
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\noBreak s1.\break\noPageBreak
  \grace { s8 } s1.\noBreak s1.\break\noPageBreak
  s1.\noBreak s1.\pageBreak
  
  % page 10
  s1.\break\noPageBreak
  s1.\noBreak s1.\break\noPageBreak
  s1.\break\noPageBreak
  s1.\break\noPageBreak
}

\score { 
  \keepWithTag #'layout
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Dynamics \pedal
    \new Dynamics \tempi
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

\score { 
  \keepWithTag #'midi
  \articulate << 
    \new Score <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
  >>
  \midi {}
}
