function volume --wraps='echo (pactl list sinks | rg Volume | head -1 | awk {print $5}) (pactl list sinks | rg Mute)' --wraps='echo (pactl list sinks | rg Volume | head -1 | awk "{print $5}") (pactl list sinks | rg Mute)' --wraps=echo\ \(pactl\ list\ sinks\ \|\ rg\ Volume\ \|\ head\ -1\ \|\ awk\ \"\{print\ \\\}\"\)\ \(pactl\ list\ sinks\ \|\ rg\ Mute\) --wraps=echo\ \(pactl\ list\ sinks\ \|\ rg\ Volume\ \|\ head\ -1\ \|\ awk\ \"\{print\ \\\$5\}\"\)\ \(pactl\ list\ sinks\ \|\ rg\ Mute\) --description alias\ volume=echo\ \(pactl\ list\ sinks\ \|\ rg\ Volume\ \|\ head\ -1\ \|\ awk\ \"\{print\ \\\$5\}\"\)\ \(pactl\ list\ sinks\ \|\ rg\ Mute\)
  echo (pactl list sinks | rg Volume | head -1 | awk "{print \$5}") (pactl list sinks | rg Mute) $argv
        
end
