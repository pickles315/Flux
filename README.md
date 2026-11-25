# Flux

Flux is a browser-based video editor built as a static site for GitHub Pages.

## Run it

Open `index.html` locally, or enable GitHub Pages for this repository:
1. Open **Settings → Pages**.
2. Under **Build and deployment**, choose **Deploy from a branch**.
3. Select the `main` branch and `/ (root)`, then save.
4. Open the Pages URL GitHub displays.

## Current features

- Project dashboard to create, open, rename, duplicate, and delete projects.
- Project name, aspect ratio presets (16:9, 9:16, 1:1, 4:3, 21:9, custom dimensions), and frame-rate selection.
- Project-specific settings and timelines saved in IndexedDB.
- Import video, audio, and image files; MP3 and OGG are accepted when the browser can decode them.
- Imported media is stored in browser storage.
- Multiple video and audio tracks.
- Drag clips to move them; drag either clip edge to trim.
- Trimming cannot extend past the original source media duration.
- Clip properties, split, delete, timeline zoom, and keyboard shortcuts for playback/save/delete.
- Separate source and program monitors: preview selected media before adding it to the timeline, alongside the project output preview.
- Premiere-style workspace layout with media bin, source monitor, program monitor, properties inspector, and a full-width timeline.
- Preview dimensions adapt to the selected project aspect ratio.
- Export dialog with file name, WebM/MP4 format selection when supported by the browser, and quality presets.
- Export progress and cancellation.

## Export notes

Flux uses the browser's MediaRecorder API. Export runs in real time, so a long project can take approximately as long as its playback duration. MP4 is only offered when the current browser reports MP4 recording support; otherwise WebM is available. Flux does not rename WebM files to pretend they are MP4. Browser codec support varies. This is an early export implementation, not a replacement for a full offline rendering engine.

## Important storage note

Projects and imported media are stored on the device/browser where they were added. They do not automatically sync to another device or browser, and clearing site data can remove them. Export or back up important media separately.

## Current limitations

Flux is an evolving prototype, not a full Premiere Pro replacement yet. Audio files can be imported and placed on audio tracks, and audio is included in export where browser capture supports it, but dedicated audio monitoring/mixing controls, waveforms, transitions, effects, color grading, title compositing, and a full undo/redo history are not implemented yet. Some browser media codecs may not be supported.

## Browser support

Use a recent desktop version of Chrome or Edge for the best MediaRecorder and IndexedDB support. Firefox may work, but available export formats and codecs can differ. Storage limits depend on the browser and available device space.


## Windows desktop app

Flux can also be packaged as a Windows desktop application using Electron. The desktop wrapper loads the same local HTML/CSS/JavaScript editor, so the GitHub Pages browser version remains available.

### Automated Windows releases

Every push to `main` runs `.github/workflows/release.yml`. GitHub Actions builds:
- `Flux-Setup-<version>.0.exe`: Inno Setup installer with Start Menu shortcut and optional desktop shortcut.
- `Flux-<version>.0-Portable.exe`: portable Electron executable.

Release tags increment from `v1.0`, `v1.1`, `v1.2`, and so on. The installer uses a stable application ID. If an older Flux version is installed, setup asks whether to continue; accepting upgrades the existing installation in place. Flux project data remains in the app's local browser storage profile and is not intentionally removed by the installer.

To run the desktop app from source on Windows, install Node.js 22 or newer, then run `npm install` and `npm start`.
