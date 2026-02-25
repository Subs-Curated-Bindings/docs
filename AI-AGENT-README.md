# Project Documentation

A modern documentation site built with [Zensical](https://zensical.org/), powered by the creators of Material for MkDocs.

## Getting Started

### Prerequisites

- Docker installed on your system

### Running the Server

Start the development server with live preview:

```bash
docker-compose up
```

Or run with Docker directly:

```bash
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs zensical/zensical
```

Then open your browser to:
```
http://localhost:8000
```

### Project Structure

```
project-docs/
├── mkdocs.yml          # Site configuration
├── docker-compose.yml  # Docker setup
├── docs/
│   ├── index.md        # Home page
│   └── ...             # Your documentation files
└── site/               # Built HTML output (generated)
```

## Editing Documentation

1. Edit markdown files in the `docs/` folder
2. Save changes - the site rebuilds automatically in the preview
3. View changes at http://localhost:8000

## Building for Production

Create a static HTML version:

```bash
docker run --rm -it -v ${PWD}:/docs zensical/zensical build
```

This generates the `site/` folder with static HTML files ready for deployment.

## Configuration

Edit `mkdocs.yml` to:
- Change site name and description
- Configure the theme and features
- Organize navigation structure
- Add plugins and extensions

See [Zensical Documentation](https://zensical.org/docs/setup/) for detailed configuration options.

## Deployment

The generated `site/` folder can be deployed to:
- GitHub Pages
- Netlify
- Vercel
- Any static hosting service
- Your own web server

## Resources

- [Zensical Docs](https://zensical.org/docs/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [Markdown Guide](https://www.markdownguide.org/)
