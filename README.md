# Hello_Git - Windows Git BAT Toolkit

A small collection of Windows `.bat` helpers for common Git/GitHub workflows.

## Recommended entry point

Double-click:

```text
Git_Menu.bat
```

It provides shortcuts for the most common operations.

## Included tools

| File | Purpose |
|---|---|
| `clone_git.bat` | Clone one of your GitHub repositories by repository name |
| `Update_localfile_and_then_update_repo.bat` | Commit local changes, pull with rebase, then push |
| `pull_latest.bat` | Pull the latest changes for the current branch |
| `create_repo.bat` | Link the current folder to a GitHub repository and push it |
| `replace_repo_with_local_files.bat` | Replace remote `main` with local files using `--force-with-lease` |
| `git_status.bat` | Show status, current branch, and remotes |
| `create_branch.bat` | Create and switch to a new branch |
| `switch_branch.bat` | Switch between local branches |
| `merge_branch.bat` | Merge another branch into the current branch |
| `Git_Menu.bat` | Menu for launching the utilities above |

## Typical workflows

### 1. Clone an existing repository

Run `clone_git.bat`, then enter only the repository name, for example:

```text
FDCANBUS_Monitor
```

The script uses:

```text
https://github.com/dafeng0908/<repository>.git
```

### 2. Upload normal local changes

Run:

```text
Update_localfile_and_then_update_repo.bat
```

The script will:

1. Show `git status`
2. Ask for a commit message
3. Run `git add -A`
4. Commit only when staged changes exist
5. Run `git pull --rebase`
6. Push the current branch

### 3. Pull only

Run:

```text
pull_latest.bat
```

This is useful when you only want the newest remote changes without making a commit.

### 4. Push a new local project to GitHub

First create an empty repository on GitHub, then run:

```text
create_repo.bat
```

Enter the repository name when prompted.

### 5. Replace a remote repository with local files

Run:

```text
replace_repo_with_local_files.bat
```

**Warning:** This is intentionally protected by two confirmation steps. It uses `git push --force-with-lease`, which is safer than plain `--force`, but it can still rewrite remote history.

### 6. Branch workflow

Create a branch:

```text
create_branch.bat
```

Switch branch:

```text
switch_branch.bat
```

Merge a branch into the current branch:

```text
merge_branch.bat
```

## Requirements

- Windows Command Prompt
- Git installed and available as `git`
- GitHub authentication already configured for Git

## Safety notes

- Normal updates use `git pull --rebase` before pushing.
- The replace-repository helper uses `--force-with-lease`, not plain `--force`.
- Check `git_status.bat` before destructive operations when unsure.
