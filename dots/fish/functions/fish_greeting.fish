function fish_greeting
    set flake_lock ~/dotfiles/hosts/$hostname/flake.lock
    set empty_if_up_to_date (fd -p $flake_lock --changed-before 1M)
    if test -n "$empty_if_up_to_date"
        echo "flake lock is older than a month"
    end
    if test $TERM = alacritty
        set adage \
            " ℂ𝔸ℝℙ𝔼 𝔻𝕀𝔼𝕄" \
            " 𝕋𝔼𝕄ℙ𝕌𝕊 𝔽𝕌𝔾𝕀𝕋" \
            " ℙ𝔼ℝ 𝔸𝕊ℙ𝔼ℝ𝔸 𝔸𝔻 𝔸𝕊𝕋ℝ𝔸" \
            " 哀莫大於心死" \
            " 自強不息 厚德載物" \
            " 游刃有餘 著力即差" \
            " 以德服人 心悅誠服" \
            " 三不朽 立德 立功 立言" \
            " 博學 審問 慎思 明辨 篤行" \
            " 夫唯不爭 故天下莫能與之爭" \
            " 禍兮福之所倚 福兮禍之所伏" \
            " 諸行無常 諸法無我 涅槃寂靜"
        set_color brblue
        echo (random choice $adage)
    end
end
