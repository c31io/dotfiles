function fish_greeting
    set lock_dir ~/dotfiles/hosts/$hostname
    set empty_if_up_to_date (fd flake.lock $lock_dir --changed-before 1month)
    if test -n "$empty_if_up_to_date"
        echo "flake lock is older than a month"
    end
    if test $TERM = alacritty -o $TERM = xterm-ghostty
        set adage \
            " ℂ𝔸ℝℙ𝔼 𝔻𝕀𝔼𝕄" \
            " 𝕋𝔼𝕄ℙ𝕌𝕊 𝔽𝕌𝔾𝕀𝕋" \
            " ℙ𝔼ℝ 𝔸𝕊ℙ𝔼ℝ𝔸 𝔸𝔻 𝔸𝕊𝕋ℝ𝔸" \
            " 𝔽𝔼𝕊𝕋𝕀ℕ𝔸 𝕃𝔼ℕ𝕋𝔼" \
            " 𝕊𝔸ℙ𝔼ℝ𝔼 𝔸𝕌𝔻𝔼" \
            " 哀莫大於心死" \
            " 自強不息 厚德載物" \
            " 游刃有餘 著力即差" \
            " 以德服人 心悅誠服" \
            " 三不朽 立德 立功 立言" \
            " 博學 審問 慎思 明辨 篤行" \
            " 夫唯不爭 故天下莫能與之爭" \
            " 禍兮福之所倚 福兮禍之所伏" \
            " 知止而後有定" \
            " 為學日益 為道日損" \
            " 君子不器" \
            " 行到水窮處 坐看雲起時" \
            " 應無所住 而生其心" \
            " 不積跬步 無以至千里" \
            " 同是天涯淪落人 相逢何必曾相識" \
            " 小娃撐小艇 偷採白蓮回" \
            " 且將新火試新茶 詩酒趁年華" \
            " 但願人長久 千里共嬋娟" \
            " 我與我周旋久 寧作我" \
            " 江山風月 本無常主 閒者便是主人" \
            " 此中有真意 欲辨已忘言" \
            " 諸行無常 諸法無我 涅槃寂靜"
        set_color brblue
        echo (random choice $adage)
    end
end
