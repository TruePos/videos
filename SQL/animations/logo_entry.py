from manim import *

class LogoEntry(Scene):
    def construct(self):
        # Colors
        tp_color = '#1DE9B6'  # Cyan-like for 'TP'
        square_outline = '#E2B999'  # Light brown for outlines
        square_fill = '#E2B999'  # Same as outline for filled square

        # TP Text
        tp = Text("TP", font_size=110, color=tp_color, weight=BOLD)
        tp.shift(LEFT * 0.8 + UP * 0.5)

        # Squares
        square_size = 1.1
        gap = 0.18
        # Top right
        sq1 = RoundedRectangle(width=square_size, height=square_size, corner_radius=0.25, stroke_color=square_outline, stroke_width=6)
        sq1.move_to(RIGHT * 1.2 + UP * 0.5)
        # Bottom left
        sq2 = RoundedRectangle(width=square_size, height=square_size, corner_radius=0.25, stroke_color=square_outline, stroke_width=6)
        sq2.move_to(LEFT * 0.8 + DOWN * 1.1)
        # Bottom right (filled)
        sq3 = RoundedRectangle(width=square_size, height=square_size, corner_radius=0.25, stroke_color=square_outline, stroke_width=6, fill_color=square_fill, fill_opacity=1)
        sq3.move_to(RIGHT * 1.2 + DOWN * 1.1)

        # Animation
        self.play(Write(tp), run_time=0.8)
        self.play(
            Create(sq1),
            Create(sq2),
            Create(sq3),
            run_time=0.8
        )

        self.wait(0.2)
        
        # Subtle pop for filled square
        self.play(sq3.animate.scale(1.12), run_time=0.18)
        self.play(sq3.animate.scale(1/1.12), run_time=0.18)
        self.wait(0.7)

        # Fade out
        self.play(FadeOut(tp), FadeOut(sq1), FadeOut(sq2), FadeOut(sq3), run_time=0.7) 