# Flux

Flux is a browser-based video editor built as a static site for GitHub Pages.

## Run it

Open `index.html` locally, or enable GitHub Pages for this repository:
1. Open **Settings → Pages**.
2. Under **Build and deployment**, choose **Deploy from a branch**.
3. Select the `main` branch and `/ (root)`, then save.
4. Open the Pages URL GitHub displays.

## Current features

- Import video, audio, and image files.
- Keep imported media in browser storage (IndexedDB).
- Create and switch between multiple saved projects in the same browser.
- Basic two-track timeline, clip positioning, source-in and duration properties, split, delete, and zoom.
- Preview video and images.
- Experimental WebM preview export.

## Important storage note

Projects and imported media are stored on the device/browser where they were added. They do not automatically sync to another device or browser, and clearing site data can remove them. Export or back up important media separately.

## Current limitations

Flux is an early prototype, not a full Premiere Pro replacement yet. Timeline editing is basic; there is no drag-to-move or resize, transitions, effects, color grading, title compositing, or dependable full multi-track audio/video export yet. The current WebM export is experimental and should not be treated as a finished production export.

## Browser support

Use a recent desktop version of Chrome, Edge, or Firefox. Storage limits depend on the browser and available device space.
