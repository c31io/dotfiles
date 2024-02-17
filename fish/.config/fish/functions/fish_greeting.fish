function fish_greeting
    if test $TERM = "foot"
        set adage \
        " ℂ𝔸ℝℙ𝔼 𝔻𝕀𝔼𝕄" \
        " 𝕋𝔼𝕄ℙ𝕌𝕊 𝔽𝕌𝔾𝕀𝕋" \
        " ℙ𝔼ℝ 𝔸𝕊ℙ𝔼ℝ𝔸 𝔸𝔻 𝔸𝕊𝕋ℝ𝔸" \
        " 自強不息 厚德載物" \
        " 博學 審問 慎思 明辨 篤行" \
        " 夫唯不爭 故天下莫能與之爭" \
        " 禍兮福之所倚 福兮禍之所伏" \
        " 諸行無常 諸法無我 涅槃寂靜" \
        " 三不朽 立德 立功 立言" \
        " 游刃有餘 著力即差" \
        " 以德服人 心悅誠服"

        set_color brblue
        echo (random choice $adage)
    end
end
