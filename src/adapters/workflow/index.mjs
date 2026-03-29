const statusTokens = {
  todo: "TODO",
  active: "LIVE",
  blocked: "HOLD",
  done: "DONE",
};

export function buildWorkflowBoard({ title, lanes }) {
  return {
    title,
    lanes: lanes.map((lane) => ({
      id: lane.id,
      title: lane.title,
      tasks: lane.tasks.map((task) => ({
        id: task.id,
        title: task.title,
        status: task.status,
        statusLabel: statusTokens[task.status] ?? "INFO",
        summary: task.summary ?? "",
      })),
    })),
  };
}

export function renderWorkflowText(board) {
  const lines = [`Workflow: ${board.title}`];
  for (const lane of board.lanes) {
    lines.push(``);
    lines.push(`# ${lane.title}`);
    for (const task of lane.tasks) {
      lines.push(`- ${task.statusLabel} ${task.title}`);
      if (task.summary) {
        lines.push(`  ${task.summary}`);
      }
    }
  }
  return lines;
}
