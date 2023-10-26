function fish_greeting
    if test $TERM = "alacritty"
        set adage \
        " ℂ𝔸ℝℙ𝔼 𝔻𝕀𝔼𝕄" \
        " 𝕋𝔼𝕄ℙ𝕌𝕊 𝔽𝕌𝔾𝕀𝕋" \
        " ℙ𝔼ℝ 𝔸𝕊ℙ𝔼ℝ𝔸 𝔸𝔻 𝔸𝕊𝕋ℝ𝔸" \
        " 博學 審問 慎思 明辨 篤行" \
        " 夫唯不爭 故天下莫能與之爭" \
        " 諸行無常 諸法無我 涅槃寂靜"

        set_color brblue
        echo (random choice $adage)
    end
end
