# CodingKids# Lesson 2: Let’s Make It Dance! (Loops & Animation)

**Theme:** *"Programming is not about making something complex — it's about making something yours."*

## Goal

Introduce loops and basic animation in Scratch using the Conscious Competence method. End with students creating a mini-project (dancing character, animated concert, or simple game loop).

---
## 1. Welcome & Recap (10 min)

- Quick discussion: “What did we make last time?”
- Ask: “What’s a loop? Have you seen something repeat over and over?”
- Show a 1-minute demo: a cat that spins or dances forever

### 🔧 Demo Scratch Code: Dancing Cat

```
when green flag clicked
forever
  next costume
  wait 0.3 seconds
```

### 🔧 Optional: Add Movement

```
when green flag clicked
forever
  next costume
  turn 15 degrees
  wait 0.3 seconds
```

🗨️ Talk about what happens:
- The cat changes costumes again and again.
- It looks like it's dancing because of the `next costume` block.
- It keeps going because it's inside a `forever` loop.

## 2. Demo + Guided Build (25 min)

**Project: Dancing Character**

- Open Scratch
- Create a sprite or choose the cat
- Show how to:
  - Add a `forever` block
  - Add `next costume` and `wait` inside it
  - Add `when green flag clicked`

### 🔧 Base Animation Code

```
when green flag clicked
forever
  next costume
  wait 0.3 seconds
```

### 🔧 Add Rotation (Optional)

```
when green flag clicked
forever
  next costume
  turn 15 degrees
  wait 0.3 seconds
```

### 🔧 Add Movement (Optional)

```
when green flag clicked
forever
  move 10 steps
  next costume
  wait 0.3 seconds
```

### Conscious Competence Zones

- **Unconscious Incompetence:** Show a version missing the `wait` block → sprite flickers too fast
- **Conscious Incompetence:** Let them build it themselves, make mistakes
- **Conscious Competence:** Guide corrections
- **Unconscious Competence:** Let them remix it, add new sprites, or effects

## 3. Break & Movement Game (10 min)

- “Loop dance”: Each child creates a short 3–4 step dance
- The rest of the class repeats it continuously like a loop

### 🧠 Link to Code

- Ask: “What does this remind you of in Scratch?”
- Show the loop again on screen:

```
when green flag clicked
forever
  next costume
  wait 0.3 seconds
```

- Explain that loops repeat things forever or a set number of times, just like the class repeated the dance steps

## 4. Mini Challenge (20 min)

Let students choose one of the following projects. Support each child individually while reinforcing the use of `forever`, `repeat`, and `wait` blocks.

---

### 🎵 A. Dancing Band (Multiple Sprites)

Each sprite has a slightly different loop for animation or sound.

```
when green flag clicked
forever
  next costume
  wait 0.4 seconds
```

```
when green flag clicked
forever
  start sound [drum]
  next costume
  wait 0.5 seconds
```

---

### 🏀 B. Bouncing Ball Animation

```
when green flag clicked
set rotation style [left-right]
forever
  move 10 steps
  if on edge, bounce
```

---

### 🎶 C. Music Loop with Movement

```
when green flag clicked
forever
  play sound [meow]
  change x by 10
  wait 0.5 seconds
```

---

### 🕹️ D. Looping Motion Game Start

```
when green flag clicked
repeat 10
  move 10 steps
  turn 15 degrees
```

- Encourage remixing ideas and combining blocks
- Help them express something personal using loops and animation

## 5. Show & Tell (15 min)

- Each child presents their mini project to the group
- Encourage them to describe:
  - What they made
  - What loop they used
  - What part they figured out themselves

### 🧠 Reflection Prompts

- “What did you want to make?”
- “What worked well?”
- “What was hard at first?”
- “What would you like to add next time?”

### 🎉 Celebrate All Outcomes

- If something didn’t work, ask: “What did you learn from that?”
- If they helped someone else, highlight that: “You're now helping others — that's expert level!”

### 6. Closing & Next Step (10 min)

- Reflect: “What do you think loops are good for?”
- Optional Homework: Draw an idea for a project they want to build in the next lesson (game, concert, interactive story)

## 6. Closing & Next Step (10 min)

- Group reflection:
  - “What do you think loops are good for?”
  - “Where else do you see things repeat in real life?”
  - “What loop did you use today?”

- Talk briefly about what’s next:
  - “Next time, we’ll make our projects react when you click something or press a key!”

### ✏️ Optional Homework

- Ask students to draw an idea for their next Scratch project:
  - A game
  - A concert
  - A story
  - A dancing character

- They can bring their drawing or idea next time to turn it into code
