# chopin-opus-60
[LilyPond](https://lilypond.org/) engraving source file used to create Chopin's Barcarolle, opus 60.

## Creating the PDF and MIDI files
(I highly recommend the [Frescobaldi](https://www.frescobaldi.org/) IDE for LilyPond.  It makes all of the following much easier.)

The PDF and MIDI files can be created by issuing the following command in the directory this file is in (assuming you have `lilypond` in your PATH variable):

        lilypond barcarolle-op60.ly

To create a smaller PDF, try:

        lilypond -dno-point-and-click barcarolle-op60.ly

You may also [download the latest release](https://github.com/ksnortum/chopin-opus-60/releases/latest) to get the compiled PDF and MIDI files.

## Errors and Warnings
It was my intent to create LilyPond source files that compiled without errors or warnings, but this was not possible.  When you compile you will see two errors and two warnings.  The warnings are from the `articulate.ly` inlcude file telling you it is stealling the entirety of a note's time.  These are notoriously difficult to track down and I was not able to find the source of the warnings.

The other two programming errors say that there is a cyclic dependency.  They are caused by a [LilyPond issue](https://gitlab.com/lilypond/lilypond/-/issues/6598) that has to do with cross-staff beams.

## Two-sided printing
The piece is set up so that it can be printed on two sides of the paper, leaving an extra margin amount on the inside pages for binding.  If you don't want this, find the `\paper` block and set `two-sided = ##f`.

## Thanks
Thanks to the folks at the [LilyPond user's mailing list](mailto://lilypond-user@gnu.org) for all the help getting LilyPond to do what I wanted.

## License
This work is licensed under the [Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/) from Creative Commons.  Follow the link for details.  Basically, you can use this work however you want *if* you keep the same license and you attribute the work to me, Knute Snortum (knute [at] snortum [dot] net).
