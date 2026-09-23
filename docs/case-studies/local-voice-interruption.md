# Case study: a local voice interface that owns its interruption

## The experience

The owner wanted to speak to a private local assistant and hear an answer.
The browser requests microphone access only after a deliberate Start action.
Local transcription feeds a protected language model, and a local speech
synthesizer returns audio incrementally. Ending the session releases capture;
interrupting it stops old playback and cancels owned work. Conversation has
no general command authority.

## What the tests exposed

The first speech activation demonstrated why syntax checks are smaller than
runtime proof: a native argument form passed service validation but failed
the executable's parser. After correction, live transcription and synthesis
worked. Independent review then injected a failure during transcription
shutdown and found that the active model turn could survive cleanup. A
guaranteed finalization path closed that gap; the failure test and a fresh
speech turn passed.

The browser added another boundary. A controlled audio fixture in real
Chrome moved through microphone capture, authenticated streaming, local
model output and browser playback. A bounded fallback recovered from an
audio-worklet bootstrap stall. End released both microphone capture and the
audio context. A separate interruption test discarded old events, then
accepted a new turn. An independent model-path check proved cancellation
of an active request rather than merely hiding its output in the interface.

Final review exposed a second cleanup gap: a failed send under backpressure
could enter Stop, attempt the same send and leave the microphone owned.
Session ownership now clears before the terminal notice, with capture
cleanup guaranteed even if that notice fails. Focused browser regressions
passed on the corrected served script. The full speech fixture had run on
the preceding script, so it is not presented as a repeat full-stack check
of this final cleanup change.

The first page styling also drew owner feedback: its warm green palette and
small text felt separate from Spark Home. A scoped visual correction is
limited to the stylesheet. Authenticated desktop and browser views at phone widths matched
Home's measured light colors, local Inter type and heading weight without
page errors or overflow; focus, error, reduced-motion and control-size checks
passed. Speech JavaScript stayed byte-identical. Dark-theme preference
synchronization and a repeat speech turn were outside this visual review.

## Evidence limits

The end-to-end browser result used fixture audio, not the owner's physical
microphone. It does not prove room acoustics, echo handling, subjective
speech quality, native worklet execution, a long session or recovery after
a machine reboot. No external test message or cloud inference was used.

The reusable rule is to verify every stage and its ownership transition.
An assistant that speaks once is still incomplete if End leaves a microphone
open or an interrupted model request running.
