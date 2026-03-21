import type { ThinUiThemeDefinition } from "../contracts/types";
import { minimalSafeTheme } from "../adapters/minimal-safe";
import { thinUiC64Theme } from "../adapters/thinui-c64";

export const thinUiThemeRegistry: Record<string, ThinUiThemeDefinition> = {
  [thinUiC64Theme.id]: thinUiC64Theme,
  [minimalSafeTheme.id]: minimalSafeTheme,
};
