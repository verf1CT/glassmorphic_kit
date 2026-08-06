figma.showUI(__html__, { width: 400, height: 400 });

function extractGlassProperties(node) {
  let blur = 10;
  let color = 'Colors.white.withOpacity(0.2)';
  let opacity = 0.2;
  
  if (node.fills && node.fills.length > 0) {
    const fill = node.fills[0];
    if (fill.type === 'SOLID') {
      const r = Math.round(fill.color.r * 255);
      const g = Math.round(fill.color.g * 255);
      const b = Math.round(fill.color.b * 255);
      opacity = fill.opacity !== undefined ? fill.opacity : 1;
      color = `Color.fromRGBO(${r}, ${g}, ${b}, ${opacity.toFixed(2)})`;
    }
  }

  if (node.effects && node.effects.length > 0) {
    const blurEffect = node.effects.find(e => e.type === 'BACKGROUND_BLUR' && e.visible);
    if (blurEffect) {
      blur = blurEffect.radius;
    }
  }

  return { blur, color, opacity };
}

figma.on('selectionchange', () => {
  const selection = figma.currentPage.selection;
  if (selection.length > 0) {
    const node = selection[0];
    const props = extractGlassProperties(node);
    figma.ui.postMessage({ type: 'selection', props });
  } else {
    figma.ui.postMessage({ type: 'selection-cleared' });
  }
});
